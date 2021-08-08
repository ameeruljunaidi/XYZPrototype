import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/ui/favorites/favorites_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  static const _colorDebug = [
    // Colors.red,
    // Colors.blue,
    // Colors.green,
    // Colors.grey,
    null,
    null,
    null,
    null
  ];

  final double _avatarSize = 64.0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavoritesViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                verticalSpaceRegular,
                _screenHeading(context),
                verticalSpaceRegular,
                _favoritesCard(context, model),
                verticalSpaceRegular,
                _favoritesCard(context, model),
                verticalSpaceRegular,
                _favoritesCard(context, model),
                verticalSpaceRegular,
                _favoritesCard(context, model),
                verticalSpaceRegular,
                _favoritesCard(context, model),
                verticalSpaceRegular,
                _favoritesCard(context, model),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => locator<FavoritesViewModel>(),
    );
  }

  Widget _favoritesCard(BuildContext context, FavoritesViewModel model) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: _avatarSize * 1.375,
        width: screenWidth(context),
        color: _colorDebug[3],
        child: Padding(
          padding: defaultPaddingHorizontal,
          child: Stack(
            children: <Widget>[
              _favoriteDetails(context),
              _favoritesAvatar(),
            ],
          ),
        ),
      ),
    );
  }

  Align _favoriteDetails(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(left: _avatarSize / 2),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: _colorDebug[0] != null ? _colorDebug[0] : Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(defaultBorderRadiusValue),
            bottomRight: Radius.circular(defaultBorderRadiusValue),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 16.0,
            bottom: 16.0,
            left: _avatarSize / 1.5,
            right: 24.0,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: BoxText.headingThree('Category'),
          ),
        ),
      ),
    );
  }

  Align _favoritesAvatar() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: defaultBoxDecoration(
          color: Colors.white,
          shadow: true,
        ),
        height: _avatarSize,
        width: _avatarSize,
        child: Placeholder(),
      ),
    );
  }

  Container _screenHeading(BuildContext context) {
    return Container(
      padding: defaultPaddingHorizontal,
      width: screenWidth(context),
      color: _colorDebug[2],
      child: BoxText.headline('Favorites'),
    );
  }
}
