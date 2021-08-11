import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/date_selection/date_selection_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class DateSelectionView extends StatelessWidget {
  const DateSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DateSelectionViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: BoxButton(
            title: 'Test Order',
            onTap: () => model.testOrder(),
          ),
        ),
      ),
      viewModelBuilder: () => DateSelectionViewModel(),
    );
  }
}
