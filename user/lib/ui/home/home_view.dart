import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/home/home_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: BoxText.headline('Hello World'),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
