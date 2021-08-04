import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_price_viewmodel.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_price_view.form.dart';
import 'package:xyz_ui/xyz_ui.dart';

@FormView(
  fields: [
    FormTextField(name: 'gigPriceTier1Title'),
    FormTextField(name: 'gigPriceTier1Description'),
    FormTextField(name: 'gigPriceTier2Title'),
    FormTextField(name: 'gigPriceTier2Description'),
    FormTextField(name: 'gigPriceTier3Title'),
    FormTextField(name: 'gigPriceTier3Description'),
    FormTextField(name: 'customFeature1Title'),
    FormTextField(name: 'customFeature1Value'),
    FormTextField(name: 'customFeature2Title'),
    FormTextField(name: 'customFeature2Value'),
    FormTextField(name: 'customFeature3Title'),
    FormTextField(name: 'customFeature3Value'),
    FormTextField(name: 'customFeature4Title'),
    FormTextField(name: 'customFeature4Value'),
    FormTextField(name: 'customFeature5Title'),
    FormTextField(name: 'customFeature5Value'),
    FormTextField(name: 'customFeature6Title'),
    FormTextField(name: 'customFeature6Value'),
    FormTextField(name: 'customFeature7Title'),
    FormTextField(name: 'customFeature7Value'),
    FormTextField(name: 'customFeature8Title'),
    FormTextField(name: 'customFeature8Value'),
    FormTextField(name: 'customFeature9Title'),
    FormTextField(name: 'customFeature9Value'),
    FormTextField(name: 'customFeature10Title'),
    FormTextField(name: 'customFeature10Value'),
  ],
)
// ignore: must_be_immutable
class AddGigPriceView extends StatelessWidget with $AddGigPriceView {
  AddGigPriceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddGigPriceViewModel>.reactive(
      onModelReady: (model) => model.getSuggestedFeaturesFromSubCategory(),
      builder: (context, model, child) => Scaffold(
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: defaultSliverScreen(
            context,
            model,
            heading: 'Price Your Service',
            sliverBodyContent: _addGigPriceBody(context, model),
            cancelButton: model.cancelAddGig,
            goBack: model.goBack,
            goContinue: model.goToAddLocation,
          ),
        ),
      ),
      viewModelBuilder: () => AddGigPriceViewModel(),
    );
  }

  Widget _addGigPriceBody(context, model) {
    return MultiSliver(
      children: [
        _pagesSelector(model),
        _pagesView(context, model),
      ],
    );
  }

  Widget _pagesView(context, model) {
    final int _customerFeatureCount = model.customFeaturesCount;

    return SliverToBoxAdapter(
      child: Container(
        height: screenHeight(context) * 2,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: model.pageController,
          itemCount: model.pages.length,
          onPageChanged: (page) => model.updateSelectedPricePage(page),
          itemBuilder: (context, pageIndex) {
            // Change the loaded price tier depending on the page
            // Get the title of the price tier
            final _pageTitle = model.getPricePackageTitle(pageIndex);

            TextEditingController _priceTitleController(mapIndex) {
              Map<int, TextEditingController> _controller = {
                0: gigPriceTier1TitleController,
                1: gigPriceTier2TitleController,
                2: gigPriceTier3TitleController,
              };

              return _controller[mapIndex]!;
            }

            TextEditingController _priceDescriptionController(mapIndex) {
              Map<int, TextEditingController> _controller = {
                0: gigPriceTier1DescriptionController,
                1: gigPriceTier2DescriptionController,
                2: gigPriceTier3DescriptionController,
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
                    _headingCutom(
                        heading: 'Features',
                        editTap: () {
                          // TODO: Implement edit
                        }),
                    verticalSpaceRegular,
                    _featuresListView(model, pageIndex),
                    if (!model.isBusy && _customerFeatureCount < 10)
                      _addCustomFeature(model),
                  ],
                );
              } else {
                return _progressIndicator();
              }
            } else {
              return Center(child: Text('Quote'));
            }
          },
        ),
      ),
    );
  }

  Widget _addCustomFeature(model) {
    return Padding(
      padding: defaultPaddingHorizontal,
      child: ListTile(
        title: Text('Add Custom Feature'),
        contentPadding: EdgeInsets.zero,
        subtitle: Text('Add up to 10 additional features'),
        trailing: Icon(Icons.add),
        onTap: () => model.addCustomFeature(),
      ),
    );
  }

  SliverToBoxAdapter _pagesSelector(model) {
    return SliverToBoxAdapter(
      child: Container(
        height: 48.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultBorderRadiusValue),
            topRight: Radius.circular(defaultBorderRadiusValue),
          ),
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
            width: screenWidth(context) / 4,
            decoration: BoxDecoration(
              border: selected
                  ? Border(
                      bottom: BorderSide(width: 2.0, color: Colors.black),
                    )
                  : null,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                pageTitle,
                style: TextStyle(
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

  Widget _boxInputCustom(title, controller) {
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
}
