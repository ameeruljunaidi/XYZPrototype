// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String GigTitleValueKey = 'gigTitle';
const String GigDescriptionValueKey = 'gigDescription';

mixin $AddGigTitleView on StatelessWidget {
  final TextEditingController gigTitleController = TextEditingController();
  final TextEditingController gigDescriptionController =
      TextEditingController();
  final FocusNode gigTitleFocusNode = FocusNode();
  final FocusNode gigDescriptionFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    gigTitleController.addListener(() => _updateFormData(model));
    gigDescriptionController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            GigTitleValueKey: gigTitleController.text,
            GigDescriptionValueKey: gigDescriptionController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    gigTitleController.dispose();
    gigDescriptionController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get gigTitleValue => this.formValueMap[GigTitleValueKey];
  String? get gigDescriptionValue => this.formValueMap[GigDescriptionValueKey];

  bool get hasGigTitle => this.formValueMap.containsKey(GigTitleValueKey);
  bool get hasGigDescription =>
      this.formValueMap.containsKey(GigDescriptionValueKey);
}

extension Methods on FormViewModel {}
