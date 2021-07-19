import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/ui/address_selection/address_selection_view.form.dart';

class AddressSelectionViewModel extends FormViewModel {
  final _placesServices = locator<PlacesService>();

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

      if (placesResults != null) {
        _autoCompleteResults = placesResults;
        notifyListeners();
      }
    }
  }
}
