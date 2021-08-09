import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/constants/app_strings.dart';
import 'package:xyz_prototype/ui/gig_profile/gig_profile_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class GigProfileView extends StatelessWidget {
  const GigProfileView({Key? key}) : super(key: key);

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

  final _bottomBarHeight = 64.0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GigProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SafeArea(
            child: Stack(
              children: [
                CustomScrollView(
                  controller: model.scrollController,
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: GigProfileHeader(
                        minExtent: 48,
                        maxExtent: 320.0,
                      ),
                    ),
                    _gigProfileBody(context, model),
                    _whiteSpace(_bottomBarHeight),
                  ],
                ),
                if (model.selectedPricePackPage != null)
                  _bottomBar(context, model),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => GigProfileViewModel(),
    );
  }

  Align _bottomBar(BuildContext context, GigProfileViewModel model) {
    final bool _isPricePack = model.selectedPricePackPage! < 3;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 64.0,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (_isPricePack)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.pricePackages[model.selectedPricePackPage!],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  verticalSpaceTiny,
                  Text(
                    model.pricePackTypes[model.selectedPricePackPage!],
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
            if (_isPricePack)
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: kcPrimaryColor,
                  borderRadius: defaultBorderRadius,
                ),
                child: GestureDetector(
                  onTap: model.goToCalendarView,
                  child: Text(
                    'Check Availability',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (!_isPricePack)
              Expanded(
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
                    onTap: model.goToCalendarView,
                    child: Text(
                      'Request Availability',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  SliverFillRemaining _gigProfileBody(
    BuildContext context,
    GigProfileViewModel model,
  ) {
    final _pricePackages = model.pricePackages;

    return SliverFillRemaining(
      hasScrollBody: false,
      child: SingleChildScrollView(
        controller: model.scrollController,
        child: Column(
          children: <Widget>[
            _gigHeading(context, model),
            verticalSpaceRegular,
            defaultDividers,
            _vendorDetails(context, model),
            defaultDividers,
            verticalSpaceRegular,
            _pricePackSelector(context, model, _pricePackages),
            verticalSpaceRegular,
            _pricePackBuilder(context, model, _pricePackages),
            defaultDividers,
            verticalSpaceRegular,
            _gigLocationHeader(context, model),
            verticalSpaceRegular,
            _gigLocationMap(context, model),
            verticalSpaceRegular,
          ],
        ),
      ),
    );
  }

  Widget _vendorDetails(BuildContext context, GigProfileViewModel model) {
    return InkWell(
      onTap: model.goToVendorProfile,
      child: Container(
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
                      'Alexandra K.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      LoremIpsum,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpaceTiny,
                    Text('Joined in 2019'),
                  ],
                ),
              ),
            ),
            Container(
              color: _colorDebug[2],
              child: Column(
                children: <Widget>[
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
                      'Gold',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  verticalSpaceSmall,
                  GestureDetector(
                    child: Text(
                      'View Profile',
                      style: TextStyle(
                        color: kcPrimaryColor,
                        fontSize: 12.0,
                      ),
                    ),
                    onTap: () {
                      // TODO: Implement view profile
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _gigHeading(BuildContext context, GigProfileViewModel model) {
    return Container(
      margin: EdgeInsets.only(top: defaultPaddingValue),
      padding: EdgeInsets.only(
        left: defaultPaddingValue,
        right: defaultPaddingValue,
      ),
      width: double.infinity,
      color: _colorDebug[0],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Icon(Icons.star, size: 16.0),
              horizontalSpaceTiny,
              Text('5.0'),
              horizontalSpaceTiny,
              Text('(3 Review)'),
              horizontalSpaceSmall,
              Icon(
                Icons.verified,
                size: 16.0,
              ),
              horizontalSpaceTiny,
              Text('Verified'),
              Spacer(),
              Icon(Icons.message, size: 16.0),
              horizontalSpaceTiny,
              Text('Message'),
            ],
          ),
          verticalSpaceTiny,
          Text('San Francisco, California, United States'),
        ],
      ),
    );
  }

  Container _pricePackSelector(BuildContext context, GigProfileViewModel model,
      List<String> _pricePackages) {
    return Container(
      height: 24.0,
      width: screenWidth(context),
      margin: defaultPaddingHorizontal,
      decoration: BoxDecoration(
        color: _colorDebug[2],
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.black),
        ),
      ),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, packageIndex) {
            final int? _getSelectedPack = model.selectedPricePackPage;
            final bool _selectedPack = packageIndex == _getSelectedPack;

            return InkWell(
              onTap: () => model.selectPricePack(packageIndex),
              child: Container(
                decoration: BoxDecoration(
                  color: _colorDebug[3],
                  border: model.isBusy
                      ? null
                      : _selectedPack
                          ? Border(
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.black),
                            )
                          : null,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(_pricePackages[packageIndex]),
                ),
              ),
            );
          },
          separatorBuilder: (context, pageIndex) {
            return horizontalSpaceMedium;
          },
          itemCount: _pricePackages.length),
    );
  }

  Widget _pricePackBuilder(
    BuildContext context,
    GigProfileViewModel model,
    List<String> _pricePackages,
  ) {
    return Container(
      color: _colorDebug[1],
      padding: defaultPaddingHorizontal,
      child: ExpandablePageView.builder(
        itemBuilder: (context, packageView) {
          return Column(
            children: <Widget>[
              if (packageView <= 2) _pricePackDetails(context, model),
              if (packageView <= 2) verticalSpaceRegular,
              if (packageView > 2) _requestQuote(context, model),
            ],
          );
        },
        itemCount: _pricePackages.length,
        onPageChanged: (page) => model.updateSelectedPricePage(page),
        controller: model.pricePackPageController,
      ),
    );
  }

  Widget _requestQuote(BuildContext context, GigProfileViewModel model) {
    return BoxInputField(
      fillColor: Colors.transparent,
      keyboardType: TextInputType.multiline,
      maxLines: 10,
      maxLength: 500,
      // TODO: Replace the textEditingController
      controller: TextEditingController(),
      placeholder:
          'Give some details of your request to help Alexandra determine the appropriate quote',
    );
  }

  Widget _pricePackDetails(BuildContext context, GigProfileViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Price Package Description...'),
        verticalSpaceSmall,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Feature 1'),
            Icon(Icons.check),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Feature 2'),
            Icon(Icons.check),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Feature 3'),
            Icon(Icons.check),
          ],
        ),
      ],
    );
  }

  Widget _gigLocationHeader(BuildContext context, GigProfileViewModel model) {
    return Container(
      color: _colorDebug[0],
      padding: defaultPaddingHorizontal,
      width: double.infinity,
      child: Text(
        'Location',
        style: heading2Style,
      ),
    );
  }

  Widget _gigLocationMap(BuildContext context, GigProfileViewModel model) {
    return Container(
      margin: defaultPaddingHorizontal,
      child: AspectRatio(aspectRatio: 1, child: Placeholder()),
    );
  }

  SliverToBoxAdapter _whiteSpace(height) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
      ),
    );
  }
}

