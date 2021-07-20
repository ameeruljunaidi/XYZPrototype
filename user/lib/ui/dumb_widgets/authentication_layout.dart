import 'dart:io';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:xyz_ui/xyz_ui.dart';

class AuthenticationLayout extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? mainButtonTitle;
  final Widget? form;
  final bool? showTermsText;
  final void Function()? onMainButtonTapped;
  final Function()? onCreateAccountTapped;
  final Function()? onForgotPassword;
  final Function()? onBackPressed;
  final Function()? onSignInWithApple;
  final Function()? onSignInWithGoogle;
  final String? validationMessage;
  final bool? busy;

  const AuthenticationLayout(
      {Key? key,
      this.title,
      this.subtitle,
      this.mainButtonTitle,
      this.form,
      this.showTermsText,
      this.onMainButtonTapped,
      this.onCreateAccountTapped,
      this.onForgotPassword,
      this.onBackPressed,
      this.validationMessage,
      this.busy,
      this.onSignInWithApple,
      this.onSignInWithGoogle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ListView(
        children: <Widget>[
          if (onBackPressed == null) verticalSpaceLarge,
          if (onBackPressed != null) verticalSpaceRegular,
          if (onBackPressed != null)
            IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: onBackPressed,
            ),
          Text(
            title!,
            style: TextStyle(fontSize: 34.0),
          ),
          verticalSpaceSmall,
          SizedBox(
            width: screenWidthPercentage(context, percentage: 0.7),
            child: Text(
              subtitle!,
              style: ktsMediumGreyBodyText,
            ),
          ),
          verticalSpaceRegular,
          form!,
          verticalSpaceRegular,
          if (onForgotPassword != null)
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onForgotPassword,
                child: Text('Forgot Password',
                    style: ktsMediumGreyBodyText.copyWith(
                        fontWeight: FontWeight.bold)),
              ),
            ),
          verticalSpaceRegular,
          if (validationMessage != null)
            Text(
              validationMessage!,
              style: TextStyle(
                color: Colors.red,
                fontSize: kBodyTextSize,
              ),
            ),
          if (validationMessage != null) verticalSpaceRegular,
          GestureDetector(
            onTap: onMainButtonTapped,
            child: Container(
              width: double.infinity,
              height: 50.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: busy!
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                        Colors.white,
                      ),
                    )
                  : Text(
                      mainButtonTitle!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
            ),
          ),
          verticalSpaceRegular,
          if (onCreateAccountTapped != null)
            GestureDetector(
              onTap: onCreateAccountTapped,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Don\'t have an account?'),
                  horizontalSpaceTiny,
                  Text(
                    'Create an account',
                    style: TextStyle(color: kcPrimaryColor),
                  ),
                ],
              ),
            ),
          if (showTermsText == true)
            Text(
              'By signing up you agree ot our terms, conditions, and privacy policy',
              style: ktsMediumGreyBodyText,
              textAlign: TextAlign.center,
            ),
          verticalSpaceRegular,
          Align(
            alignment: Alignment.center,
            child: Text(
              'Or',
              style: ktsMediumGreyBodyText,
            ),
          ),
          if (Platform.isIOS) verticalSpaceRegular,
          if (Platform.isIOS)
            AppleAuthButton(
              // onPressed: onSignInWithApple ?? () {},
              onPressed: () {},
              text: 'CONTINUE WITH APPLE',
              style: AuthButtonStyle(
                iconSize: 24.0,
                height: 50.0,
                buttonType: AuthButtonType.secondary,
                textStyle: TextStyle(fontSize: 14.0),
              ),
            ),
          verticalSpaceRegular,
          GoogleAuthButton(
            // onPressed: onSignInWithGoogle ?? () {},
            onPressed: () {},
            text: 'CONTINUE WITH GOOGLE',
            style: AuthButtonStyle(
              iconSize: 24.0,
              height: 50.0,
              buttonType: AuthButtonType.secondary,
              textStyle: TextStyle(fontSize: 14.0),
            ),
          )
        ],
      ),
    );
  }
}
