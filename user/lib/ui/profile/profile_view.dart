import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/ui/profile/profile_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BoxButton(
                title: 'Become a Gigger',
                onTap: model.goToAddBusiness,
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => locator<ProfileViewModel>(),
    );
  }
}
