import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/constants/app_strings.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_price_chooser_viewmodel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:xyz_ui/xyz_ui.dart';

class AddGigPriceChooserView extends StatelessWidget {
  const AddGigPriceChooserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddGigPriceChooserViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: defaultAppbar(
          context,
          model,
          appBarColor: Colors.transparent,
          iconColor: kcPrimaryColor,
          cancelButton: model.cancelAddGig,
          actions: [getHelpAppBarButton(color: Colors.transparent)],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              _priceChooserPageView(context, model),
              _pageIndicator(context, model),
              _backButtonCustom(context, model),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => AddGigPriceChooserViewModel(),
    );
  }

  Widget _backButtonCustom(
      BuildContext context, AddGigPriceChooserViewModel model) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: defaultPaddingHorizontal,
        child: defaultBackAndContinue(
          context,
          backgroundColor: Colors.transparent,
          goBack: model.goBack,
        ),
      ),
    );
  }

  Widget _pageIndicator(context, model) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 68.0,
        child: SmoothPageIndicator(
          count: model.pages.length,
          controller: model.pageController,
          effect: ExpandingDotsEffect(
            dotColor: Colors.grey,
            activeDotColor: kcPrimaryColor,
          ),
        ),
      ),
    );
  }

  Widget _priceChooserPageView(context, model) {
    final _pageHeight = screenHeightCleanPercentage(context, percentage: 0.85);

    return ExpandablePageView.builder(
      controller: model.pageController,
      itemCount: model.pages.length,
      onPageChanged: (page) {
        // TODO: Implement on page change
      },
      itemBuilder: (context, pageIndex) {
        return Container(
          height: _pageHeight,
          child: Padding(
            padding: defaultPaddingHorizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoxText.headingTwo(model.pages[pageIndex]),
                verticalSpaceRegular,
                _subHeading(pageIndex),
                verticalSpaceLarge,
                _pageBody(context, model, pageIndex),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _subHeading(int pageIndex) {
    Map<int, Widget> _subHeadingMap = {
      0: BoxText.subheading(ChoosePriceTypeSubHeading),
      1: BoxText.subheading(ChooseQuoteTypeSubHeading),
      2: BoxText.subheading(''),
    };

    return _subHeadingMap[pageIndex]!;
  }

  Widget _pageBody(context, model, pageIndex) {
    Map<int, Widget> _pageBody = {
      0: _priceChooser(context, model),
      1: _quoteChoose(context, model),
      2: _continueNext(context, model),
    };

    return _pageBody[pageIndex]!;
  }

  Widget _chooserListView(model, listTypes, selectedIndex, identifier) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, typeIndex) {
          final bool _selected = typeIndex == selectedIndex;
          final bool _priceChooser = identifier == 'price';

          return Container(
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
              onTap: _priceChooser
                  ? () => model.changeSelectedPriceType(typeIndex)
                  : () => model.changeSelectedQuoteType(typeIndex),
              title: Text(
                listTypes[typeIndex],
                style: TextStyle(
                  fontWeight: _selected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              tileColor: _selected ? kcVeryLightGreyColor : null,
            ),
          );
        },
        itemCount: listTypes.length,
      ),
    );
  }

  Widget _priceChooser(context, model) {
    final _priceTypes = model.priceTypes;
    final _selectedIndex = model.selectedPriceType;
    final _identifier = 'price';

    return _chooserListView(model, _priceTypes, _selectedIndex, _identifier);
  }

  Widget _quoteChoose(context, model) {
    final _quoteTypes = model.quoteTypes;
    final _selectedIndex = model.selectedQuoteType;
    final _identifier = 'quote';

    return _chooserListView(model, _quoteTypes, _selectedIndex, _identifier);
  }

  Widget _continueNext(context, model) {
    return Center(
      child: BoxButton(
        title: 'Continue',
        onTap: model.goToAddPrice,
      ),
    );
  }
}
