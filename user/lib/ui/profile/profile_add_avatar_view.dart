import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/constants/app_urls.dart';
import 'package:xyz_prototype/ui/profile/profile_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class ProfileAddAvatarView extends StatelessWidget {
  const ProfileAddAvatarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      onModelReady: (model) => model.listenToUser(),
      builder: (context, model, child) => Scaffold(
        body: defaultFakeCardBody(
          context,
          model,
          initialPercentage: 0.6,
          minPercentage: 0.3,
          heading: model.clientData().clientAvatar == null
              ? 'Add your profile avatar'
              : 'Update your profile avatar',
          children: <Widget>[
            _selectImageButton(model),
            verticalSpaceRegular,
            _avatarPreview(
              context,
              model,
            ),
            verticalSpaceRegular,
            _addUserAvatarButton(model),
            verticalSpaceMedium,
            defaultBackAndContinue(
              goBack: model.goBack,
            )
          ],
        ),
      ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }

  Widget _selectImageButton(model) {
    return BoxButton.outline(
      title: 'Select Image to Upload',
      onTap: () => model.chooseUserAvatar(),
    );
  }

  Widget _addUserAvatarButton(model) {
    return BoxButton(
      title: model.clientData().clientAvatar != null
          ? 'Update Avatar'
          : 'Add Avatar',
      onTap: () => model.addUserAvatar(),
      busy: model.isBusy,
    );
  }

  Widget _avatarPreview(context, model) {
    final _previewHeight = screenHeightPercentage(context, percentage: 0.2);

    if (model.selectedImage == null) {
      return Center(child: BoxText.body('Image Preview'));
    } else {
      return Container(
        height: _previewHeight,
        width: _previewHeight,
        child: ClipRRect(
          borderRadius: defaultBorderRadius,
          child: Image.file(
            File(model.selectedImage.path),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
