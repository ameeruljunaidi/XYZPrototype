import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/ui/marketplace/marketplace_viewmodel.dart';
import 'package:xyz_prototype/ui/marketplace/marketplace_view.form.dart';
import 'package:xyz_ui/xyz_ui.dart';

@FormView(fields: [
  FormTextField(name: 'search'),
])
class MarketPlaceView extends StatelessWidget with $MarketPlaceView {
  MarketPlaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MarketPlaceViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    verticalSpaceRegular,
                    BoxInputField(
                      controller: TextEditingController(),
                      placeholder: 'Search for Service Around You',
                      textAlign: TextAlign.center,
                      tapOnly: true,
                    ),
                    verticalSpaceRegular,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: BoxText.headingThree(
                        'Services',
                        align: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpaceRegular,
              _servicesHorizontalScrollView(context, 'service-list'),
              verticalSpaceRegular,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: BoxText.headingThree(
                    'Gigs',
                    align: TextAlign.left,
                  ),
                ),
              ),
              verticalSpaceRegular,
              _servicesHorizontalScrollView(context, 'gig-list'),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => locator<MarketPlaceViewModel>(),
    );
  }

  Widget _servicesHorizontalScrollView(context, textKey) {
    return Container(
      height: screenHeightPercentage(context, percentage: 0.16),
      width: double.infinity,
      child: ListView.builder(
        key: PageStorageKey(textKey),
        padding: EdgeInsets.only(left: 8.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: defaultBorderRadius,
                child: Container(
                  color: kcLightGreyColor,
                  height: double.maxFinite,
                  // color: Colors.blue,
                  child: Placeholder(),
                ),
              ),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
