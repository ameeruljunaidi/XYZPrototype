import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/models/application_models.dart';

class UserService {
  final log = getLogger('UserService');

  final _firestoreApi = locator<FirestoreApi>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  Client? _currentClient;

  Client? get currentUser => _currentClient;

  bool get hasLoggedInUser => _firebaseAuthenticationService.hasUser;

  Future<void> syncUserAccount() async {
    final firebaseUserId =
        _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;

    log.v('Sync user $firebaseUserId');

    final userAccount = await _firestoreApi.getUser(clientId: firebaseUserId);

    if (userAccount != null) {
      log.v('User account exists. Save as _currentClient');
      _currentClient = userAccount;
    }
  }

  Future<void> syncOrCreateUserAccount({required Client client}) async {
    log.i('User:$client');

    await syncUserAccount();

    if (currentUser == null) {
      log.v('We have no user account. Create a new user.');
      await _firestoreApi.createUser(client: client);
      _currentClient = client;
      log.v('_currentUser has been saved');
    }
  }
}
