import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_title_view.form.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_title_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

@FormView(
  fields: [
    FormTextField(name: 'gigTitle'),
    FormTextField(name: 'gigDescription'),
  ],
)
class AddGigTitleView extends StatelessWidget with $AddGigTitleView {
  AddGigTitleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ViewModelBuilder<AddGigTitleViewModel>.reactive(
        onModelReady: (model) => listenToFormUpdated(model),
        builder: (context, model, child) => Scaffold(
          body: defaultSliverScreen(
            context,
            model,
            cancelButton: model.goBack,
            goBack: model.goBack,
            goContinue: model.goToAddPrice,
            heading: 'Add details to your gig',
            sliverBodyContent: _mainBodyContent(context, model),
          ),
        ),
        viewModelBuilder: () => AddGigTitleViewModel(),
      ),
    );
  }

  Widget _mainBodyContent(context, model) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: defaultPaddingAll,
        child: Column(
          children: <Widget>[
            defaultTextBoxTitle('Gig Title'),
            verticalSpaceSmall,
            BoxInputField(
              controller: gigTitleController,
              placeholder: 'Gig Title',
            ),
            verticalSpaceSmall,
            defaultTextBoxTitle('Gig Description'),
            verticalSpaceSmall,
            BoxInputField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: gigDescriptionController,
              placeholder: 'Gig Description',
            ),
          ],
        ),
      ),
    );
  }
}
