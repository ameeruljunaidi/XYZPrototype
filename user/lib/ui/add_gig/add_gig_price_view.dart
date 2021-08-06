import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_price_viewmodel.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_price_view.form.dart';
import 'package:xyz_ui/xyz_ui.dart';
import 'package:expandable_page_view/expandable_page_view.dart';

@FormView(
  fields: [
    FormTextField(name: 'gigPriceTier1Title'),
    FormTextField(name: 'gigPriceTier1Description'),
    FormTextField(name: 'gigPriceTier1Price'),
    FormTextField(name: 'gigPriceTier2Title'),
    FormTextField(name: 'gigPriceTier2Description'),
    FormTextField(name: 'gigPriceTier2Price'),
    FormTextField(name: 'gigPriceTier3Title'),
    FormTextField(name: 'gigPriceTier3Description'),
    FormTextField(name: 'gigPriceTier3Price'),
  ],
)
// ignore: must_be_immutable
class AddGigPriceView extends StatelessWidget with $AddGigPriceView {
  AddGigPriceView({Key? key}) : super(key: key);

  double _pageSelectorHeight = 48.0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddGigPriceViewModel>.reactive(
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.getDataForScreen();
      },
      builder: (context, model, child) => Scaffold(
        appBar: defaultAppbar(
          context,
          model,
          appBarColor: kcPrimaryColor,
          iconColor: Colors.white,
          cancelButton: model.cancelAddGig,
          actions: [getHelpAppBarButton(color: Colors.white)],
        ),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            color: Colors.white,
            child: _addGigPriceBody(context, model),
          ),
        ),
      ),
      viewModelBuilder: () => AddGigPriceViewModel(),
    );
  }

  Widget _addGigPriceBody(context, model) {
    final bool _quotePage = model.selectedPricePage == 3;

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: _pageSelectorHeight),
              _pagesView(context, model),
              Container(height: 88.0, color: Colors.white),
            ],
          ),
        ),
        _pagesSelector(model),
        defaultBackAndContinueSliver(
          context,
          model,
          goBack: model.goBack,
          goContinue: _quotePage ? model.goToAddLocation : null,
        ),
      ],
    );
  }

  Widget _pagesView(context, AddGigPriceViewModel model) {
    return Container(
      color: kcPrimaryColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultBorderRadiusValue),
            topRight: Radius.circular(defaultBorderRadiusValue),
          ),
          color: Colors.white,
        ),
        child: _pagesViewBuilder(model),
      ),
    );
  }

  Widget _pagesViewBuilder(AddGigPriceViewModel model) {
    // final int _customerFeatureCount = model.customFeaturesCount;

    return ExpandablePageView.builder(
      controller: model.pageController,
      itemCount: model.pages!.length,
      onPageChanged: (page) => model.updateSelectedPricePage(page),
      itemBuilder: (context, pageIndex) {
        // Change the loaded price tier depending on the page
        // Get the title of the price tier
        final _pageTitle = model.getPricePackageTitle(pageIndex);

        TextEditingController _priceTitleController(int mapIndex) {
          Map<int, TextEditingController> _controller = {
            0: gigPriceTier1TitleController,
            1: gigPriceTier2TitleController,
            2: gigPriceTier3TitleController,
          };

          return _controller[mapIndex]!;
        }

        TextEditingController _priceDescriptionController(int mapIndex) {
          Map<int, TextEditingController> _controller = {
            0: gigPriceTier1DescriptionController,
            1: gigPriceTier2DescriptionController,
            2: gigPriceTier3DescriptionController,
          };

          return _controller[mapIndex]!;
        }

        TextEditingController _pricePriceController(int mapIndex) {
          Map<int, TextEditingController> _controller = {
            0: gigPriceTier1PriceController,
            1: gigPriceTier2PriceController,
            2: gigPriceTier3PriceController,
          };

          return _controller[mapIndex]!;
        }

        if (pageIndex <= 2) {
          // If feature list is not empty, build the list
          if (model.suggestedFeaturesList != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalSpaceMedium,
                _headingCutom(heading: 'Title & Description'),
                verticalSpaceRegular,
                _boxInputCustom(
                  '$_pageTitle Title',
                  _priceTitleController(pageIndex),
                ),
                verticalSpaceRegular,
                _boxInputCustom(
                  '$_pageTitle Description',
                  _priceDescriptionController(pageIndex),
                ),
                verticalSpaceRegular,
                _boxInputCustom(
                  '$_pageTitle Price',
                  _pricePriceController(pageIndex),
                ),
                verticalSpaceRegular,
                _headingCutom(
                  heading: 'Features',
                ),
                verticalSpaceRegular,
                _featuresListView(model, pageIndex),
                // if (!model.isBusy && _customerFeatureCount < 10)
                //   _addCustomFeature(model),
              ],
            );
          } else {
            return _progressIndicator();
          }
        } else if (pageIndex == 3) {
          return Column(
            children: [
              verticalSpaceMedium,
              _headingCutom(heading: 'Enable/Disable Quote'),
              verticalSpaceRegular,
              _quoteChooser(context, model),
              verticalSpaceRegular,
            ],
          );
        } else {
          return Center(child: Text('Not Selected'));
        }
      },
    );
  }

  // Widget _addCustomFeature(model) {
  //   return Padding(
  //     padding: defaultPaddingHorizontal,
  //     child: ListTile(
  //       title: Text('Add Custom Feature'),
  //       contentPadding: EdgeInsets.zero,
  //       subtitle: Text('Add up to 10 additional features'),
  //       trailing: Icon(Icons.add),
  //       onTap: () => model.addCustomFeature(),
  //     ),
  //   );
  // }

  Widget _pagesSelector(model) {
    return Container(
      height: _pageSelectorHeight,
      decoration: BoxDecoration(
        color: kcPrimaryColor,
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _pageSelectorButton(
            context,
            pageTitle: model.pages[index],
            position: index,
            selected: index == model.selectedPricePage,
            onTap: () => model.goToPageIndex(index),
          );
        },
        itemCount: model.pages.length,
      ),
    );
  }

  Widget _pageSelectorButton(
    context, {
    required pageTitle,
    required position,
    required selected,
    required onTap,
  }) {
    BoxDecoration _boxDecoration() {
      if (position == 0) {
        return BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultBorderRadiusValue),
          ),
        );
      } else if (position == 3) {
        return BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(defaultBorderRadiusValue),
          ),
        );
      } else {
        return BoxDecoration();
      }
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        width: screenWidth(context) / 4,
        decoration: _boxDecoration(),
        child: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                pageTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _featuresListView(model, pageIndex) {
    // Get a list of all the features
    final _featuresList = model.suggestedFeaturesList(pageIndex);

    if (!model.isBusy) {
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, featureIndex) {
          return _featureBuilder(model, _featuresList, featureIndex, pageIndex);
        },
        itemCount: _featuresList.length,
      );
    } else {
      return Column(
        children: [
          verticalSpaceLarge,
          _progressIndicator(),
        ],
      );
    }
  }

  Widget _featureBuilder(model, _featuresList, featureIndex, pageIndex) {
    // Get all the necessary data from model
    final _featureAtIndex = _featuresList[featureIndex];
    final _featureName = _featureAtIndex.serviceFeatureName;
    final _featureType = _featureAtIndex.serviceFeatureType;
    final _featureValue = _featureAtIndex.serviceFeatureValue;

    // Check if feature type is bool
    bool _isCheckbox = _featureType == 'bool';

    return Container(
      margin: EdgeInsets.only(
        right: defaultPaddingValue,
        left: defaultPaddingValue,
        bottom: 16.0,
      ),
      decoration: BoxDecoration(
        borderRadius: defaultBorderRadius,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: ListTile(
        title: Text(_featureName),
        trailing: _isCheckbox
            ? Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.all<Color>(kcPrimaryColor),
                value: model.stringToBool(_featureValue),
                onChanged: (value) => model.featureCheckboxToggle(
                  _featuresList,
                  pageIndex,
                  featureIndex,
                  value,
                ),
              )
            : null,
      ),
    );
  }

  Widget _headingCutom({heading, editTap}) {
    return Padding(
      padding: defaultPaddingHorizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BoxText.headingThree(
            heading,
            align: TextAlign.left,
          ),
          if (editTap != null)
            InkWell(
              onTap: editTap,
              child: Text(
                'Edit',
                style: TextStyle(
                  color: kcPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _boxInputCustom(String title, TextEditingController controller) {
    return Padding(
      padding: defaultPaddingHorizontal,
      child: BoxInputField(
        controller: controller,
        placeholder: title,
      ),
    );
  }

  Widget _progressIndicator() {
    return Center(
      child: CircularProgressIndicator(color: kcPrimaryColor),
    );
  }

  Widget _quoteChooser(context, model) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, optionIndex) {
        bool _selected = model.quoteOptionSelected == optionIndex;

        return Padding(
          padding: defaultPaddingHorizontal,
          child: Container(
            margin: EdgeInsets.only(
              // right: defaultPaddingValue,
              // left: defaultPaddingValue,
              bottom: 16.0,
            ),
            decoration: BoxDecoration(
              borderRadius: defaultBorderRadius,
              border: Border.all(
                color: Colors.black,
                width: _selected ? 2 : 1,
              ),
            ),
            child: ListTile(
              onTap: () => model.selectQuoteOption(optionIndex),
              title: Text(
                model.quoteOptions[optionIndex],
                style: TextStyle(
                  fontWeight: _selected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              tileColor: _selected ? kcVeryLightGreyColor : null,
            ),
          ),
        );
      },
      itemCount: model.quoteOptions.length,
    );
  }
}
