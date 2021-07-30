import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_viewmodel.dart';
import 'package:xyz_prototype/ui/dumb_widgets/add_gig_button.dart';
import 'package:xyz_ui/xyz_ui.dart';

class AddGigPhotosView extends StatelessWidget {
  const AddGigPhotosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddGigViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: defaultFakeCardBody(
          context,
          model,
          initialPercentage: 0.75,
          minPercentage: 0.4,
          heading: 'Add photos to your gig',
          removePadding: true,
          children: <Widget>[
            verticalSpaceMedium,
            _addImagesButton(model),
            verticalSpaceRegular,
            _imagesPreviewGrid(context, model),
            verticalSpaceSmall,
            _addGIgButtonCustom(model),
            verticalSpaceRegular,
            _backAndContinueCustom(model),
          ],
        ),
      ),
      viewModelBuilder: () => AddGigViewModel(),
    );
  }

  Widget _addImagesButton(AddGigViewModel model) {
    return Padding(
      padding: defaultPaddingHorizontal,
      child: BoxButton.outline(
        title: 'Select Image to Upload',
        onTap: () => model.selectImage(),
      ),
    );
  }

  Widget _backAndContinueCustom(AddGigViewModel model) {
    return Padding(
      padding: defaultPaddingHorizontal,
      child: defaultBackAndContinue(
        goBack: model.goBack,
      ),
    );
  }

  Widget _addGIgButtonCustom(AddGigViewModel model) {
    return Padding(
      padding: defaultPaddingHorizontal,
      child: addGigButton(model),
    );
  }

  Widget _imagesPreviewGrid(context, model) {
    final _gridHeight = screenHeightPercentage(context, percentage: 0.2);

    if (model.selectedImages != null) {
      return Container(
        height: _gridHeight,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 1,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: defaultBorderRadius,
              child: Image.file(
                File(model.selectedImages[index].path),
                fit: BoxFit.cover,
              ),
            );
          },
          itemCount: model.selectedImages.length,
        ),
      );
    } else {
      return Center(child: BoxText.body('Image Preview'));
    }
  }
}
