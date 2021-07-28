// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String GigTitleValueKey = 'gigTitle';
const String GigSubtitleValueKey = 'gigSubtitle';
const String GigDescriptionValueKey = 'gigDescription';

mixin $AddGigTitleView on StatelessWidget {
  final TextEditingController gigTitleController = TextEditingController();
  final TextEditingController gigSubtitleController = TextEditingController();
  final TextEditingController gigDescriptionController =
      TextEditingController();
  final FocusNode gigTitleFocusNode = FocusNode();
  final FocusNode gigSubtitleFocusNode = FocusNode();
  final FocusNode gigDescriptionFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    gigTitleController.addListener(() => _updateFormData(model));
    gigSubtitleController.addListener(() => _updateFormData(model));
    gigDescriptionController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            GigTitleValueKey: gigTitleController.text,
            GigSubtitleValueKey: gigSubtitleController.text,
            GigDescriptionValueKey: gigDescriptionController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    gigTitleController.dispose();
    gigSubtitleController.dispose();
    gigDescriptionController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get gigTitleValue => this.formValueMap[GigTitleValueKey];
  String? get gigSubtitleValue => this.formValueMap[GigSubtitleValueKey];
  String? get gigDescriptionValue => this.formValueMap[GigDescriptionValueKey];

  bool get hasGigTitle => this.formValueMap.containsKey(GigTitleValueKey);
  bool get hasGigSubtitle => this.formValueMap.containsKey(GigSubtitleValueKey);
  bool get hasGigDescription =>
      this.formValueMap.containsKey(GigDescriptionValueKey);
}

extension Methods on FormViewModel {}
