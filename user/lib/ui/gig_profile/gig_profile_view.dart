import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/constants/app_strings.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/ui/gig_profile/gig_profile_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class GigProfileView extends StatelessWidget {
  GigProfileView({Key? key}) : super(key: key);

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
  final _controller = ScrollController();

  double get maxHeight => 200;
  double get minHeight => kToolbarHeight;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GigProfileViewModel>.reactive(
      onModelReady: (model) => model.startupLogic(),
      builder: (context, model, child) => Scaffold(
        body: _pageBody(context, model),
      ),
      viewModelBuilder: () => GigProfileViewModel(),
    );
  }

  Widget _pageBody(BuildContext context, GigProfileViewModel model) {
    final Gig? _loadedGig = model.currentGig;
    final Client? _gigClient = model.gigClient;
    final Vendor? _gigVendor = model.gigVendor;
    final Address? _gigAddress = model.gigLocation;

    final bool _loadedGigExist = _loadedGig != null;
    final bool _gigClientExist = _gigClient != null;
    final bool _gigVendorExist = _gigVendor != null;
    final bool _gigAddressExist = _gigAddress != null;

    if (_loadedGigExist &&
        _gigClientExist &&
        _gigVendorExist &&
        _gigAddressExist) {
      final String _gigRating = _loadedGig.gigRating != null
          ? _loadedGig.gigRating.toString()
          : 'No Rating';
      final String _gigReviewNumber = _loadedGig.gigReviews != null
          ? _loadedGig.gigReviews!.length.toString()
          : 'No';

      final String _gigTitle = _loadedGig.gigTitle ?? 'No Title';
      final String _gigLocationStreet = _gigAddress.street ?? '';
      final String _gigLocationCity = _gigAddress.city ?? '';
      final String _gigLocationState = _gigAddress.state ?? '';
      final String _gigLocation =
          '$_gigLocationStreet, $_gigLocationCity, $_gigLocationState';

      final bool _isVerified = _gigVendor.isVerified;

      final String _vendorDescription = LoremIpsum;
      final String _vendorName = _gigVendor.vendorName ?? 'No Name';
      final String _vendorRank = _gigVendor.vendorRank ?? 'Unranked';

      final DateFormat registrationYearFormatter = DateFormat('y');
      final DateTime _vendorRestrationDate =
          DateTime.parse(_gigVendor.vendorRegistrationDate);
      final String _vendorRegistrationYear =
          registrationYearFormatter.format(_vendorRestrationDate);

      final List<String>? _pricePackages = model.pricePackages;
      final List<String>? _pricePackName = model.pricePackName;
      final List<String>? _pricePackDescription = model.pricePackDescription;
      final List<Map<String, dynamic>>? _priceFeature = model.priceFeatures;

      final bool _pricePackagesExist = _pricePackages != null;
      final bool _pricePackNameExist = _pricePackName != null;
      final bool _pricePackDescriptionExist = _pricePackDescription != null;
      final bool _pricePackFeaturesExist = _priceFeature != null;

      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: NotificationListener<ScrollEndNotification>(
          onNotification: (_) {
            _snapAppbar();
            return false;
          },
          child: Stack(
            children: [
              CustomScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                controller: _controller,
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    stretch: true,
                    flexibleSpace: _header(
                      context,
                      model,
                      gigTitle: _gigTitle,
                    ),
                    expandedHeight: maxHeight,
                  ),
                  _gigProfileContent(
                    context,
                    model,
                    gigAddress: _gigAddress,
                    gigClient: _gigClient,
                    gigVendor: _gigVendor,
                    loadedGig: _loadedGig,
                    gigLocation: _gigLocation,
                    gigRating: _gigRating,
                    gigReviewNumber: _gigReviewNumber,
                    isVerified: _isVerified,
                    priceFeature: _priceFeature ?? [],
                    pricePackages: _pricePackages ?? [],
                    pricePackDescription: _pricePackDescription ?? [],
                    pricePackagesExist: _pricePackagesExist,
                    pricePackDescriptionExist: _pricePackDescriptionExist,
                    pricePackFeaturesExist: _pricePackFeaturesExist,
                    pricePackNameExist: _pricePackNameExist,
                    vendorDescription: _vendorDescription,
                    vendorName: _vendorName,
                    vendorRank: _vendorRank,
                    vendorRegistrationYear: _vendorRegistrationYear,
                  ),
                  if (model.selectedPricePackPage != null)
                    _whiteSpace(_bottomBarHeight),
                ],
              ),
              if (model.selectedPricePackPage != null)
                _bottomBar(context, model),
            ],
          ),
        ),
      );
    } else {
      return Center(child: CircularProgressIndicator(color: kcPrimaryColor));
    }
  }

  void _snapAppbar() {
    final scrollDistance = maxHeight - minHeight;

    if (_controller.offset > 0 && _controller.offset < scrollDistance) {
      final double snapOffset =
          _controller.offset / scrollDistance > 0.5 ? scrollDistance : 0;

      Future.microtask(() => _controller.animateTo(snapOffset,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn));
    }
  }

  LayoutBuilder _header(
    BuildContext context,
    GigProfileViewModel model, {
    required String gigTitle,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final expandRatio = _calculateExpandRatio(constraints);
        final animation = AlwaysStoppedAnimation(expandRatio);

        return Stack(
          fit: StackFit.expand,
          children: [
            _buildImage(animation),
            _buildGradient(animation),
            _buildTitle(
              animation,
              gigTitle: gigTitle,
            ),
          ],
        );
      },
    );
  }

  double _calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio =
        (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
    if (expandRatio > 1.0) expandRatio = 1.0;
    if (expandRatio < 0.0) expandRatio = 0.0;
    return expandRatio;
  }

  Align _buildTitle(Animation<double> animation, {required String gigTitle}) {
    return Align(
      alignment: AlignmentTween(
              begin: Alignment.bottomCenter, end: Alignment.bottomLeft)
          .evaluate(animation),
      child: Container(
        margin: EdgeInsets.only(bottom: 12, left: 12),
        child: Text(
          gigTitle,
          style: TextStyle(
            fontSize: Tween<double>(begin: 18, end: 36).evaluate(animation),
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  Container _buildGradient(Animation<double> animation) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            ColorTween(begin: Colors.black87, end: Colors.black38)
                .evaluate(animation)!
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  ClipRRect _buildImage(Animation<double> animation) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(defaultBorderRadiusValue),
        bottomRight: Radius.circular(defaultBorderRadiusValue),
      ),
      child: Image.network(
        "http://placeimg.com/640/640/food",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _bottomBar(BuildContext context, GigProfileViewModel model) {
    final bool _isPricePack = model.selectedPricePackPage! < 3;

    final List<String>? _pricePackages = model.pricePackages;
    final List<String>? _pricePackTitle = model.pricePackName;

    final bool _pricePackagesExist = _pricePackages != null;
    final bool _pricePackTitleExist = _pricePackTitle != null;

    if (_pricePackagesExist && _pricePackTitleExist) {
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
                      _pricePackages[model.selectedPricePackPage!],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpaceTiny,
                    Text(
                      _pricePackTitle[model.selectedPricePackPage!],
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
    } else {
      return Container();
    }
  }

  SliverFillRemaining _gigProfileContent(
      BuildContext context, GigProfileViewModel model,
      {required Gig loadedGig,
      required Address gigAddress,
      required Vendor gigVendor,
      required Client gigClient,
      required String gigRating,
      required String gigReviewNumber,
      required String gigLocation,
      required String vendorDescription,
      required String vendorName,
      required String vendorRank,
      required String vendorRegistrationYear,
      required List<String> pricePackDescription,
      required List<String> pricePackages,
      required List<Map<String, dynamic>> priceFeature,
      required bool isVerified,
      required bool pricePackagesExist,
      required bool pricePackNameExist,
      required bool pricePackDescriptionExist,
      required bool pricePackFeaturesExist}) {
    if (pricePackagesExist &&
        pricePackNameExist &&
        pricePackDescriptionExist &&
        pricePackFeaturesExist) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: SingleChildScrollView(
          controller: model.scrollController,
          child: Column(
            children: <Widget>[
              _gigHeading(
                context,
                model,
                gigRating: gigRating,
                gigReviewNumbers: gigReviewNumber,
                isVerified: isVerified,
                gigLocation: gigLocation,
              ),
              verticalSpaceRegular,
              defaultDividers,
              _vendorDetails(
                context,
                model,
                vendorDescription: vendorDescription,
                vendorName: vendorName,
                vendorRank: vendorRank,
                vendorRegistrationYear: vendorRegistrationYear,
              ),
              defaultDividers,
              verticalSpaceRegular,
              if (pricePackagesExist)
                _pricePackSelector(
                  context,
                  model,
                  pricePackages: pricePackages,
                ),
              verticalSpaceRegular,
              if (pricePackagesExist)
                _pricePackBuilder(
                  context,
                  model,
                  featuresList: priceFeature,
                  pricePackages: pricePackages,
                  pricePackDescription: pricePackDescription,
                  vendorName: vendorName,
                ),
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
    } else {
      return _progressIndicator();
    }
  }

  SliverFillRemaining _progressIndicator() {
    return SliverFillRemaining(
      child: Column(children: [
        verticalSpaceLarge,
        CircularProgressIndicator(color: kcPrimaryColor),
      ]),
    );
  }

  Widget _vendorDetails(
    BuildContext context,
    GigProfileViewModel model, {
    required String vendorName,
    required String vendorDescription,
    required String vendorRegistrationYear,
    required String? vendorRank,
  }) {
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
                  if (vendorRank != null)
                    GestureDetector(
                      child: Text(
                        'View Profile',
                        style: TextStyle(
                          color: kcPrimaryColor,
                          fontSize: 12.0,
                        ),
                      ),
                      onTap: model.goToVendorProfile,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _gigHeading(
    BuildContext context,
    GigProfileViewModel model, {
    required String gigRating,
    required String gigReviewNumbers,
    required bool isVerified,
    required String gigLocation,
  }) {
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
              Text(gigRating),
              horizontalSpaceTiny,
              Text('($gigReviewNumbers Review)'),
              horizontalSpaceSmall,
              if (isVerified) _verifiedLogo(),
              Spacer(),
              Icon(Icons.message, size: 16.0),
              horizontalSpaceTiny,
              Text('Message'),
            ],
          ),
          verticalSpaceTiny,
          Text(gigLocation),
        ],
      ),
    );
  }

  Row _verifiedLogo() {
    return Row(
      children: [
        Icon(
          Icons.verified,
          size: 16.0,
        ),
        horizontalSpaceTiny,
        Text('Verified'),
      ],
    );
  }

  Widget _pricePackSelector(
    BuildContext context,
    GigProfileViewModel model, {
    required List<String> pricePackages,
  }) {
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
            final String _pricePack = pricePackages[packageIndex];
            final bool _priceExist = _pricePack != '\$';

            final bool _selectedPack = packageIndex == _getSelectedPack;

            if (_priceExist) {
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
                    child: Text(_pricePack),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
          separatorBuilder: (context, pageIndex) {
            final String _pricePack = pricePackages[pageIndex];
            final bool _priceExist = _pricePack != '\$';

            if (_priceExist) {
              return horizontalSpaceMedium;
            } else {
              return SizedBox.shrink();
            }
          },
          itemCount: pricePackages.length),
    );
  }

  Widget _pricePackBuilder(
    BuildContext context,
    GigProfileViewModel model, {
    required List<String> pricePackages,
    required List<String> pricePackDescription,
    required List<Map<String, dynamic>> featuresList,
    required String vendorName,
  }) {
    return Container(
      color: _colorDebug[1],
      padding: defaultPaddingHorizontal,
      child: ExpandablePageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, packageView) {
          final bool _priceExist = pricePackages[packageView] != '\$';

          return Column(
            children: <Widget>[
              if (packageView <= 2 && _priceExist)
                _pricePackDetails(
                  context,
                  model,
                  featuresList: featuresList[packageView],
                  pricePackDescription: pricePackDescription[packageView],
                ),
              if (packageView <= 2) verticalSpaceRegular,
              if (packageView > 2)
                _requestQuote(
                  context,
                  model,
                  vendorName: vendorName,
                ),
            ],
          );
        },
        itemCount: pricePackages.length,
        onPageChanged: (page) => model.updateSelectedPricePage(page),
        controller: model.pricePackPageController,
      ),
    );
  }

  Widget _requestQuote(
    BuildContext context,
    GigProfileViewModel model, {
    required String vendorName,
  }) {
    return BoxInputField(
      fillColor: Colors.transparent,
      keyboardType: TextInputType.multiline,
      maxLines: 10,
      maxLength: 500,
      // TODO: Replace the textEditingController
      controller: TextEditingController(),
      placeholder:
          'Give some details of your request to help $vendorName determine the appropriate quote.',
    );
  }

  Widget _pricePackDetails(
    BuildContext context,
    GigProfileViewModel model, {
    required Map<String, dynamic> featuresList,
    required String pricePackDescription,
  }) {
    final _featuresList = Map.fromEntries(
      featuresList.entries.toList()
        ..sort((e1, e2) => e2.value.compareTo(e1.value)),
    );

    List<String> _featureTitle = <String>[];
    List<bool> _featureApplicability = <bool>[];

    _featuresList.forEach((key, value) {
      _featureTitle.add(key.toString());

      if (value == 'true' || value == 'false') {
        _featureApplicability.add(model.stringToBool(value));
      } else {
        _featureApplicability.add(false);
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(pricePackDescription),
        verticalSpaceSmall,
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, featureIndex) {
              return _featureDetail(
                context,
                model,
                featureTitle: _featureTitle[featureIndex],
                featureApplicable: _featureApplicability[featureIndex],
              );
            },
            separatorBuilder: (context, featureIndex) {
              return verticalSpaceTiny;
            },
            itemCount: featuresList.length)
      ],
    );
  }

  Widget _featureDetail(
    BuildContext context,
    GigProfileViewModel model, {
    required String featureTitle,
    required bool featureApplicable,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          featureTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (featureApplicable) Icon(Icons.check),
        if (!featureApplicable) Icon(Icons.clear),
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
