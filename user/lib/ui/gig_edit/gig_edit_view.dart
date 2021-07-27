import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/gig_edit/gig_edit_viewmodel.dart';
import 'package:xyz_ui/xyz_ui.dart';

class GigEditView extends StatelessWidget {
  const GigEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _sheetHeight = screenHeightPercentage(context, percentage: 0.6);
    final _sheetHeighPercentage = _sheetHeight / (screenHeight(context));

    return ViewModelBuilder<GigEditViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: DraggableScrollableSheet(
            initialChildSize: _sheetHeighPercentage * 0.75,
            minChildSize: _sheetHeighPercentage * 0.5,
            maxChildSize: _sheetHeighPercentage,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                controller: scrollController,
                child: Container(
                  height: _sheetHeight,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.0),
                      topLeft: Radius.circular(16.0),
                    ),
                  ),
                  child: _sheetBody(model),
                ),
              );
            }),
      ),
      viewModelBuilder: () => GigEditViewModel(),
    );
  }

  Widget _sheetBody(model) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: model.goBack,
              icon: Icon(
                Icons.close,
                size: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
