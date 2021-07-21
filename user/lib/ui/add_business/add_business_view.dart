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
    return ViewModelBuilder<AddBusinessViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: Visibility(
          // visible: ,
          child: Container(
            margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 60.0),
            child: BoxButton(
              title: 'Continue',
              busy: model.isBusy,
              // disabled: ,
              onTap: () => model.submitBusinessRegistration(),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
                verticalSpaceTiny,
                Center(
                  child: BoxText.headingTwo(
                      'This is where you will add your business.'),
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
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => AddBusinessViewModel(),
    );
  }
}
