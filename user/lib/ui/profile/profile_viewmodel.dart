import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/enums/basic_dialog_status.dart';
import 'package:xyz_prototype/enums/dialog_type.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/user_service.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _dialogService = locator<DialogService>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  Client clientData() {
    return _userService.currentUser ??
        Client(
            clientId: 'anonymous',
            clientType: 'anonymous',
            clientRegistrationDate: 'anonymous');
  }

  Future<void> goToAddBusiness() async {
    await _navigationService.navigateTo(Routes.addBusinessView);
  }

  void goToLoginView() {
    _navigationService.navigateTo(Routes.loginView);
  }

  void logOut() async {
    var logOut = await _dialogService.showCustomDialog(
      variant: DialogType.basic,
      data: BasicDialogStatus.warning,
      mainButtonTitle: 'Log Out',
      secondaryButtonTitle: 'Go Back',
      description: 'Are you sure you want to log out?',
      title: 'Log Out',
    );

    if (logOut!.confirmed) {
      _userService.logOut();
      _firebaseAuthenticationService.loginAnonymously();
      _navigationService.clearStackAndShow(Routes.homeView);
    }
  }

  void goToGigManagerView() async {
    final _currentUser = _userService.currentUser!;

    if (_currentUser.isBusiness) {
      _navigationService.navigateTo(Routes.gigManagerView);
    } else {
      var confirmToBeGig = await _dialogService.showConfirmationDialog(
          confirmationTitle: 'Continue',
          cancelTitle: 'Cancel',
          description:
              'To view and manage gigs, become on of our growing number of giggers!',
          title: 'Become a Gigger');

      if (confirmToBeGig!.confirmed) {
        _navigationService.navigateTo(Routes.addBusinessView);
      }
    }
  }

  void listenToUser() {
    setBusy(true);
    _userService.listenToUser();
    setBusy(false);
  }
}
