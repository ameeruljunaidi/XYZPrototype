import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/ui/notifications/notification_viewmodel.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationsViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        body: Center(child: Text('Notifications View')),
      ),
      viewModelBuilder: () => locator<NotificationsViewModel>(),
    );
  }
}
