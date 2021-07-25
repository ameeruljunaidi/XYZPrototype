// ignore: unused_import
import 'package:stacked/stacked.dart';
// ignore: implementation_imports
import 'package:stacked_firebase_auth/src/firebase_authentication_service.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/ui/base/authentication_viewmodel.dart';
import 'package:xyz_prototype/ui/create_account/create_account_view.form.dart';

class CreateAccountViewModel extends AuthenticationViewModel {
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  CreateAccountViewModel() : super(successRoute: Routes.homeView);

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService.createAccountWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );

  void navigateBack() => navigationService.back();
}
