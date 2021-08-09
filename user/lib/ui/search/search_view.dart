import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/ui/search/search_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

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
    return ViewModelBuilder<SearchViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpaceRegular,
                  _screenHeading(context),
                  _pageSelector(context, model),
                  _pagesBuilder(context, model),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => locator<SearchViewModel>(),
    );
  }

  Widget _pagesBuilder(BuildContext context, SearchViewModel model) {
    return ExpandablePageView.builder(
      controller: model.pageController,
      itemCount: model.pages!.length,
      onPageChanged: (page) => model.updateSelectedPricePage(page),
      itemBuilder: (context, pageIndex) {
        return Column(
          children: <Widget>[
            verticalSpaceRegular,
            _activitiesCard(context, model),
            verticalSpaceRegular,
            _activitiesCard(context, model),
            verticalSpaceRegular,
            _activitiesCard(context, model),
            verticalSpaceRegular,
            _activitiesCard(context, model),
            verticalSpaceRegular,
            _activitiesCard(context, model),
            verticalSpaceRegular,
            _activitiesCard(context, model),
          ],
        );
      },
    );
  }

  Widget _pageSelector(BuildContext context, SearchViewModel model) {
    return Container(
      margin: defaultPaddingHorizontal,
      height: 32,
      width: screenWidth(context),
      decoration: BoxDecoration(
        color: _colorDebug[2],
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.black),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model.pages!.length,
        itemBuilder: (context, pageIndex) {
          final _selected = pageIndex == model.selectedActivitiesPage;

          return _pageButton(
            model,
            text: model.pages![pageIndex],
            pageIndex: pageIndex,
            fontWeight: _selected ? FontWeight.bold : null,
            bottomBorder: _selected,
          );
        },
      ),
    );
  }

  Widget _pageButton(
    SearchViewModel model, {
    required text,
    bottomBorder = false,
    fontWeight = FontWeight.normal,
    required pageIndex,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => model.goToPageIndex(pageIndex),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(right: 12.0),
        padding: EdgeInsets.symmetric(
          vertical: defaultPaddingValueSmall / 2,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: fontWeight,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: _colorDebug[1],
          border: bottomBorder
              ? Border(
                  bottom: BorderSide(width: 1.0, color: Colors.black),
                )
              : null,
        ),
      ),
    );
  }

  Container _screenHeading(BuildContext context) {
    return Container(
      padding: defaultPaddingHorizontal,
      width: screenWidth(context),
      color: _colorDebug[2],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BoxText.headline('Activities'),
          TextButton(
            child: Text('See All',
                style: TextStyle(
                  color: kcPrimaryColor,
                )),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _searchBox() {
    return Padding(
      padding: defaultPaddingHorizontal,
      child: BoxInputField(
        controller: TextEditingController(),
        placeholder: 'Search',
        textAlign: TextAlign.center,
        leading: Icon(Icons.search),
      ),
    );
  }

  Widget _activitiesCard(BuildContext context, SearchViewModel model) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: _avatarSize * 1.5,
        width: screenWidth(context),
        color: _colorDebug[3],
        child: Padding(
          padding: defaultPaddingHorizontal,
          child: Stack(
            children: <Widget>[
              _activitiesDetails(context),
              _activitiesAvatar(),
            ],
          ),
        ),
      ),
    );
  }

  Align _activitiesDetails(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(left: _avatarSize / 2),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: _colorDebug[0] != null ? _colorDebug[0] : Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 16.0,
            bottom: 16.0,
            left: _avatarSize / 1.5,
            right: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  color: _colorDebug[1],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Listing Title',
                          style: subheadingStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      verticalSpaceTiny,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Listing description...',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      verticalSpaceTiny,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'with David Dobrik',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: _colorDebug[2],
                child: Align(
                  alignment: Alignment.centerRight,
                  child: BoxText.body(
                    'Date',
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align _activitiesAvatar() {
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
}
