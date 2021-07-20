import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/ui/create_account/create_account_view.form.dart';
import 'package:xyz_prototype/ui/create_account/create_account_viewmodel.dart';
import 'package:xyz_prototype/ui/dumb_widgets/authentication_layout.dart';
import 'package:xyz_ui/xyz_ui.dart';

@FormView(
  fields: [
    FormTextField(name: 'fullName'),
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class CreateAccountView extends StatelessWidget with $CreateAccountView {
  CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        body: AuthenticationLayout(
          title: 'Create Account',
          subtitle: 'Enter your name, email, and password to sign up.',
          mainButtonTitle: 'SIGN UP',
          form: Column(
            children: <Widget>[
              BoxInputField(
                placeholder: 'Full Name',
                controller: fullNameController,
              ),
              verticalSpaceRegular,
              BoxInputField(
                placeholder: 'Email',
                controller: emailController,
              ),
              verticalSpaceRegular,
              BoxInputField(
                placeholder: 'Password',
                controller: passwordController,
              ),
            ],
          ),
          busy: model.isBusy,
          showTermsText: true,
          onMainButtonTapped: () => model.saveData(),
          onBackPressed: model.navigateBack,
          validationMessage: model.validationMessage,
        ),
      ),
      viewModelBuilder: () => CreateAccountViewModel(),
    );
  }
}
