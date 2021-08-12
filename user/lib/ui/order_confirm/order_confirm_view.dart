import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/order_confirm/order_confirm_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class OrderConfirmView extends StatelessWidget {
  const OrderConfirmView({Key? key}) : super(key: key);

  static const _colorDebug = [
    // Colors.red,
    // Colors.blue,
    // Colors.green,
    // Colors.grey,
    null,
    null,
    null,
    null
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrderConfirmViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: _pageBody(context, model),
        ),
      ),
      viewModelBuilder: () => OrderConfirmViewModel(),
    );
  }

  Widget _pageBody(BuildContext context, OrderConfirmViewModel model) {
    return CustomScrollView(
      slivers: [
        _appBarSliver(context, model),
        _mainContent(context, model),
      ],
    );
  }

  SliverAppBar _appBarSliver(
      BuildContext context, OrderConfirmViewModel model) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      backgroundColor:
          // ignore: dead_code
          _colorDebug[0] != null ? _colorDebug[0] : kcBackgroundColor(context),
      leading: IconButton(
        onPressed: model.goBack,
        icon: Icon(
          Icons.clear,
          color: Colors.black,
        ),
      ),
    );
  }

  SliverFillRemaining _mainContent(
      BuildContext context, OrderConfirmViewModel model) {
    return SliverFillRemaining(
      child: Container(
        color: _colorDebug[1],
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 64.0),
          color: _colorDebug[2],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle_outline,
                size: 104.0,
              ),
              verticalSpaceRegular,
              Text('You are all set!'),
              verticalSpaceRegular,
              Text(
                'We will let you know once Alexandra has confirmed your booking/request',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              verticalSpaceLarge,
              InkWell(
                onTap: model.goToHome,
                child: Text(
                  'View My Bookings',
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
