import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_title_view.dart';
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
                return _gigCard(context, model, index);
              },
              itemCount: model.gigs!.length,
            ),
          )
        else if (model.isBusy)
          Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(kcPrimaryColor),
            ),
          )
        else if (model.gigs == null)
          Align(
            alignment: Alignment.bottomLeft,
            child: Text('Click add gig to start becoming a gigger!'),
          )
      ],
    );
  }

  Widget _gigCard(context, model, index) {
    final _gigAtIndex = model.gigs[index];

    return Column(
      children: [
        verticalSpaceTiny,
        Container(
          height: screenHeightPercentage(context, percentage: 0.15),
          width: double.infinity,
          child: InkWell(
            onTap: () {},
            child: Row(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                      right: 8.0,
                    ),
                    child: _gigAtIndex.gigPhotos.length == 0 ||
                            _gigAtIndex.gigPhotos[0] == ''
                        ? Container(
                            // height: double.maxFinite,
                            decoration: defaultBoxDecoration,
                            child: Center(
                              child: Text('No Image'),
                            ),
                          )
                        : Container(
                            decoration: defaultBoxDecoration,
                            child: ClipRRect(
                              borderRadius: defaultBorderRadius,
                              child: Image(
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: kcPrimaryColor,
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                                height: 50.0,
                                width: 50.0,
                                image: NetworkImage(_gigAtIndex.gigPhotos[0]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                ),
                horizontalSpaceSmall,
                Column(
                  children: [
                    verticalSpaceTiny,
                    BoxText.subheading(_gigAtIndex.gigTitle ?? 'Untitled'),
                  ],
                ),
                Spacer(),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: IconButton(
                //     onPressed: () => model.removeGig(index),
                //     icon: Icon(
                //       Icons.delete,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        verticalSpaceTiny,
        Divider(),
      ],
    );
  }
}
