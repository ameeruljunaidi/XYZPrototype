import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:places_service/places_service.dart';
import 'package:xyz_prototype/constants/app_strings.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/ui/address_selection/address_selection_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AddressSelectionViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('selectAddressSuggestion -', () {
      test(
          'When called with autoCompleteResult that has an id, should get place details using that id',
          () async {
        final placesService = getAndRegisterPlacesService();
        final model = AddressSelectionViewModel();
        final placeIdInResult = 'id_to_us';
        await model.selectAddressSuggestion(
            PlacesAutoCompleteResult(placeId: placeIdInResult));
        verify(placesService.getPlaceDetails(any));
      });

      test(
          'When called with autoCompleteResult that has no id, should should call dialog service to show custom dialog',
          () async {
        final dialogService = getAndRegisterDialogService();
        final model = AddressSelectionViewModel();
        await model.selectAddressSuggestion(PlacesAutoCompleteResult());
        verify(dialogService.showDialog(
          title: InvalidAutoCompleteDialogTitle,
          description: InvalidAutoCompleteDialogDescription,
        ));
      });

      test('When placesDetail retrieved, should run saveAddress to Firestore',
          () async {
        final firestoreApi = getAndRegisterFirestoreApi();
        final model = AddressSelectionViewModel();
        await model
            .selectAddressSuggestion(PlacesAutoCompleteResult(placeId: 'id'));
        verify(firestoreApi.saveAddress(address: anyNamed('address')));
      });

      test('When placesDetail return all values, copy it over to the address',
          () async {
        final firestoreApi = getAndRegisterFirestoreApi();
        final placeDetailsToReturn = PlacesDetails(
          city: 'Paarl',
          lat: 19,
          lng: 20,
          placeId: 'placeId',
          state: 'Western Cape',
          streetLong: 'Langen Hofen Road',
          streetNumber: '78',
          streetShort: 'Langen hofen Rd',
          zip: '144',
        );

        getAndRegisterPlacesService(placesDetails: placeDetailsToReturn);

        final model = AddressSelectionViewModel();
        await model
            .selectAddressSuggestion(PlacesAutoCompleteResult(placeId: 'id'));
        verify(firestoreApi.saveAddress(
            address: Address(
          placeId: 'placeId',
          latitude: 19,
          longitude: 20,
          city: 'Paarl',
          postalCode: '144',
          state: 'Western Cape',
          street: 'Langen hofen Road',
        )));
      });
    });
  });
}
