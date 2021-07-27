import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/ui/base/authentication_viewmodel.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:xyz_prototype/ui/create_account/create_account_view.dart';
import 'package:xyz_prototype/ui/login/login_view.form.dart';

class LoginViewModel extends AuthenticationViewModel {
  final _signUpService = locator<CreateAccountView>();
  final _navigationService = locator<NavigationService>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService.loginWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );

  void navigateToCreateAccount(context) async {
    await _signUpService.signUpModal(context);
    _navigationService.back();
    notifyListeners();
  }
}
