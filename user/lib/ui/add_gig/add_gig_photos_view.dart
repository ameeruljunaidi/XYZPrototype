import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_viewmodel.dart';
import 'package:xyz_prototype/ui/dumb_widgets/add_gig_button.dart';
import 'package:xyz_ui/xyz_ui.dart';

class AddGigPhotosView extends StatelessWidget {
  const AddGigPhotosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddGigViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: defaultFakeCardBody(
          context,
          model,
          initialPercentage: 0.5,
          minPercentage: 0.25,
          heading: 'Add photos to your gig',
          children: <Widget>[
            defaultTextBoxTitle('Upload Image'),
            verticalSpaceSmall,
            BoxButton.outline(
              title: 'Select Image to Upload',
              onTap: () => model.selectImage(),
            ),
            verticalSpaceRegular,
            addGigButton(model),
            verticalSpaceRegular,
            defaultBackAndContinue(
              goBack: model.goBack,
            ),
          ],
        ),
      ),
      viewModelBuilder: () => AddGigViewModel(),
    );
  }
}
