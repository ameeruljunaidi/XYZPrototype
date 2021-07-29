import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/ui/base/location_selection_viewmodel.dart';

class AddressSelectionViewModel extends LocationSelectionViewModel {
  final log = getLogger('AddressSelectionViewModel');
  final _firestoreApi = locator<FirestoreApi>();

  @override
  void setFormStatus() {
    getAutoCompleteResults();
  }

  @override
  Future<bool> saveLocation({required address, user, gig}) =>
      _firestoreApi.saveAddress(
        address: address,
        user: user,
      );
}
