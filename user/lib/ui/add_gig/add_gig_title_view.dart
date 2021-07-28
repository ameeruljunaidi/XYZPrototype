import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_title_view.form.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

@FormView(
  fields: [
    FormTextField(name: 'gigTitle'),
    FormTextField(name: 'gigSubtitle'),
    FormTextField(name: 'gigDescription'),
  ],
)
class AddGigTitleView extends StatelessWidget with $AddGigTitleView {
  AddGigTitleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ViewModelBuilder<AddGigViewModel>.reactive(
        onModelReady: (model) => listenToFormUpdated(model),
        builder: (context, model, child) => Scaffold(
          body: defaultFakeCardBody(
            context,
            model,
            initialPercentage: 0.5,
            minPercentage: 0.25,
            heading: 'Add details to your gig',
            subheading:
                'Give a short title, catchy subtitle, and brief description of your service. Don\'t worry, you can tweak and perfect these details later!',
            children: <Widget>[
              defaultTextBoxTitle('Gig Title'),
              verticalSpaceSmall,
              BoxInputField(
                controller: gigTitleController,
                placeholder: 'Gig Title',
              ),
              verticalSpaceRegular,
              defaultTextBoxTitle('Gig Subtitle'),
              verticalSpaceSmall,
              BoxInputField(
                controller: gigSubtitleController,
                placeholder: 'Gig Subtitle',
              ),
              verticalSpaceRegular,
              defaultTextBoxTitle('Gig Description'),
              verticalSpaceSmall,
              BoxInputField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: gigDescriptionController,
                placeholder: 'Gig Description',
              ),
              verticalSpaceMedium,
              defaultBackAndContinue(
                goBack: model.goBack,
                goContinue: model.goToAddPhoto,
              )
            ],
          ),
        ),
        viewModelBuilder: () => AddGigViewModel(),
      ),
    );
  }
}
