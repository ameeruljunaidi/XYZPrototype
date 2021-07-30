import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/constants/app_keys.dart';
import 'package:xyz_prototype/constants/app_urls.dart';
import 'package:xyz_prototype/ui/profile/profile_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';
import 'package:xyz_prototype/extensions/string_extensions.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      onModelReady: (model) => model.listenToUser(),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: ColorfulSafeArea(
          color: kcVeryLightGreyColor,
          child: Column(
            children: [
              _profileTopBar(context, model),
              verticalSpaceRegular,
              _profileSettingsList(model),
              if (model.clientData().isAnonymous)
                _logInOrSignUpButton(model, context),
              if (model.clientData().clientType ==
                      describeEnum(ClientType.user) &&
                  !model.clientData().isAnonymous)
                _becomeBusinessButton(model, context),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => locator<ProfileViewModel>(),
    );
  }

  Widget _becomeBusinessButton(ProfileViewModel model, BuildContext context) {
    return Padding(
      padding: defaultPaddingAll,
      child: BoxButton(
        title: 'Become a Partner',
        onTap: () => model.goToAddBusiness(context),
      ),
    );
  }

  Widget _logInOrSignUpButton(ProfileViewModel model, BuildContext context) {
    return Padding(
      padding: defaultPaddingAll,
      child: BoxButton(
        onTap: () => model.goToLoginView(context),
        title: 'Log In or Sign Up',
      ),
    );
  }

  Widget _profileSettingsWidget({text, onTap, tileColor, textColor, icon}) {
    return Column(
      children: [
        ListTile(
          contentPadding: defaultPaddingHorizontal,
          title: BoxText.subheading(
            text,
            color: textColor,
          ),
          onTap: onTap,
          tileColor: tileColor,
          trailing: icon,
        ),
        Divider(),
      ],
    );
  }

  Widget _profileSettingsList(model) {
    return Expanded(
      child: ListView(
        key: PageStorageKey('profile-setting-list'),
        children: [
          if (!model.clientData().isAnonymous)
            _profileSettingsWidget(
              text: 'View Profile',
              icon: Icon(Icons.person),
              onTap: model.inProgressNotifier,
            ),
          if (!model.clientData().isAnonymous)
            _profileSettingsWidget(
              text: 'Payments and Payouts',
              icon: Icon(Icons.credit_card),
              onTap: model.inProgressNotifier,
            ),
          if (model.clientData().clientType ==
                  describeEnum(ClientType.business) &&
              !model.clientData().isAnonymous)
            _profileSettingsWidget(
              text: 'Manage Gigs',
              icon: Icon(Icons.work),
              onTap: model.goToGigManagerView,
            ),
          if (!model.clientData().isAnonymous)
            _profileSettingsWidget(
              text: 'Manage Requests',
              icon: Icon(Icons.request_quote),
              onTap: model.inProgressNotifier,
            ),
          if (!model.clientData().isAnonymous)
            _profileSettingsWidget(
              text: 'Orders',
              icon: Icon(Icons.list_alt),
              onTap: model.inProgressNotifier,
            ),
          _profileSettingsWidget(
            text: 'Get Help',
            icon: Icon(Icons.help_outline),
            onTap: model.inProgressNotifier,
          ),
          _profileSettingsWidget(
            text: 'Give Us Feedback',
            icon: Icon(Icons.question_answer),
            onTap: model.inProgressNotifier,
          ),
          _profileSettingsWidget(
            text: 'Terms of Service',
            icon: Icon(Icons.gavel),
            onTap: model.inProgressNotifier,
          ),
          if (!model.clientData().isAnonymous)
            _profileSettingsWidget(
              text: 'Log Out',
              onTap: () => model.logOut(),
              icon: Icon(
                Icons.logout,
                color: Colors.red,
              ),
              textColor: Colors.red,
            ),
          verticalSpaceRegular,
          BoxText.caption(
            'v. 0.01 (XYZ-PROTOTYPE)',
            align: TextAlign.center,
          ),
          verticalSpaceRegular,
        ],
      ),
    );
  }

  Widget _profileTopBar(context, model) {
    final String _clientEmail = model.clientData().clientEmail ?? '';
    final String _getClientType = model.clientData().clientType ?? '';
    final String _clientType = _getClientType.capitalizeFirstofEach;

    final _profileCardHeight =
        screenHeightPercentage(context, percentage: 0.15);

    bool _isAnonymous = model.clientData().isAnonymous;

    final List<Widget> _clientNameDisplay = [
      Align(
        alignment: Alignment.centerLeft,
        child: BoxText.body(
          '${model.clientData().clientName ?? ''}',
          align: TextAlign.left,
          color: Colors.black,
        ),
      ),
      verticalSpaceSmall,
    ];

    final List<Widget> _clientEmailDisplay = [
      Align(
        alignment: Alignment.centerLeft,
        child: BoxText.body(
          '$_clientEmail',
          align: TextAlign.left,
        ),
      ),
      verticalSpaceSmall,
    ];

    final List<Widget> _clientTypeDisplay = [
      Align(
        alignment: Alignment.centerLeft,
        child: BoxText.body(
          '$_clientType',
          align: TextAlign.left,
        ),
      ),
      verticalSpaceSmall,
    ];

    return Container(
      color: kcVeryLightGreyColor,
      height: _profileCardHeight,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 8.0),
            child: InkWell(
              child: CircleAvatar(
                backgroundColor: kcMediumGreyColor,
                radius: _profileCardHeight * 0.4,
                foregroundImage: model.clientData().clientAvatar != null
                    ? NetworkImage(
                        model.clientData().clientAvatar ?? NoPhotoUrl)
                    : null,
                child: _circleAvatarContent(model),
              ),
              onTap: model.goToAddUserAvatar,
            ),
          ),
          horizontalSpaceRegular,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!_isAnonymous) verticalSpaceSmall,
              if (!_isAnonymous) ..._clientNameDisplay,
              if (!_isAnonymous) ..._clientEmailDisplay,
              if (!_isAnonymous) ..._clientTypeDisplay,
              if (_isAnonymous)
                InkWell(
                  onTap: () => model.goToLoginView(context),
                  child: BoxText.body('Log In or Sign Up to Create a Profile'),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _circleAvatarContent(model) {
    if (model.clientData().isAnonymous) {
      return Icon(Icons.people, color: Colors.white);
    } else if (model.clientData().clientAvatar == null) {
      return BoxText.body('Add Photo', color: Colors.white);
    } else {
      return Container();
    }
  }
}
