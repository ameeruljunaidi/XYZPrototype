import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/data/services_faker.dart';
import 'package:xyz_prototype/ui/marketplace/marketplace_viewmodel.dart';
import 'package:xyz_prototype/ui/marketplace/marketplace_view.form.dart';
import 'package:xyz_ui/xyz_ui.dart';

@FormView(fields: [
  FormTextField(name: 'search'),
])
class MarketPlaceView extends StatelessWidget with $MarketPlaceView {
  MarketPlaceView({Key? key}) : super(key: key);

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.bicycle,
    FontAwesomeIcons.airbnb,
    FontAwesomeIcons.amazon,
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MarketPlaceViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: ColorfulSafeArea(
          color: kcVeryLightGreyColor,
          child: Container(
            color: kcVeryLightGreyColor,
            child: Column(
              children: [
                _searchBar(),
                Expanded(
                  child: ListView(
                    children: [
                      verticalSpaceMedium,
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 24.0, right: 120.0),
                        child: BoxText.headline('What would you like to do?'),
                      ),
                      verticalSpaceMedium,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: _icons
                              .asMap()
                              .entries
                              .map((e) => _buildIcon(context, e.key, model))
                              .toList(),
                        ),
                      ),
                      verticalSpaceRegular,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BoxText.headingThree(
                              'Top Services',
                              align: TextAlign.start,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'See All',
                                style: TextStyle(
                                    color: kcAccentColor, fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _servicesCarousel(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => locator<MarketPlaceViewModel>(),
    );
  }

  Widget _servicesCarousel(context) {
    final _carouselHeight = screenHeightPercentage(context, percentage: 0.34);
    final _cardWidth = screenWidthPercentage(context, percentage: 0.50);

    return Container(
      height: _carouselHeight,
      width: double.infinity,
      // color: Colors.blue,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          SubCategory subCategories = subCategoryFaker[index];

          return Container(
            margin: EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
            width: _cardWidth,
            // color: Colors.red,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    height: _carouselHeight * 0.5,
                    width: _cardWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: defaultBorderRadius,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${subCategories.subCategoryCount.toString()} services',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          verticalSpaceTiny,
                          Text(
                            '${subCategories.subCategoryDescription}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: defaultBorderRadius,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0)
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: defaultBorderRadius,
                        child: Image(
                          height: _cardWidth * 0.9,
                          width: _cardWidth * 0.9,
                          image: AssetImage(subCategories.subCategoryImgUrl!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        child: Container(
                          width: _cardWidth,
                          color: Colors.black26,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              bottom: 8.0,
                              top: 8.0,
                            ),
                            child: Text(
                              subCategories.subCategory!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: subCategoryFaker.length,
      ),
    );
  }

  Widget _buildIcon(context, int index, model) {
    final _circleHeight = screenHeightPercentage(context, percentage: 0.07);

    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Container(
        height: _circleHeight,
        width: _circleHeight,
        decoration: BoxDecoration(
          // Circle color
          color: model.selectedIndex == index
              ? kcAccentColorLight
              : kcLightGreyColor,
          borderRadius: BorderRadius.circular(_circleHeight / 2),
        ),
        child: InkWell(
          customBorder: CircleBorder(),
          onTap: () {
            model.updateIndex(index);
          },
          child: Icon(
            _icons[index],
            size: _circleHeight / 2.1,
            // Icon color
            color: model.selectedIndex == index
                ? kcPrimaryColor
                : kcMediumGreyColor,
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          verticalSpaceRegular,
          BoxInputField(
            controller: TextEditingController(),
            placeholder: 'Search for Service Around You',
            textAlign: TextAlign.center,
            tapOnly: true,
            fillColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _servicesHorizontalScrollView(context, textKey) {
    return Container(
      height: screenHeightPercentage(context, percentage: 0.16),
      width: double.infinity,
      child: ListView.builder(
        key: PageStorageKey(textKey),
        padding: EdgeInsets.only(left: 8.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: defaultBorderRadius,
                child: Container(
                  color: kcLightGreyColor,
                  height: double.maxFinite,
                  // color: Colors.blue,
                  child: Placeholder(),
                ),
              ),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
