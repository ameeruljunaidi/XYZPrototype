// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String BusinessNameValueKey = 'businessName';
const String BusinessDescriptionValueKey = 'businessDescription';
const String BusinessWebsiteValueKey = 'businessWebsite';

mixin $AddBusinessView on StatelessWidget {
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController businessDescriptionController =
      TextEditingController();
  final TextEditingController businessWebsiteController =
      TextEditingController();
  final FocusNode businessNameFocusNode = FocusNode();
  final FocusNode businessDescriptionFocusNode = FocusNode();
  final FocusNode businessWebsiteFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    businessNameController.addListener(() => _updateFormData(model));
    businessDescriptionController.addListener(() => _updateFormData(model));
    businessWebsiteController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            BusinessNameValueKey: businessNameController.text,
            BusinessDescriptionValueKey: businessDescriptionController.text,
            BusinessWebsiteValueKey: businessWebsiteController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    businessNameController.dispose();
    businessDescriptionController.dispose();
    businessWebsiteController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get businessNameValue => this.formValueMap[BusinessNameValueKey];
  String? get businessDescriptionValue =>
      this.formValueMap[BusinessDescriptionValueKey];
  String? get businessWebsiteValue =>
      this.formValueMap[BusinessWebsiteValueKey];

  bool get hasBusinessName =>
      this.formValueMap.containsKey(BusinessNameValueKey);
  bool get hasBusinessDescription =>
      this.formValueMap.containsKey(BusinessDescriptionValueKey);
  bool get hasBusinessWebsite =>
      this.formValueMap.containsKey(BusinessWebsiteValueKey);
}

extension Methods on FormViewModel {}
