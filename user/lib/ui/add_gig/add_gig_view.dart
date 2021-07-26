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
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24.0),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            context: context,
            builder: (context) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(200))),
              height: screenHeightPercentage(context, percentage: 0.9),
              child: ViewModelBuilder<AddGigViewModel>.reactive(
                onModelReady: (model) => listenToFormUpdated(model),
                builder: (context, model, child) => Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.drag_handle),
                          verticalSpaceRegular,
                          Align(
                            alignment: Alignment.centerLeft,
                            child:
                                BoxText.headingTwo('Add details to your gig'),
                          ),
                          verticalSpaceMedium,
                          Align(
                            alignment: Alignment.centerLeft,
                            child: BoxText.body(
                              'Title',
                              align: TextAlign.left,
                              color: Colors.black,
                            ),
                          ),
                          verticalSpaceSmall,
                          BoxInputField(
                            controller: gigTitleController,
                            placeholder: 'Gig Title',
                          ),
                          verticalSpaceMedium,
                          Align(
                            alignment: Alignment.centerLeft,
                            child: BoxText.body(
                              'Upload Image',
                              align: TextAlign.left,
                              color: Colors.black,
                            ),
                          ),
                          verticalSpaceSmall,
                          BoxButton.outline(
                            title: 'Select Image to Upload',
                            onTap: () => model.selectImage(),
                          ),
                          verticalSpaceRegular,
                          _addGigButton(model),
                        ],
                      ),
                    ),
                  ),
                ),
                viewModelBuilder: () => AddGigViewModel(),
              ),
            ),
          );
        },
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
            title: 'Confirm Add Gig',
            onTap: () => model.addGig(),
          ),
        ),
      ),
    );
  }
}
