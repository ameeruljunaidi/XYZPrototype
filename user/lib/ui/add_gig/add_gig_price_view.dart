import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_price_viewmodel.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_price.form.dart';
import 'package:xyz_ui/xyz_ui.dart';

@FormView(
  fields: [
    FormTextField(name: 'gigPriceTier1Title'),
    FormTextField(name: 'gigPriceTier1Description'),
    FormTextField(name: 'gigPriceTier2Title'),
    FormTextField(name: 'gigPriceTier2Description'),
    FormTextField(name: 'gigPriceTier3Title'),
    FormTextField(name: 'gigPriceTier3Description'),
  ],
)
// ignore: must_be_immutable
class AddGigPriceView extends StatelessWidget with $AddGigPriceView {
  AddGigPriceView({Key? key}) : super(key: key);

  List<String> _pages = [
    'Package 1',
    'Package 2',
    'Package 3',
    'Quote',
  ];

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
    return SliverFillRemaining(
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: model.pageController,
        itemCount: _pages.length,
        onPageChanged: (page) => model.updateSelectedPricePage(page),
        itemBuilder: (context, pageIndex) {
          // Change the loaded price tier depending on the page
          // Get the title of the price tier
          final _pageTitle = model.getPricePackageTitle(pageIndex);

          _inputController(pageIndex) {}

          if (pageIndex <= 2) {
            // If feature list is not empty, build the list
            if (model.suggestedFeaturesList != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  verticalSpaceMedium,
                  _heading('Title & Description'),
                  verticalSpaceRegular,
                  _boxInputCustom(
                    '$_pageTitle Title',
                    gigPriceTier1TitleController,
                  ),
                  verticalSpaceRegular,
                  _boxInputCustom(
                    '$_pageTitle Description',
                    gigPriceTier1DescriptionController,
                  ),
                  verticalSpaceRegular,
                  _heading('Features'),
                  verticalSpaceRegular,
                  _featuresListView(model),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(color: kcPrimaryColor),
              );
            }
          } else {
            return Center(child: Text('Quote'));
          }
        },
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
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _pageSelectorButton(
              context,
              pageTitle: _pages[index],
              position: index,
              selected: index == model.selectedPricePage,
              onTap: () => model.goToPageIndex(index),
            );
          },
          itemCount: _pages.length,
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

  Widget _featuresListView(model) {
    // Get a list of all the features
    final _featuresList = model.suggestedFeaturesList;
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, featureIndex) {
        return _featureBuilder(model, _featuresList, featureIndex);
      },
      itemCount: _featuresList.length,
    );
  }

  Widget _featureBuilder(model, _featuresList, int index) {
    // Get all the necessary data from model
    final _featureAtIndex = _featuresList[index];
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
                value: model.stringToBool(_featureValue),
                onChanged: (value) => model.featureCheckboxToggle(
                  _featuresList,
                  index,
                  value,
                ),
              )
            : null,
      ),
    );
  }

  Widget _heading(heading) {
    return Padding(
      padding: defaultPaddingHorizontal,
      child: Align(
        alignment: Alignment.centerLeft,
        child: BoxText.headingThree(
          heading,
          align: TextAlign.left,
        ),
      ),
    );
  }

  Widget _boxInputCustom(title, controller) {
    return Padding(
      padding: defaultPaddingHorizontal,
      child: BoxInputField(
        controller: gigPriceTier1TitleController,
        placeholder: title,
      ),
    );
  }
}
