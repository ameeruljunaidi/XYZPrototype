import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/services/gig_service.dart';
import 'package:xyz_prototype/ui/base/location_selection_viewmodel.dart';

class AddGigLocationViewModel extends LocationSelectionViewModel {
  final log = getLogger('AddressSelectionViewModel');
  final _firestoreApi = locator<FirestoreApi>();
  final _navigationService = locator<NavigationService>();
  final _gigService = locator<GigService>();

  @override
  Future<bool> saveLocation({required address, user, gig}) =>
      _firestoreApi.saveAddress(
        address: address,
        gig: gig,
      );

  @override
  void setFormStatus() {
    getAutoCompleteResults();
  }

  Future<bool> cancelAddGig() async {
    setBusy(true);
    final _loadedGig = _gigService.currentGig;

    _firestoreApi.deleteGig(_loadedGig!.gigId!);
    _gigService.clearGig();

    setBusy(false);

    _navigationService.back();
    return Future.value(true);
  }
}
