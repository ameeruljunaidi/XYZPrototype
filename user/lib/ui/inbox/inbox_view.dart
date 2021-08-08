import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/ui/inbox/inbox_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class InboxView extends StatelessWidget {
  const InboxView({Key? key}) : super(key: key);

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

  final double _avatarSize = 64;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InboxViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: _mainBodyContent(context, model),
      ),
      viewModelBuilder: () => locator<InboxViewModel>(),
    );
  }

  Widget _mainBodyContent(BuildContext context, InboxViewModel model) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            verticalSpaceRegular,
            _screenHeading(context),
            _pageSelector(context, model),
            _pagesBuilder(context, model),
          ],
        ),
      ),
    );
  }

  Widget _pagesBuilder(BuildContext context, InboxViewModel model) {
    return ExpandablePageView.builder(
      controller: model.pageController,
      itemCount: model.pages!.length,
      onPageChanged: (page) => model.updateSelectedPricePage(page),
      itemBuilder: (context, pageIndex) {
        if (pageIndex == 0) {
          return Column(
            children: <Widget>[
              verticalSpaceRegular,
              _messagesCard(context, model),
              verticalSpaceRegular,
              _messagesCard(context, model),
              verticalSpaceRegular,
              _messagesCard(context, model),
              verticalSpaceRegular,
              _messagesCard(context, model),
              verticalSpaceRegular,
              _messagesCard(context, model),
              verticalSpaceRegular,
              _messagesCard(context, model),
              verticalSpaceRegular,
              _messagesCard(context, model),
              verticalSpaceRegular,
              _messagesCard(context, model),
              verticalSpaceRegular,
              _messagesCard(context, model),
            ],
          );
        } else if (pageIndex == 1) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpaceLarge,
              Center(
                child: Text('Notifications'),
              ),
            ],
          );
        } else {
          return Container(
            child: Center(
              child: Text('No Page Found'),
            ),
          );
        }
      },
    );
  }

  Widget _pageSelector(BuildContext context, InboxViewModel model) {
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
          final _selected = pageIndex == model.selectedInboxPage;

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
    InboxViewModel model, {
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
        margin: EdgeInsets.only(right: 8.0),
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
      child: BoxText.headline('Inbox'),
    );
  }

  Widget _messagesCard(BuildContext context, InboxViewModel model) {
    return GestureDetector(
      onTap: model.goToChat,
      child: Container(
        height: _avatarSize * 1.375,
        width: screenWidth(context),
        color: _colorDebug[3],
        child: Padding(
          padding: defaultPaddingHorizontal,
          child: Stack(
            children: <Widget>[
              _messageDetails(context),
              _senderAvatar(),
            ],
          ),
        ),
      ),
    );
  }

  Align _senderAvatar() {
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

  Align _messageDetails(BuildContext context) {
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
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sender Name',
                  style: subheadingStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              verticalSpaceTiny,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Message Preview',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: BoxText.body(
                  'Date',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
