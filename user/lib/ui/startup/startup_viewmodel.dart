import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/services/user_service.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  final _placesService = locator<PlacesService>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  Future<void> runStartupLogic() async {
    _placesService.initialize(
      apiKey: 'AIzaSyBzUeZcsTXODsZai6nbke65SyV_hbKdf7E',
    );

    if (_userService.hasLoggedInUser) {
      log.v('We have a user session on disk. Sync the user profile ...');
      await _userService.syncUserAccount();

      final currentUser = _userService.currentUser;
      log.v('User sync complete. User profile: $currentUser');
      _navigationService.replaceWith(Routes.homeView);

      if (currentUser == null) {
        _firebaseAuthenticationService.loginAnonymously();
        log.v('Current user is null log in anonymously and go to homeview');
      }
    } else {
      log.v('No user on disk, navigate to the homeview and log in anonymously');
      _firebaseAuthenticationService.loginAnonymously();
    }
  }
}
