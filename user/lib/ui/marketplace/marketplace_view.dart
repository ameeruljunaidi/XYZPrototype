import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/marketplace/marketplace_viewmodel.dart';

class MarketPlaceView extends StatelessWidget {
  const MarketPlaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MarketPlaceViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(child: Text('Marketplace View')),
      ),
      viewModelBuilder: () => MarketPlaceViewModel(),
    );
  }
}
