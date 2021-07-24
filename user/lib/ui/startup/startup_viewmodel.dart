import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/services/user_service.dart';
import 'package:xyz_prototype/ui/base/authentication_viewmodel.dart';

class StartUpViewModel extends AuthenticationViewModel {
  final log = getLogger('StartUpViewModel');
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  final _placesService = locator<PlacesService>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  Future<void> runStartupLogic() async {
    if (_userService.hasLoggedInUser) {
      log.v('We have a user session on disk. Sync the user profile ...');
      await _userService.syncUserAccount();

      final currentUser = _userService.currentUser;
      log.v('User sync complete. User profile: $currentUser');
      _navigationService.replaceWith(Routes.homeView);

      if (currentUser == null) {
        _firebaseAuthenticationService.logout();
        loginWithoutAccount();
        log.v(
            'Current user is null, logout, log in anonymously and go to homeview');
      }
    } else {
      log.v('No user on disk, navigate to the homeview and log in anonymously');
      loginWithoutAccount();
    }
  }

  StartUpViewModel() : super(successRoute: Routes.homeView);

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService.loginAnonymously();
}
