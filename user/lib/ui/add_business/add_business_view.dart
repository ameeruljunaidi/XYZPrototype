import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/ui/add_business/add_business_viewmodel.dart';
import 'package:xyz_prototype/ui/add_business/add_business_view.form.dart';
import 'package:xyz_ui/xyz_ui.dart';

@FormView(
  fields: [
    FormTextField(name: 'businessName'),
    FormTextField(name: 'businessDescription'),
    FormTextField(name: 'businessWebsite'),
  ],
)
class AddBusinessView extends StatelessWidget with $AddBusinessView {
  AddBusinessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Center(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: BoxButton(
            title: 'Become a Gigger',
            onTap: () => defaultBottomSheet(
              context: context,
              builder: (context) => Container(
                height: screenHeightPercentage(context, percentage: 0.9),
                child: ViewModelBuilder<AddBusinessViewModel>.reactive(
                  onModelReady: (model) => listenToFormUpdated(model),
                  builder: (context, model, child) => Scaffold(
                    body: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Icon(Icons.drag_handle),
                            verticalSpaceRegular,
                            Center(
                              child: BoxText.headingTwo(
                                  'Add details about your business'),
                            ),
                            verticalSpaceMedium,
                            BoxInputField(
                              controller: businessNameController,
                              placeholder: 'Business Name',
                            ),
                            verticalSpaceMedium,
                            BoxInputField(
                              controller: businessDescriptionController,
                              placeholder: 'Business Description',
                            ),
                            verticalSpaceMedium,
                            BoxInputField(
                              controller: businessWebsiteController,
                              placeholder: 'Business Website',
                            ),
                            verticalSpaceLarge,
                            BoxButton(
                              title: 'Continue',
                              busy: model.isBusy,
                              // disabled: ,
                              onTap: () => model.submitBusinessRegistration(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  viewModelBuilder: () => AddBusinessViewModel(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
