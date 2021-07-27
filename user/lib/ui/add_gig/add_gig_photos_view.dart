import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_photos_view.form.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

@FormView(
  fields: [
    FormTextField(name: 'gigTitleTest'),
  ],
)
class AddGigPhotosView extends StatelessWidget with $AddGigPhotosView {
  AddGigPhotosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddGigViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        body: defaultFakeCardBody(
          context,
          model,
          initialPercentage: 0.5,
          minPercentage: 0.25,
          goBack: model.goBack,
          heading: 'Add photos to your gig',
          children: <Widget>[
            defaultTextBoxTitle('Upload Image'),
            verticalSpaceSmall,
            BoxButton.outline(
              title: 'Select Image to Upload',
              onTap: () => model.selectImage(),
            ),
            verticalSpaceRegular,
            Text(model.selectedImage != null
                ? model.selectedImage!.name
                : 'No image'),
            verticalSpaceRegular,
            defaultBackAndContinue(
              goBack: model.goBack,
              goContinue: () => model.addGig(),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => AddGigViewModel(),
    );
  }
}
