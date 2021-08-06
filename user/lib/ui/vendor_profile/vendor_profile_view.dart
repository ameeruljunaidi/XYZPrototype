import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/ui/vendor_profile/vendor_profile_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class VendorProfileView extends StatelessWidget {
  const VendorProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VendorProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: defaultAppbar(
          context,
          model,
          cancelButton: model.goBack,
          actions: [
            _shareButtonAppBar(),
          ],
        ),
        body: _mainBodyContent(context, model),
      ),
      viewModelBuilder: () => VendorProfileViewModel(),
    );
  }

  Widget _mainBodyContent(BuildContext context, VendorProfileViewModel model) {
    final _headerCardHeight = screenHeight(context) * 0.25; // 25% of screen
    final _avatarRadius = _headerCardHeight * 0.35; // 35% of cardHeight

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              _circleAvatar(_avatarRadius),
              _socialMediaStatus(_avatarRadius)
            ],
          ),
          _vendorNameRank(),
          _vendorQuickBits(),
          _vendorOptionButtons(),
          defaultDividers,
          _customHeadings(context, 'Alexandra\'s Gigs'),
          _gigCarouselBuilder(context, model),
          defaultDividers,
          _customHeadings(context, 'Alexandra\'s Instagram'),
          _vendorInstagramGrid(context, model),
          defaultDividers,
          _customHeadings(context, 'Alexandra\'s Reviews'),
        ],
      ),
    );
  }

  Container _customHeadings(BuildContext context, String heading) {
    return Container(
      // color: Colors.blue,
      padding: defaultPaddingAllSmallVertical,
      width: screenWidth(context),
      child: BoxText.headingThree(heading),
    );
  }

  Container _vendorOptionButtons() {
    return Container(
      padding: defaultPaddingAllSmallVertical,
      // color: Colors.red,
      child: Container(
        height: 40,
        // color: Colors.green,
        child: Row(
          children: <Widget>[
            Container(
              height: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8.0,
              ),
              decoration: defaultBoxDecoration(
                color: kcPrimaryColor,
                shadow: false,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Check Availability',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            horizontalSpaceSmall,
            Container(
              height: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 8.0,
              ),
              decoration: defaultBoxDecoration(
                color: Colors.transparent,
                shadow: false,
                borderColor: kcPrimaryColor,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Follow',
                  style: TextStyle(color: kcPrimaryColor),
                ),
              ),
            ),
            horizontalSpaceSmall,
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              decoration: defaultBoxDecoration(
                color: Colors.transparent,
                borderColor: kcPrimaryColor,
                shadow: false,
              ),
              child: Icon(Icons.chat),
            ),
          ],
        ),
      ),
    );
  }

  Container _vendorQuickBits() {
    return Container(
      padding: defaultPaddingAllSmallVertical,
      // color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.location_pin),
              horizontalSpaceSmall,
              BoxText.subheading('San Francisco, California'),
            ],
          ),
          verticalSpaceSmall,
          Row(
            children: <Widget>[
              Icon(Icons.language),
              horizontalSpaceSmall,
              BoxText.subheading('Speaks English, and Spanish'),
            ],
          ),
          verticalSpaceSmall,
          Row(
            children: <Widget>[
              Icon(Icons.school),
              horizontalSpaceSmall,
              BoxText.subheading('HairDressing School'),
            ],
          ),
        ],
      ),
    );
  }

  Container _vendorNameRank() {
    return Container(
      // color: Colors.green,
      child: Padding(
        padding: defaultPaddingAllSmallVertical,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            BoxText.headingThree('Alexandra K.'),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 24.0,
              ),
              decoration: defaultBoxDecoration(
                color: kcPrimaryColor,
                shadow: false,
              ),
              child: Text(
                'Gold',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _socialMediaStatus(double _avatarRadius) {
    return Expanded(
      child: Container(
        height: _avatarRadius * 2,
        // color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoxText.headingThree('##'),
                    BoxText.subheading('Gigs'),
                  ],
                ),
                horizontalSpaceLarge,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoxText.headingThree('##'),
                    BoxText.subheading('Reviews'),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpaceRegular,
                BoxText.headingThree('##'),
                BoxText.subheading('Followers'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _circleAvatar(double _avatarRadius) {
    return Container(
      // color: Colors.red,
      child: Padding(
        padding: EdgeInsets.only(left: 24.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: kcMediumGreyColor,
              radius: _avatarRadius,
              // foregroundImage: // User image,
              // child: // If not user image is supplied,
            ),
            horizontalSpaceRegular,
          ],
        ),
      ),
    );
  }

  _gigCarouselBuilder(BuildContext context, VendorProfileViewModel model) {
    final List<Gig> _fakeGigs = <Gig>[
      Gig(
        gigTitle: 'Fake Gig One',
        gigReviews: {'Good': 2, 'Excellent': 5, 'Alright': 1},
      ),
      Gig(
        gigTitle: 'Fake Gig Two',
        gigReviews: {'Good': 2, 'Excellent': 5},
      ),
      Gig(
        gigTitle: 'Fake Gig Three',
        gigReviews: {'Good': 2, 'Excellent': 5, 'Alright': 1},
      ),
    ];

    final _carouselContainerHeight = screenHeight(context) * 0.4;
    final _carouselWidth = screenWidth(context) * 0.7;

    return Container(
      height: _carouselContainerHeight,
      width: screenWidth(context),
      // color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _fakeGigs.length,
        itemBuilder: (context, gigIndex) {
          return Container(
            width: _carouselWidth,
            // color: Colors.grey,
            padding: EdgeInsets.only(
              left: defaultPaddingValue,
              top: defaultPaddingValueSmall,
              bottom: defaultPaddingValueSmall,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    // color: Colors.green,
                    child: Placeholder(),
                  ),
                ),
                verticalSpaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.star),
                    Text('(${_fakeGigs[gigIndex].gigReviews!.length} reviews)'),
                    // TODO: Fix this text later
                  ],
                ),
                verticalSpaceTiny,
                Align(
                  alignment: Alignment.centerLeft,
                  child: BoxText.subheading(
                    _fakeGigs[gigIndex].gigTitle!,
                    align: TextAlign.left,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _vendorInstagramGrid(BuildContext context, VendorProfileViewModel model) {
    final List<String> _fakeInstaImages = <String>[
      'image one',
      'image two',
      'image three',
      'image four',
      'image five',
      'image six',
      'image seven',
      'image eight',
      'image nine',
    ];

    final _gridHeight = screenHeight(context) * 0.45;
    // TODO: Need to find a way to set height dynamically

    return Container(
      margin: defaultPaddingAllSmallVertical,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
        ),
        itemCount: _fakeInstaImages.length,
        itemBuilder: (context, imageIndex) {
          return Container(
            decoration: defaultBoxDecoration(
              color: Colors.transparent,
              shadow: false,
              borderColor: Colors.black,
              borderRadius: false,
            ),
            child: Placeholder(),
          );
        },
      ),
    );
  }

  Widget _shareButtonAppBar() {
    return Padding(
      padding: defaultPaddingHorizontal,
      child: IconButton(
        icon: Icon(Icons.share),
        onPressed: () {},
      ),
    );
  }
}
