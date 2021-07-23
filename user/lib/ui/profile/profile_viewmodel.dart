import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/user_service.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _dialogService = locator<DialogService>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  void goToAddBusiness() {
    _navigationService.navigateTo(Routes.addBusinessView);
  }

  Client clientData() {
    return _userService.currentUser!;
  }

  void logOut() async {
    var logOut = await _dialogService.showConfirmationDialog(
      confirmationTitle: 'Log Out',
      cancelTitle: 'Go Back',
      description: 'Are you sure you want to log out?',
      title: 'Log Out',
    );

    if (logOut!.confirmed) {
      _firebaseAuthenticationService.logout();
      _navigationService.clearStackAndShow(Routes.startupView);
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
}
