import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/constants/app_keys.dart';
import 'package:xyz_prototype/ui/profile/profile_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';
import 'package:xyz_prototype/extensions/string_extensions.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: ColorfulSafeArea(
          color: kcVeryLightGreyColor,
          child: Column(
            children: [
              _profileWidget(context, model),
              _profileSettingsList(model),
              if (model.clientData().clientType ==
                  describeEnum(ClientType.user))
                _becomeSellerButton(model),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => locator<ProfileViewModel>(),
    );
  }

  Widget _profileSettingsWidget({text, onTap, tileColor, textColor, icon}) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 32.0),
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
          _profileSettingsWidget(
            text: 'Personal Information',
            icon: Icon(Icons.verified_user),
            onTap: () {},
          ),
          _profileSettingsWidget(
            text: 'Payments and Payouts',
            icon: Icon(Icons.credit_card),
            onTap: () {},
          ),
          _profileSettingsWidget(
            text: 'View Profile',
            icon: Icon(Icons.person),
            onTap: () {},
          ),
          _profileSettingsWidget(
            text: 'Manage Gigs',
            icon: Icon(Icons.work),
            onTap: () {},
          ),
          _profileSettingsWidget(
            text: 'Manage Requests',
            icon: Icon(Icons.request_quote),
            onTap: () {},
          ),
          _profileSettingsWidget(
            text: 'Manage Orders',
            icon: Icon(Icons.list_alt),
            onTap: () {},
          ),
          _profileSettingsWidget(
            text: 'Get Help',
            icon: Icon(Icons.help_outline),
            onTap: () {},
          ),
          _profileSettingsWidget(
            text: 'Give Us Feedback',
            icon: Icon(Icons.question_answer),
            onTap: () {},
          ),
          _profileSettingsWidget(
            text: 'Terms of Service',
            icon: Icon(Icons.gavel),
            onTap: () {},
          ),
          _profileSettingsWidget(
            text: 'Log Out',
            onTap: model.logOut,
            icon: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            textColor: Colors.red,
          ),
          verticalSpaceRegular,
          BoxText.caption(
            'VERSION 0.01 (XYZ-PROTOTYPE)',
            align: TextAlign.center,
          ),
          verticalSpaceRegular,
        ],
      ),
    );
  }

  Widget _profileWidget(context, model) {
    final String _clientEmail = model.clientData().clientEmail;
    final String _getClientType = model.clientData().clientType;
    final String _clientType = _getClientType.capitalizeFirstofEach;

    return Container(
      color: kcVeryLightGreyColor,
      height: screenHeightPercentage(context, percentage: 0.15),
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CircleAvatar(
              backgroundColor: kcMediumGreyColor,
              radius: 56.0,
              child: Icon(
                Icons.face,
                size: 56.0,
                color: kcVeryLightGreyColor,
              ),
            ),
          ),
          horizontalSpaceRegular,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoxText.body(
                'Email: $_clientEmail',
              ),
              verticalSpaceRegular,
              BoxText.body(
                '$_clientType',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _becomeSellerButton(model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Center(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: BoxButton(
            title: 'Become a Gigger',
            onTap: model.goToAddBusiness,
          ),
        ),
      ),
    );
  }
}
