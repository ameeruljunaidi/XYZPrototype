import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/gig_manager/gig_manager_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class GigManagerView extends StatelessWidget {
  const GigManagerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GigManagerViewModel>.reactive(
      onModelReady: (model) => model.fetchGigs(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: model.goBack,
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Spacer(),
                    BoxText.body('Add Gig'),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 32.0,
                        ),
                        onPressed: model.goToAddGigView,
                      ),
                    ),
                  ],
                ),
                verticalSpaceSmall,
                Align(
                  alignment: Alignment.centerLeft,
                  child: BoxText.headingThree(
                    'Your Gigs',
                    align: TextAlign.left,
                  ),
                ),
                verticalSpaceRegular,
                model.gigs != null
                    ? Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return _gigCard(context, model, index);
                          },
                          itemCount: model.gigs!.length,
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(kcPrimaryColor),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => GigManagerViewModel(),
    );
  }

  Widget _gigCard(context, model, index) {
    return Column(
      children: [
        verticalSpaceTiny,
        Container(
          height: screenHeightPercentage(context, percentage: 0.15),
          width: double.infinity,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                    right: 8.0,
                  ),
                  child: ClipRRect(
                    borderRadius: defaultBorderRadius,
                    child: Container(
                      height: double.maxFinite,
                      color: kcVeryLightGreyColor,
                      child: Placeholder(),
                    ),
                  ),
                ),
              ),
              horizontalSpaceSmall,
              Column(
                children: [
                  verticalSpaceTiny,
                  BoxText.subheading(model.gigs[index].gigTitle),
                ],
              ),
            ],
          ),
        ),
        verticalSpaceTiny,
        Divider(),
      ],
    );
  }
}
