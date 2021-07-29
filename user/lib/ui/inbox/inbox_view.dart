import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/ui/inbox/inbox_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class InboxView extends StatelessWidget {
  const InboxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InboxViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      onModelReady: (model) => model.getData(),
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (model.subCategoriesList != null)
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(model.subCategoriesList![index]);
                  },
                  itemCount: model.subCategoriesList!.length,
                ),
              )
            else
              Center(
                  child: CircularProgressIndicator(
                backgroundColor: kcAccentColorLight,
                color: kcPrimaryColor,
              )),
          ],
        ),
      ),
      viewModelBuilder: () => locator<InboxViewModel>(),
    );
  }
}
