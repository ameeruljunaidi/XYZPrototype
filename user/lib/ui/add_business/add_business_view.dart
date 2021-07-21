import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/add_business/add_business_viewmodel.dart';

class AddBusinessView extends StatelessWidget {
  const AddBusinessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddBusinessViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text('This is where you will add your business.'),
        ),
      ),
      viewModelBuilder: () => AddBusinessViewModel(),
    );
  }
}
