import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/ui/address_selection/address_selection_view.form.dart';
import 'package:xyz_prototype/ui/address_selection/address_selection_viewmodel.dart';
import 'package:xyz_prototype/ui/dumb_widgets/add_address_widgets.dart';
import 'package:xyz_prototype/ui/home/home_view.dart';
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
        appBar: defaultAppbar(context, model),
        bottomNavigationBar: addAddressButton(model, HomeView()),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: addressSelectionBody(model, addressController,
                header: 'Find services near you',
                subHeader:
                    'Please enter you location or allow access to your location to find services near you.'),
          ),
        ),
      ),
      viewModelBuilder: () => AddressSelectionViewModel(),
    );
  }
}
