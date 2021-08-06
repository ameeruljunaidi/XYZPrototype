import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/dumb_widgets/carousel_image.dart';
import 'package:xyz_prototype/ui/gig_manager/gig_manager_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class GigManagerView extends StatelessWidget {
  const GigManagerView({Key? key}) : super(key: key);

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
    return ViewModelBuilder<GigManagerViewModel>.reactive(
      onModelReady: (model) => model.listenToGigs(),
      builder: (context, model, child) => Scaffold(
        appBar: defaultAppbar(
          context,
          model,
          actions: [..._addGigButton(context, model)],
        ),
        body: Column(
          children: <Widget>[
            _screenHeading(context),
            _gigsBuilder(context, model),
          ],
        ),
      ),
      viewModelBuilder: () => GigManagerViewModel(),
    );
  }

  Widget _gigsBuilder(BuildContext context, GigManagerViewModel model) {
    if (model.gigs != null) {
      return ListView.separated(
          padding: EdgeInsets.symmetric(vertical: defaultPaddingValueSmall),
          shrinkWrap: true,
          itemBuilder: (context, gigIndex) {
            return _gigsCard(context, model, gigIndex, key);
          },
          separatorBuilder: (context, gigIndex) {
            return verticalSpaceRegular;
          },
          itemCount: model.gigs!.length);
    } else {
      return Container(
        width: double.infinity,
        color: _colorDebug[1],
        padding: defaultPaddingAllSmallVertical,
        child: Text('Click add gig to start adding gigs!'),
      );
    }
  }

  Widget _gigsCard(
    BuildContext context,
    GigManagerViewModel model,
    int index,
    key,
  ) {
    final _gigAtIndex = model.gigs![index];

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 96,
        width: screenWidth(context),
        color: _colorDebug[3],
        child: Padding(
          padding: defaultPaddingHorizontal,
          child: Stack(
            children: <Widget>[
              _activitiesDetails(context, _gigAtIndex),
              _activitiesAvatar(_gigAtIndex),
            ],
          ),
        ),
      ),
    );
  }

  Widget _carouselSlider(_gigAtIndex) {
    return CarouselImages(
      scaleFactor: 1,
      listImages: _gigAtIndex.gigPhotos,
      height: double.infinity,
      borderRadius: defaultBorderRadiusValue,
      cachedNetworkImage: true,
      verticalAlignment: Alignment.topCenter,
    );
  }

  Align _activitiesDetails(BuildContext context, _gigAtIndex) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: double.maxFinite,
        width: 320,
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
            left: 32.0,
            right: 16.0,
          ),
          child: Container(
            color: _colorDebug[1],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _gigAtIndex.gigTitle ?? 'Untitled',
                    style: subheadingStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                verticalSpaceTiny,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _gigAtIndex.gigDescription ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align _activitiesAvatar(_gigAtIndex) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: defaultBoxDecoration(
          color: Colors.white,
          shadow: true,
        ),
        height: 64,
        width: 64,
        child: _gigAtIndex.gigPhotos == null
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: defaultBorderRadius,
                  border: Border.all(color: kcVeryLightGreyColor),
                ),
                child: Center(
                  child: Text('No Image'),
                ),
              )
            : _carouselSlider(_gigAtIndex),
      ),
    );
  }

  List<Widget> _addGigButton(BuildContext context, GigManagerViewModel model) {
    return [
      Align(
        alignment: Alignment.center,
        child: BoxText.body(
          'Add Gig',
          align: TextAlign.center,
        ),
      ),
      IconButton(
        icon: Icon(Icons.add),
        onPressed: model.goToAddGig,
      )
    ];
  }

  Container _screenHeading(BuildContext context) {
    return Container(
      padding: defaultPaddingHorizontal,
      width: screenWidth(context),
      color: _colorDebug[2],
      child: BoxText.headline('Your Gigs'),
    );
  }
}