class GigProfileHeader implements SliverPersistentHeaderDelegate {
  GigProfileHeader({
    this.minExtent = 0.0,
    required this.maxExtent,
  });
  final double minExtent;
  final double maxExtent;

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
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(defaultBorderRadiusValue),
              bottomRight: Radius.circular(defaultBorderRadiusValue),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 6.0,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(defaultBorderRadiusValue),
              bottomRight: Radius.circular(defaultBorderRadiusValue),
            ),
            child: CachedNetworkImage(
              imageUrl: 'http://placeimg.com/640/640/food',
              fit: BoxFit.cover,
            ),
          ),
        ),
        // The gradient black bar underneath the title
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(defaultBorderRadiusValue),
              bottomRight: Radius.circular(defaultBorderRadiusValue),
            ),
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black54],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
          left: 24.0,
          right: 16.0,
          bottom: 16.0,
          child: Text(
            'Gig Title',
            style: heading2Style.copyWith(
              color: Colors.white.withOpacity(
                titleOpacity(shrinkOffset),
              ),
            ),
          ),
        ),
        Container(
          height: 48.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(appBarRadius(shrinkOffset)),
            ),
            color: kcBackgroundColor(context).withOpacity(
              appBarOpacity(shrinkOffset),
            ),
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: iconColor(shrinkOffset),
                ),
                onPressed: () {
                  // TODO: Implement cancel/goBack
                },
              ),
              _appBarTitle(shrinkOffset),
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: iconColor(shrinkOffset),
                ),
                onPressed: () {
                  // TODO: Implement share
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite_outline,
                  color: iconColor(shrinkOffset),
                ),
                onPressed: () {
                  // TODO: Implement favorite
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  _appBarTitle(double shrinkOffset) {
    final _availableSpace = (shrinkOffset + minExtent) / maxExtent;

    if (min(_availableSpace, 1) == 1) {
      return Expanded(
        child: Container(
          color: _colorDebug[3],
          child: Text(
            'Gig Title',
            style: heading3Style,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }
    return Spacer();
  }

  double titleOpacity(double shrinkOffset) {
    // simple formula: fade out text as soon as shrinkOffset > 0
    // return 1.0 - max(0.0, shrinkOffset) / maxExtent;
    // more complex formula: starts fading out text when shrinkOffset > minExtent
    return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  double appBarOpacity(double shrinkOffset) {
    final _availableSpace = (shrinkOffset + minExtent) / maxExtent;

    if (_availableSpace <= 0.15) {
      return 0;
    } else {
      return min(_availableSpace, 1);
    }
  }

  double appBarRadius(double shrinkOffset) {
    return 48 * (1 - (min((shrinkOffset + minExtent) / (maxExtent), 1)));
  }

  double printMeasurement(shrinkOffset) {
    final _availableSpace = (shrinkOffset + minExtent) / maxExtent;

    return _availableSpace;
  }

  Color iconColor(double shrinkOffset) {
    if (min((shrinkOffset + minExtent) / (maxExtent), 1) == 1) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;
}
