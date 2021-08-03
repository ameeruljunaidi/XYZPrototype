import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_viewmodel.dart';
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
class AddGigPriceView extends StatelessWidget {
  AddGigPriceView({Key? key}) : super(key: key);

  List<String> _pages = [
    'Package 1',
    'Package 2',
    'Package 3',
    'Quote',
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddGigViewModel>.reactive(
      onModelReady: (model) => model.getSuggestedFeaturesFromSubCategory(),
      builder: (context, model, child) => Scaffold(
        body: defaultSliverScreen(
          context,
          model,
          heading: 'Price Your Service',
          sliverBodyContent: _addGigPriceBody(context, model),
          cancelButton: model.cancelAddGig,
          goBack: model.goBack,
          goContinue: model.goToAddLocation,
        ),
      ),
      viewModelBuilder: () => AddGigViewModel(),
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

  Widget _pagesView(context, model) {
    final _featuresList = model.suggestedFeaturesList;

    return SliverFillRemaining(
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: model.pageController,
        itemCount: _pages.length,
        onPageChanged: (page) => model.updateSelectedPricePage(page),
        itemBuilder: (context, index) {
          // If feature list is not empty, build the list
          if (model.suggestedFeaturesList != null) {
            return ListView.builder(
              itemBuilder: (context, index) {
                // Get all the necessary data from model
                final _featureAtIndex = _featuresList[index];
                final _featuresName = _featureAtIndex.serviceFeatureName;
                final _featuresType = _featureAtIndex.serviceFeatureType;
                final _featuresValue = _featureAtIndex.serviceFeatureValue;

                // Check if feature type is bool
                bool _isCheckbox = _featuresType == 'bool';

                return Container(
                  margin: defaultPaddingHorizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_featuresName),
                      if (_isCheckbox)
                        Checkbox(
                          value: model.stringToBool(_featuresValue),
                          onChanged: (value) => model.featureCheckboxToggle(
                            _featuresList,
                            index,
                            value,
                          ),
                        ),
                    ],
                  ),
                );
              },
              itemCount: _featuresList.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: kcPrimaryColor),
            );
          }
        },
      ),
    );
  }
}
