import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/ui/dumb_widgets/authentication_layout.dart';
import 'package:xyz_prototype/ui/login/login_view.form.dart';
import 'package:xyz_prototype/ui/login/login_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoxButton(
      title: 'Login/Sign Up',
      onTap: () {
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) => Container(
            decoration: BoxDecoration(borderRadius: defaultBorderRadius),
            height: screenHeightPercentage(context, percentage: 0.9),
            child: ViewModelBuilder<LoginViewModel>.reactive(
              onModelReady: (model) => listenToFormUpdated(model),
              builder: (context, model, child) => Scaffold(
                body: AuthenticationLayout(
                  title: 'Welcome',
                  subtitle: 'Enter your email address and password to sign in.',
                  mainButtonTitle: 'SIGN IN',
                  form: Column(
                    children: <Widget>[
                      BoxInputField(
                        controller: emailController,
                        placeholder: 'Email',
                      ),
                      verticalSpaceRegular,
                      BoxInputField(
                        placeholder: 'Password',
                        controller: passwordController,
                      ),
                    ],
                  ),
                  onSignInWithGoogle: model.useGoogleAuthentication,
                  onSignInWithApple: model.useGoogleAuthentication,
                  onMainButtonTapped: () => model.saveData(),
                  onCreateAccountTapped: model.navigateToCreateAccount,
                  validationMessage: model.validationMessage,
                  onForgotPassword: () {},
                  busy: model.isBusy,
                ),
              ),
              viewModelBuilder: () => LoginViewModel(),
            ),
          ),
        );
      },
    );
  }
}
