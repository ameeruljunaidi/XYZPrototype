import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:places_service/places_service.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/constants/app_strings.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/ui/address_selection/address_selection_viewmodel.dart';

import '../helpers/test_helpers.dart';

AddressSelectionViewModel _getModel() => AddressSelectionViewModel();

void main() {
  group('AddressSelectionViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('selectAddressSuggestion -', () {
      test(
          'When called with autoCompleteResult that has an id, should get place details using that id',
          () async {
        final placesService = getAndRegisterPlacesService();
        final model = _getModel();
        final placeIdInResult = 'id_to_us';
        await model.selectAddressSuggestion(
            autoCompleteResults:
                PlacesAutoCompleteResult(placeId: placeIdInResult));
        verify(placesService.getPlaceDetails(any));
      });

      test(
          'When called with autoCompleteResult that has no id, should should call dialog service to show custom dialog',
          () async {
        final dialogService = getAndRegisterDialogService();
        final model = _getModel();
        await model.selectAddressSuggestion(
            autoCompleteResults: PlacesAutoCompleteResult());
        verify(dialogService.showDialog(
          title: InvalidAutoCompleteDialogTitle,
          description: InvalidAutoCompleteDialogDescription,
        ));
      });

      test('When placesDetail retrieved, should run saveAddress to Firestore',
          () async {
        final firestoreApi = getAndRegisterFirestoreApi();
        final model = _getModel();
        await model.selectAddressSuggestion(
            autoCompleteResults: PlacesAutoCompleteResult(placeId: 'id'));
        verify(firestoreApi.saveAddress(
          address: anyNamed('address'),
          user: anyNamed('user'),
        ));
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
        final model = _getModel();

        await model.selectAddressSuggestion(
            autoCompleteResults: PlacesAutoCompleteResult(placeId: 'id'));

        verify(firestoreApi.saveAddress(
            address: Address(
              placeId: 'placeId',
              latitude: 19,
              longitude: 20,
              city: 'Paarl',
              postalCode: '144',
              state: 'Western Cape',
              street: 'Langen Hofen Road',
              streetNumber: '78',
            ),
            user: anyNamed('user')));
      });

      test(
          'When placesDetail return no values, use default value for non-required values',
          () async {
        final firestoreApi = getAndRegisterFirestoreApi();
        final placeDetailsToReturn = PlacesDetails(
          placeId: 'placeId',
        );

        getAndRegisterPlacesService(placesDetails: placeDetailsToReturn);
        final model = _getModel();

        await model.selectAddressSuggestion(
            autoCompleteResults: PlacesAutoCompleteResult(placeId: 'id'));

        verify(firestoreApi.saveAddress(
            address: Address(
              placeId: 'placeId',
              latitude: -1,
              longitude: -1,
            ),
            user: anyNamed('user')));
      });

      test('When saving address to Firestore fails show a dialog', () async {
        final dialogService = getAndRegisterDialogService();
        getAndRegisterFirestoreApi(saveAddressSuccess: false);
        final model = _getModel();
        await model.selectAddressSuggestion(
            autoCompleteResults: PlacesAutoCompleteResult(placeId: 'id'));
        verify(
          dialogService.showDialog(
            title: AddressSaveFailedDialogTitle,
            description: AddressSaveFailedDialogDescription,
          ),
        );
      });

      test('When saving address to Firestore succeed, go to homeView',
          () async {
        final navigationService = getAndRegisterNavigationService();
        getAndRegisterFirestoreApi(saveAddressSuccess: true);
        final model = _getModel();
        await model.selectAddressSuggestion(
            autoCompleteResults: PlacesAutoCompleteResult(placeId: 'id'));
        verify(
          navigationService.clearStackAndShow(Routes.homeView),
        );
      });

      test(
          'When placesDetails retrieved, get userId from userService to get id',
          () async {
        final userService = getAndRegisterUserService();
        final model = _getModel();

        await model.selectAddressSuggestion(
            autoCompleteResults: PlacesAutoCompleteResult(placeId: 'id'));
        verify(userService.currentUser);
      });
    });
  });
}
