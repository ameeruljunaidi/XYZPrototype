import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/gig_manager/gig_manager_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class GigManagerView extends StatelessWidget {
  const GigManagerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GigManagerViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: model.goBack,
                ),
              ),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: model.goToAddGigView,
          child: Icon(Icons.add),
          backgroundColor: kcPrimaryColor,
        ),
      ),
      viewModelBuilder: () => GigManagerViewModel(),
    );
  }
}
