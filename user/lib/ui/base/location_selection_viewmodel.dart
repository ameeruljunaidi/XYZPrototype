import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/constants/app_strings.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/gig_service.dart';
import 'package:xyz_prototype/services/user_service.dart';
import 'package:xyz_prototype/ui/address_selection/address_selection_view.form.dart';

abstract class LocationSelectionViewModel extends FormViewModel {
  final log = getLogger('LocationServiceViewModel');
  final _placesServices = locator<PlacesService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _gigService = locator<GigService>();

  List<PlacesAutoCompleteResult> _autoCompleteResults = [];
  List<PlacesAutoCompleteResult> get autoCompleteResults =>
      _autoCompleteResults;
  bool get hasAutocompleteResults => _autoCompleteResults.isNotEmpty;

  PlacesAutoCompleteResult? _selectedResult;
  bool get hasSelectedPlace => _selectedResult != null;

  Future<bool> saveLocation({required address, user, gig});

  Future<void> getAutoCompleteResults() async {
    if (addressValue != '') {
      final placesResults =
          await _placesServices.getAutoComplete(addressValue!);

      _autoCompleteResults = placesResults;
      notifyListeners();
    }
  }

  Future<void> selectAddressSuggestion(
      {PlacesAutoCompleteResult? autoCompleteResults, successRouteView}) async {
    final selectedResult = autoCompleteResults ?? _selectedResult!;

    log.i('Selected $autoCompleteResults as the suggestion');

    if (selectedResult.placeId == null) {
      _dialogService.showDialog(
        title: InvalidAutoCompleteDialogTitle,
        description: InvalidAutoCompleteDialogDescription,
      );
    } else {
      setBusy(true);

      final placeDetails =
          await _placesServices.getPlaceDetails(selectedResult.placeId ?? '');
      log.v('Place Details: $placeDetails');

      final address = Address(
        placeId: placeDetails.placeId!,
        latitude: placeDetails.lat ?? -1,
        longitude: placeDetails.lng ?? -1,
        city: placeDetails.city,
        postalCode: placeDetails.zip,
        state: placeDetails.state,
        street: placeDetails.streetLong ?? placeDetails.streetShort,
        streetNumber: placeDetails.streetNumber,
      );

      final user = _userService.currentUser;
      final gig = _gigService.currentGig;

      final saveSuccess =
          await saveLocation(address: address, user: user, gig: gig);

      if (!saveSuccess) {
        log.v('Address saved failed. Notify user to try again.');
        _dialogService.showDialog(
          title: AddressSaveFailedDialogTitle,
          description: AddressSaveFailedDialogDescription,
        );
      } else {
        log.v('Address saved! We are ready to show some products');
        log.v('currentRoute: ${_navigationService.currentRoute}');

        _navigationService.navigateWithTransition(successRouteView,
            transition: 'fade');
      }

      setBusy(false);
    }
  }

  void selectSelectedSuggestion(PlacesAutoCompleteResult autoCompleteResults) {
    log.i('autoCompleteResults: $autoCompleteResults');
    _selectedResult = autoCompleteResults;

    notifyListeners();
  }
}
