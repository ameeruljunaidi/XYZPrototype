import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/dumb_widgets/carousel_image.dart';
import 'package:xyz_prototype/ui/gig_manager/gig_manager_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class GigManagerView extends StatelessWidget {
  const GigManagerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GigManagerViewModel>.reactive(
      onModelReady: (model) => model.listenToGigs(),
      builder: (context, model, child) => Scaffold(
        appBar: defaultAppbar(
          context,
          model,
          actions: [
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
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: _gigManagerBody(model),
          ),
        ),
      ),
      viewModelBuilder: () => GigManagerViewModel(),
    );
  }

  Widget _gigManagerBody(model) {
    return Column(
      children: [
        verticalSpaceSmall,
        Align(
          alignment: Alignment.centerLeft,
          child: BoxText.headingThree(
            'Your Gigs',
            align: TextAlign.left,
          ),
        ),
        verticalSpaceRegular,
        if (model.gigs != null)
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final gigs = model.gigs![index];
                return _gigCard(context, model, index, ObjectKey(gigs));
              },
              itemCount: model.gigs!.length,
            ),
          )
        // else if (model.isBusy)
        //   Center(
        //     child: CircularProgressIndicator(
        //       valueColor: AlwaysStoppedAnimation(kcPrimaryColor),
        //     ),
        //   )
        else if (model.gigs == null)
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('Click add gig to start becoming a gigger!'),
          )
      ],
    );
  }

  Widget _gigCard(context, model, index, key) {
    final _gigAtIndex = model.gigs[index];

    return Column(
      key: key,
      children: [
        verticalSpaceTiny,
        Container(
          height: screenHeightPercentage(context, percentage: 0.15),
          width: double.infinity,
          child: Row(
            children: <Widget>[
              gigPhotos(_gigAtIndex),
              horizontalSpaceSmall,
              _cardItems(_gigAtIndex),
            ],
          ),
        ),
        verticalSpaceTiny,
        Divider(),
      ],
    );
  }

  Widget _cardItems(_gigAtIndex) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall,
          Align(
            alignment: Alignment.centerLeft,
            child: BoxText.subheading(
              _gigAtIndex.gigTitle ?? 'Untitled',
              fontWeight: FontWeight.bold,
              align: TextAlign.left,
            ),
          ),
          verticalSpaceTiny,
          BoxText.body(
            _gigAtIndex.gigSubtitle ?? '',
          ),
          verticalSpaceRegular,
          BoxText.body(
            _gigAtIndex.gigDescription ?? '',
          ),
        ],
      ),
    );
  }

  Widget gigPhotos(_gigAtIndex) {
    return AspectRatio(
      aspectRatio: 1,
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
}
