import 'package:flutter/foundation.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/constants/app_keys.dart';
import 'package:xyz_prototype/exceptions/firestore_api_exceptions.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/user_service.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final log = getLogger('AuthenticationViewModel');

  final userService = locator<UserService>();
  final NavigationService navigationService = locator<NavigationService>();
  final FirebaseAuthenticationService _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  void setFormStatus() {}

  Future saveData() async {
    log.i('valued:$formValueMap');

    try {
      final result = await runBusyFuture(
        runAuthentication(),
        throwException: true,
      );
      await _handleAuthenticationResponse(result);
    } on FirestoreApiException catch (e) {
      log.e(e.toString());
      setValidationMessage(e.toString());
    }
  }

  Future<void> useGoogleAuthentication() async {
    final result = await _firebaseAuthenticationService.signInWithGoogle();
    await _handleAuthenticationResponse(result);
  }

  Future<void> useAppleAuthentication() async {
    final result = await _firebaseAuthenticationService.signInWithApple(
      appleRedirectUri: 'https://xyz-co-58d6f.firebaseapp.com/__/auth/handler',
      appleClientId: '',
    );
    await _handleAuthenticationResponse(result);
  }

  Future<void> loginWithoutAccount() async {
    final result = await _firebaseAuthenticationService.loginAnonymously();
    await _handleAuthenticationResponse(result);
  }

  Future<FirebaseAuthenticationResult> runAuthentication();

  Future<void> _handleAuthenticationResponse(
      FirebaseAuthenticationResult authResult) async {
    if (!authResult.hasError && authResult.user != null) {
      final client = authResult.user!;

      await userService.syncOrCreateUserAccount(
        client: Client(
          clientId: client.uid,
          clientEmail: client.email,
          clientType: describeEnum(ClientType.user),
          clientRegistrationDate: defaultRegistrationDate,
        ),
      );

      if (client.email != null) {
        navigationService.clearStackAndShow(successRoute);
      }
    } else {
      if (!authResult.hasError && authResult.user == null) {
        log.wtf(
            'We have no error but the user is null. This should not be happening.');
      }

      log.w('Authentication failed! ${authResult.errorMessage}');

      setValidationMessage(authResult.errorMessage);
      notifyListeners();
    }
  }
}
