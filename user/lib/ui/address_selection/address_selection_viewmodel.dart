import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/constants/app_strings.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/ui/address_selection/address_selection_view.form.dart';

class AddressSelectionViewModel extends FormViewModel {
  final log = getLogger('AddressSelectionViewModel');
  final _placesServices = locator<PlacesService>();
  final _dialogService = locator<DialogService>();
  final _firestoreApi = locator<FirestoreApi>();

  List<PlacesAutoCompleteResult> _autoCompleteResults = [];

  List<PlacesAutoCompleteResult> get autoCompleteResults =>
      _autoCompleteResults;

  bool get hasAutocompleteResults => _autoCompleteResults.isNotEmpty;

  @override
  void setFormStatus() {
    _getAutoCompleteResults();
  }

  Future<void> _getAutoCompleteResults() async {
    if (addressValue != null) {
      final placesResults =
          await _placesServices.getAutoComplete(addressValue!);

      _autoCompleteResults = placesResults;
      notifyListeners();
    }
  }

  Future<void> selectAddressSuggestion(
      PlacesAutoCompleteResult autoCompleteResults) async {
    log.i('Selected $autoCompleteResults as the suggestion');

    if (autoCompleteResults.placeId == null) {
      _dialogService.showDialog(
        title: InvalidAutoCompleteDialogTitle,
        description: InvalidAutoCompleteDialogDescription,
      );
    } else {
      final placeDetails = await _placesServices
          .getPlaceDetails(autoCompleteResults.placeId ?? '');
      log.v('Place Details: $placeDetails');

      final address = Address(
        placeId: placeDetails.placeId!,
        latitude: placeDetails.lat ?? -1,
        longitude: placeDetails.lng ?? -1,
        city: placeDetails.city,
        postalCode: placeDetails.zip,
        state: placeDetails.state,
        street: placeDetails.streetLong ?? placeDetails.streetShort,
      );

      await _firestoreApi.saveAddress(address: address);
    }
  }
}
