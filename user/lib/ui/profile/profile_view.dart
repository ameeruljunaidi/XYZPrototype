import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/ui/profile/profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: Center(child: Text('Profile View')),
      ),
      viewModelBuilder: () => locator<ProfileViewModel>(),
    );
  }
}
