import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/inbox/inbox_viewmodel.dart';

class InboxView extends StatelessWidget {
  const InboxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InboxViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(child: Text('Inbox View')),
      ),
      viewModelBuilder: () => InboxViewModel(),
    );
  }
}
