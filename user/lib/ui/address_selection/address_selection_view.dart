import 'package:flutter/material.dart';
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
        floatingActionButton: BoxButton(
          title: 'Continue',
          busy: model.isBusy,
          disabled: !model.hasSelectedPlace,
          onTap: () => model.selectAddressSuggestion(),
        ),
        body: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Enter your address'),
              controller: addressController,
            ),
            if (!model.hasAutocompleteResults && !model.isBusy)
              Text('We have no suggestions for you'),
            if (model.hasAutocompleteResults)
              ...model.autoCompleteResults.map(
                (autoCompleteResults) => ListTile(
                  title: Text(autoCompleteResults.mainText ?? ''),
                  subtitle: Text(autoCompleteResults.secondaryText ?? ''),
                  onTap: () =>
                      model.selectSelectedSuggestion(autoCompleteResults),
                ),
              ),
            if (model.isBusy)
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BoxText.subheading('Saving your address'),
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(kcPrimaryColor),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      viewModelBuilder: () => AddressSelectionViewModel(),
    );
  }
}
