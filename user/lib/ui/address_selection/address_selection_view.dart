import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/ui/address_selection/address_selection_view.form.dart';
import 'package:xyz_prototype/ui/address_selection/address_selection_viewmodel.dart';

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
        body: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Enter your address'),
              controller: addressController,
            ),
            if (!model.hasAutocompleteResults)
              Text('We have no suggestions for you'),
            if (model.hasAutocompleteResults)
              ...model.autoCompleteResults.map(
                (autoCompleteResults) => ListTile(
                  title: Text(autoCompleteResults.mainText ?? ''),
                  subtitle: Text(autoCompleteResults.secondaryText ?? ''),
                  onTap: () =>
                      model.selectAddressSuggestion(autoCompleteResults),
                ),
              )
          ],
        ),
      ),
      viewModelBuilder: () => AddressSelectionViewModel(),
    );
  }
}
