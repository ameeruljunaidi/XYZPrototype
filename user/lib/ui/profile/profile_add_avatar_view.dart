import 'dart:io';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/profile/profile_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class ProfileAddAvatarView extends StatelessWidget {
  const ProfileAddAvatarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      onModelReady: (model) => model.listenToUser(),
      builder: (context, model, child) => Scaffold(
          body: defaultSliverScreen(
        context,
        model,
        cancelButton: model.goBack,
        goBack: model.goBack,
        heading: model.clientData().clientAvatar == null
            ? 'Add your profile avatar'
            : 'Update your profile avatar',
        sliverBodyContent: _mainBody(context, model),
      )),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }

  Widget _mainBody(context, model) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: defaultPaddingAll,
        child: Column(
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
          ],
        ),
      ),
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
