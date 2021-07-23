import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';

class GigManagerViewModel extends BaseViewModel {
  final log = getLogger('AddBusinessViewModel');
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _firestoreApi = locator<FirestoreApi>();

  void goToAddGigView() {
    _navigationService.navigateTo(Routes.addGigView);
  }

  void goBack() {
    _navigationService.back();
  }
}
