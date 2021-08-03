// Default visibility option for button
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xyz_ui/xyz_ui.dart';

Visibility addAddressButton(model, successRouteView) {
  return Visibility(
    visible: model.hasSelectedPlace,
    child: Container(
      margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 60.0),
      child: BoxButton(
        title: 'Continue',
        busy: model.isBusy,
        disabled: !model.hasSelectedPlace,
        onTap: () =>
            model.selectAddressSuggestion(successRouteView: successRouteView),
      ),
    ),
  );
}

Widget placesList(model, addressController) {
  return Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          ...model.autoCompleteResults
              .map(
                (autoCompleteResults) => _autoCompleteResultsList(
                  autoCompleteResults,
                  model,
                  addressController,
                ),
              )
              .toList(),
        ],
      ),
    ),
  );
}

Widget _autoCompleteResultsList(autoCompleteResults, model, addressController) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: AutoCompleteListItem(
      state: autoCompleteResults.secondaryText ?? '',
      city: autoCompleteResults.mainText ?? '',
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        model.selectSelectedSuggestion(autoCompleteResults);
        addressController.text = "${autoCompleteResults.mainText}";
      },
    ),
  );
}

List<Widget> addressSelectionBody(
  model,
  addressController, {
  header,
  subHeader,
}) {
  return [
    Align(
      alignment: Alignment.centerLeft,
      child: BoxText.headingTwo(
        header,
        align: TextAlign.left,
      ),
    ),
    verticalSpaceRegular,
    Align(
      alignment: Alignment.centerLeft,
      child: BoxText.body(
        subHeader,
        align: TextAlign.left,
      ),
    ),
    verticalSpaceMedium,
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
    if (model.hasAutocompleteResults)
      placesList(
        model,
        addressController,
      ),
  ];
}
