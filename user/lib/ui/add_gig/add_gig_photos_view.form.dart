// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String GigTitleTestValueKey = 'gigTitleTest';

mixin $AddGigPhotosView on StatelessWidget {
  final TextEditingController gigTitleTestController = TextEditingController();
  final FocusNode gigTitleTestFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    gigTitleTestController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            GigTitleTestValueKey: gigTitleTestController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    gigTitleTestController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get gigTitleTestValue => this.formValueMap[GigTitleTestValueKey];

  bool get hasGigTitleTest =>
      this.formValueMap.containsKey(GigTitleTestValueKey);
}

extension Methods on FormViewModel {}
