import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_view.form.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

@FormView(
  fields: [
    FormTextField(name: 'gigTitle'),
  ],
)
class AddGigView extends StatelessWidget with $AddGigView {
  AddGigView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.add,
          color: Colors.black,
          size: 32.0,
        ),
        onPressed: () {
          defaultBottomSheet(
            context: context,
            builder: (context) => Container(
              height: screenHeightPercentage(context, percentage: 0.9),
              child: ViewModelBuilder<AddGigViewModel>.reactive(
                onModelReady: (model) => listenToFormUpdated(model),
                builder: (context, model, child) => Scaffold(
                  body: _widgetBody(model),
                ),
                viewModelBuilder: () => AddGigViewModel(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _widgetBody(model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Icon(Icons.drag_handle),
            verticalSpaceRegular,
            Align(
              alignment: Alignment.centerLeft,
              child: BoxText.headingTwo('Add details to your gig'),
            ),
            verticalSpaceMedium,
            BoxInputField(
              controller: gigTitleController,
              placeholder: 'Gig Title',
            ),
            verticalSpaceMedium,
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
            _addGigButton(model),
          ],
        ),
      ),
    );
  }

  Widget _addGigButton(model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: BoxButton(
            busy: model.isBusy,
            title: 'Confirm Add Gig',
            onTap: () => model.addGig(),
          ),
        ),
      ),
    );
  }
}
