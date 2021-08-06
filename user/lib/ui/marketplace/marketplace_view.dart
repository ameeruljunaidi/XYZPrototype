import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/constants/app_strings.dart';
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

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.bicycle,
    FontAwesomeIcons.airbnb,
    FontAwesomeIcons.amazon,
  ];

  final _circleWidthPct = 0.15;
  final _carouselHeight = 350.0;
  final _cardWidthPct = 0.50;

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
                _searchBar(model),
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

  Widget _searchBar(MarketPlaceViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          verticalSpaceRegular,
          BoxInputField(
            controller: TextEditingController(),
            placeholder: 'Search',
            textAlign: TextAlign.center,
            leading: Icon(Icons.search),
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
      height: 400,
      child: Center(
        child: CircularProgressIndicator(
          color: kcPrimaryColor,
        ),
      ),
    );
  }

  Widget _iconsServicesListView(
    BuildContext context,
    MarketPlaceViewModel model,
  ) {
    final _circleWidth = screenWidthPercentage(
      context,
      percentage: _circleWidthPct,
    );
    return Container(
      height: _circleWidth,
      child: ListView.separated(
          padding: defaultPaddingHorizontal,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _iconBuild(context, index, model);
          },
          separatorBuilder: (context, index) {
            return horizontalSpaceRegular;
          },
          itemCount: _icons.length),
    );
  }

  Widget _iconBuild(context, int index, model) {
    final _circleWidth = screenWidthPercentage(
      context,
      percentage: _circleWidthPct,
    );

    return Container(
      height: _circleWidth,
      width: _circleWidth,
      decoration: BoxDecoration(
        // Circle color
        color: model.selectedIndex == index
            ? kcAccentColorLight
            : kcLightGreyColor,
        borderRadius: BorderRadius.circular(_circleWidth / 2),
      ),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: () {
          model.updateIndex(index);
        },
        child: Icon(
          _icons[index],
          size: _circleWidth / 2.1,
          // Icon color
          color:
              model.selectedIndex == index ? kcPrimaryColor : kcMediumGreyColor,
        ),
      ),
    );
  }

  Padding _carouselServicesTitleAndSeeAll() {
    return Padding(
      padding: defaultPaddingHorizontal,
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
    final _cardWidth = screenWidthPercentage(
      context,
      percentage: _cardWidthPct,
    );

    return Container(
      color: _colorDebug[0],
      width: double.infinity,
      height: _carouselHeight,
      child: ListView.separated(
        padding: defaultPaddingHorizontal,
        separatorBuilder: (context, index) {
          return horizontalSpaceRegular;
        },
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
  Widget _carouselServicesBody(
    double _cardWidth,
    double _carouselHeight,
    ServiceSubCategory subCategories,
  ) {
    return Container(
      decoration: defaultBoxDecoration(
        color: Colors.white,
        shadow: true,
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: <Widget>[
          _imageCardInCarousel(
            subCategories,
            _carouselHeight,
            _cardWidth,
          ),
          _backgroundCardInCarousel(_carouselHeight, _cardWidth),
        ],
      ),
    );
  }

  // The background card that goes behind the image
  Widget _backgroundCardInCarousel(
    double _carouselHeight,
    double _cardWidth,
  ) {
    return Expanded(
      child: Container(
        width: _cardWidth,
        decoration: BoxDecoration(
          color: _colorDebug[1] != null ? _colorDebug[1] : Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(defaultBorderRadiusValue),
            bottomRight: Radius.circular(defaultBorderRadiusValue),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: defaultPaddingValueSmall,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  LoremIpsum,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
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
  Widget _imageCardInCarousel(
    ServiceSubCategory subCategories,
    double _carouselHeight,
    double _cardWidth,
  ) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultBorderRadiusValue),
            topRight: Radius.circular(defaultBorderRadiusValue),
          ),
          child: Image(
            image: NetworkImage(subCategories.serviceSubCategoryPhoto!),
            height: _cardWidth,
            width: _cardWidth,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            width: _cardWidth,
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
      ],
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
