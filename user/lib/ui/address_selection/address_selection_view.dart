import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/ui/address_selection/address_selection_view.form.dart';
import 'package:xyz_prototype/ui/address_selection/address_selection_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

@FormView(
  fields: [FormTextField(name: 'address')],
)
class AddressSelectionView extends StatelessWidget with $AddressSelectionView {
  AddressSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddressSelectionViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: Visibility(
          visible: model.hasSelectedPlace,
          child: Container(
            margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 60.0),
            child: BoxButton(
              title: 'Continue',
              busy: model.isBusy,
              disabled: !model.hasSelectedPlace,
              onTap: () => model.selectAddressSuggestion(),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              verticalSpaceRegular,
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.close, color: Colors.black),
                  onPressed: model.forceAddress,
                ),
              ),
              verticalSpaceSmall,
              Center(child: BoxText.headingTwo('Find services near you')),
              verticalSpaceRegular,
              Center(
                  child: BoxText.body(
                'Please enter you location or allow access to your location to find services near you.',
                align: TextAlign.center,
              )),
              verticalSpaceLarge,
              BoxButton.outline(
                title: 'Use current location',
                leading: Icon(Icons.navigation, color: kcPrimaryColor),
              ),
              verticalSpaceRegular,
              BoxInputField(
                placeholder: 'Enter a new address',
                leading: Icon(
                  Icons.location_pin,
                  color: kcPrimaryColor,
                ),
                // decoration: InputDecoration(hintText: 'Enter your address'),
                controller: addressController,
              ),
              verticalSpaceRegular,
              if (!model.hasAutocompleteResults &&
                  !model.isBusy &&
                  !model.hasSelectedPlace &&
                  addressController.text != '')
                Text(
                  'We have no suggestions for you',
                  textAlign: TextAlign.center,
                ),
              if (model.hasAutocompleteResults) _placesList(model),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => AddressSelectionViewModel(),
    );
  }

  Widget _placesList(model) {
    return Expanded(
        child: SingleChildScrollView(
            child: Column(children: [
      ...model.autoCompleteResults
          .map(
            (autoCompleteResults) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: AutoCompleteListItem(
                  state: autoCompleteResults.secondaryText ?? '',
                  city: autoCompleteResults.mainText ?? '',
                  onTap: () {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                    model.selectSelectedSuggestion(autoCompleteResults);
                    addressController.text = "${autoCompleteResults.mainText}";
                  }),
            ),
          )
          .toList(),
    ])));
  }
}
