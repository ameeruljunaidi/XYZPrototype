// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String GigTitleValueKey = 'gigTitle';

mixin $AddGigView on StatelessWidget {
  final TextEditingController gigTitleController = TextEditingController();
  final FocusNode gigTitleFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    gigTitleController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            GigTitleValueKey: gigTitleController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    gigTitleController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get gigTitleValue => this.formValueMap[GigTitleValueKey];

  bool get hasGigTitle => this.formValueMap.containsKey(GigTitleValueKey);
}

extension Methods on FormViewModel {}
