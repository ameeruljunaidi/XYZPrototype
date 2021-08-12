import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/booking_summary/booking_summary_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class BookingSummaryView extends StatelessWidget {
  const BookingSummaryView({Key? key}) : super(key: key);

  final double _bottomBarHeight = 64.0;
  final double _gigPhotoHeight = 112.0;

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

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookingSummaryViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: _pageBody(context, model),
        ),
      ),
      viewModelBuilder: () => BookingSummaryViewModel(),
    );
  }

  Widget _pageBody(BuildContext context, BookingSummaryViewModel model) {
    final List<String> _tagList = [
      'Tag 1',
      'Tag 2',
      'Tag 3',
    ];

    return Stack(
      children: [
        CustomScrollView(slivers: [
          _appBarSliver(context, model),
          _gigSummary(context, model, tagList: _tagList),
          _defaultHeader(context, model, header: 'Upgrades'),
          _upgradesSummary(context, model),
          _vendorSummary(
            context,
            model,
            vendorDescription: 'vendorDescription',
            vendorName: 'vendorName',
            vendorRank: 'vendorRank',
            vendorRegistrationYear: 'vendorRegistrationYear',
          ),
          _defaultHeader(context, model, header: 'Location'),
          _locationDetail(context, model),
          _whiteSpace(defaultPaddingValue),
          _whiteSpace(_bottomBarHeight),
        ]),
        _bottomBar(context, model),
      ],
    );
  }

  SliverAppBar _appBarSliver(
      BuildContext context, BookingSummaryViewModel model) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      backgroundColor:
          // ignore: dead_code
          _colorDebug[0] != null ? _colorDebug[0] : kcBackgroundColor(context),
      leading: IconButton(
        onPressed: model.goBack,
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      title: Text(
        'Booking Summary',
        style: heading3Style.copyWith(color: Colors.black),
      ),
      centerTitle: true,
    );
  }

  SliverToBoxAdapter _whiteSpace(height) {
    return SliverToBoxAdapter(
      child: Container(
        color: _colorDebug[0],
        height: height,
      ),
    );
  }

  Widget _bottomBar(BuildContext context, BookingSummaryViewModel model) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _bottomBarHeight,
        width: double.infinity,
        padding: defaultPaddingHorizontal,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 2.0),
              blurRadius: 6.0,
            )
          ],
          color: _colorDebug[0] != null
              ? _colorDebug[0]
              : kcBackgroundColor(context),
        ),
        // TODO: Only show when a date is already selected
        child: Container(
          height: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: defaultPaddingValueSmall,
          ),
          decoration: BoxDecoration(
            color: kcPrimaryColor,
            borderRadius: defaultBorderRadius,
          ),
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: model.goToConfirmPage,
            child: Text(
              'Confirm Booking',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _gigSummary(
    BuildContext context,
    BookingSummaryViewModel model, {
    required List<String> tagList,
  }) {
    return SliverToBoxAdapter(
      child: Container(
        color: _colorDebug[3],
        child: Column(
          children: <Widget>[
            defaultDividers,
            verticalSpaceRegular,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: defaultPaddingValue),
                  color: _colorDebug[2],
                  height: _gigPhotoHeight,
                  width: _gigPhotoHeight * 1.5,
                  child: Placeholder(),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      right: defaultPaddingValue,
                      left: defaultPaddingValueSmall,
                    ),
                    color: _colorDebug[2],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Gig Title',
                          style: subheadingStyle,
                        ),
                        verticalSpaceSmall,
                        Text('\$150 - Premium Plan'),
                        verticalSpaceSmall,
                        _featuresPreview(
                          context,
                          model,
                          tagList: tagList,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            verticalSpaceRegular,
            defaultDividers,
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _upgradesSummary(
      BuildContext context, BookingSummaryViewModel model) {
    return SliverToBoxAdapter(
      child: Container(),
    );
  }

  SliverToBoxAdapter _vendorSummary(
    BuildContext context,
    BookingSummaryViewModel model, {
    required String vendorName,
    required String vendorDescription,
    required String vendorRegistrationYear,
    required String? vendorRank,
  }) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          defaultDividers,
          Container(
            padding: defaultPaddingAllSmallVertical,
            color: _colorDebug[1],
            child: Row(
              children: <Widget>[
                Container(
                  color: _colorDebug[3],
                  child: CircleAvatar(
                    radius: 40.0,
                    foregroundImage:
                        NetworkImage('http://placeimg.com/640/640/food'),
                  ),
                ),
                horizontalSpaceSmall,
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 4.0),
                    color: _colorDebug[0],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          vendorName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          vendorDescription,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        verticalSpaceTiny,
                        Text('Joined in $vendorRegistrationYear'),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 4.0),
                  color: _colorDebug[2],
                  child: Column(
                    children: <Widget>[
                      if (vendorRank != null)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: defaultBorderRadius,
                            color: kcPrimaryColor,
                          ),
                          child: Text(
                            vendorRank,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      verticalSpaceSmall,
                    ],
                  ),
                )
              ],
            ),
          ),
          defaultDividers,
        ],
      ),
    );
  }

  SliverToBoxAdapter _defaultHeader(
    BuildContext context,
    BookingSummaryViewModel model, {
    required String header,
  }) {
    return SliverToBoxAdapter(
      child: Container(
        color: _colorDebug[2],
        padding: defaultPaddingAllSmallVertical,
        width: double.infinity,
        child: Text(
          header,
          style: heading2Style,
        ),
      ),
    );
  }

  SliverToBoxAdapter _locationDetail(
      BuildContext context, BookingSummaryViewModel model) {
    return SliverToBoxAdapter(
      child: Container(
        color: _colorDebug[3],
        padding: defaultPaddingHorizontal,
        child: AspectRatio(aspectRatio: 1, child: Placeholder()),
      ),
    );
  }

  Widget _featuresPreview(
    BuildContext context,
    BookingSummaryViewModel model, {
    required List<String> tagList,
  }) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, tagIndex) {
          return Text(' - ${tagList[tagIndex]}');
        },
        separatorBuilder: (context, featureIndex) {
          return verticalSpaceTiny;
        },
        itemCount: 3);
  }
}
