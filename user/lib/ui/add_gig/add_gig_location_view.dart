import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_location_viewmodel.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_location_view.form.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_photos_view.dart';
import 'package:xyz_prototype/ui/dumb_widgets/add_address_widgets.dart';
import 'package:xyz_ui/xyz_ui.dart';

@FormView(
  fields: [FormTextField(name: 'address')],
)
class AddGigLocationView extends StatelessWidget with $AddGigLocationView {
  AddGigLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ViewModelBuilder<AddGigLocationViewModel>.reactive(
        onModelReady: (model) => listenToFormUpdated(model),
        builder: (context, model, child) => Scaffold(
          appBar: defaultAppbar(context, model),
          bottomNavigationBar: addAddressButton(model, AddGigPhotosView()),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: addressSelectionBody(
                model,
                addressController,
                header: 'Give your service a location',
                subHeader:
                    'Having a location would allow us to target potential customers for you better!',
              ),
            ),
          ),
        ),
        viewModelBuilder: () => AddGigLocationViewModel(),
      ),
    );
  }
}
