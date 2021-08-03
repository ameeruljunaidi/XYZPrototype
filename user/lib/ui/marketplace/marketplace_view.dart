import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/ui/marketplace/marketplace_viewmodel.dart';
import 'package:xyz_prototype/ui/marketplace/marketplace_view.form.dart';
import 'package:xyz_ui/xyz_ui.dart';

@FormView(fields: [
  FormTextField(name: 'search'),
])
// ignore: must_be_immutable
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

  final _carouselHeightPct = 0.36;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ViewModelBuilder<MarketPlaceViewModel>.reactive(
        onModelReady: (model) =>
            SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
          model.listenToUser();
        }),
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
        builder: (context, model, child) => Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                _searchBar(),
                _marketPlaceBody(context, model),
                if (model.clientData().clientAddress == null &&
                    model.clientData().clientEmail != null)
                  _addLocationButton(model),
              ],
            ),
          ),
        ),
        viewModelBuilder: () => locator<MarketPlaceViewModel>(),
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
          ),
        ],
      ),
    );
  }

  // Essentially main body of the page
  Widget _marketPlaceBody(BuildContext context, MarketPlaceViewModel model) {
    return Expanded(
      child: ListView(
        children: [
          verticalSpaceMedium,
          _marketPlaceHeadline(),
          verticalSpaceMedium,
          _iconsServicesListView(context, model),
          verticalSpaceRegular,
          _carouselServicesTitleAndSeeAll(),
          // If no categories, show a progress bar
          if (model.subCategoriesList != null)
            _carouselServicesBuilder(context, model),
          if (model.subCategoriesList == null)
            _progressIndicatorForCarousel(context)
        ],
      ),
    );
  }

  Padding _marketPlaceHeadline() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 120.0),
      child: BoxText.headline('What would you like to do?'),
    );
  }

  Container _progressIndicatorForCarousel(BuildContext context) {
    return Container(
      height: screenHeightPercentage(context, percentage: _carouselHeightPct),
      child: Center(
        child: CircularProgressIndicator(
          color: kcPrimaryColor,
        ),
      ),
    );
  }

  SingleChildScrollView _iconsServicesListView(
    BuildContext context,
    MarketPlaceViewModel model,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _icons
            .asMap()
            .entries
            .map((e) => _iconBuild(context, e.key, model))
            .toList(),
      ),
    );
  }

  Widget _iconBuild(context, int index, model) {
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

  Padding _carouselServicesTitleAndSeeAll() {
    return Padding(
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
              style: TextStyle(color: kcAccentColor, fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  // Listview builder for the caoursel
  Widget _carouselServicesBuilder(context, model) {
    final _carouselHeight = screenHeightPercentage(
      context,
      percentage: _carouselHeightPct,
    );
    final _cardWidth = screenWidthPercentage(context, percentage: 0.50);

    return Container(
      height: _carouselHeight,
      width: double.infinity,
      // color: Colors.blue,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          ServiceSubCategory subCategories = model.subCategoriesList[index];

          return _carouselServicesBody(
            _cardWidth,
            _carouselHeight,
            subCategories,
          );
        },
        itemCount: model.subCategoriesList.length,
      ),
    );
  }

  // The carousel itself
  Container _carouselServicesBody(
    double _cardWidth,
    double _carouselHeight,
    ServiceSubCategory subCategories,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
      width: _cardWidth,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          _backgroundCardInCarousel(_carouselHeight, _cardWidth),
          _imageCardInCarousel(
            subCategories,
            _carouselHeight,
            _cardWidth,
          ),
        ],
      ),
    );
  }

  // The background card that goes behind the image
  Positioned _backgroundCardInCarousel(
    double _carouselHeight,
    double _cardWidth,
  ) {
    return Positioned(
      bottom: -8.0,
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'TODO',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              verticalSpaceTiny,
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'TODO',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // The images in the carousel themselves
  Container _imageCardInCarousel(
    ServiceSubCategory subCategories,
    double _carouselHeight,
    double _cardWidth,
  ) {
    return Container(
      decoration: defaultBoxDecoration,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: defaultBorderRadius,
            child: Image(
              image: NetworkImage(subCategories.serviceSubCategoryPhoto!),
              height: _carouselHeight * 0.6,
              width: _cardWidth * 0.9,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(defaultBorderRadiusValue),
                bottomRight: Radius.circular(defaultBorderRadiusValue),
              ),
              child: Container(
                width: _cardWidth * 0.9,
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    bottom: 8.0,
                    top: 8.0,
                  ),
                  child: Text(
                    subCategories.serviceSubCategoryName!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Add location button if user does not have a default address
  // This is required if we want to show them location based stuff
  Widget _addLocationButton(MarketPlaceViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: BoxButton(
        title: 'Add Location',
        onTap: model.goToAddressSelection,
      ),
    );
  }
}
