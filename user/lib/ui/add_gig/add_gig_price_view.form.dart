// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String GigPriceTier1TitleValueKey = 'gigPriceTier1Title';
const String GigPriceTier1DescriptionValueKey = 'gigPriceTier1Description';
const String GigPriceTier1PriceValueKey = 'gigPriceTier1Price';
const String GigPriceTier2TitleValueKey = 'gigPriceTier2Title';
const String GigPriceTier2DescriptionValueKey = 'gigPriceTier2Description';
const String GigPriceTier2PriceValueKey = 'gigPriceTier2Price';
const String GigPriceTier3TitleValueKey = 'gigPriceTier3Title';
const String GigPriceTier3DescriptionValueKey = 'gigPriceTier3Description';
const String GigPriceTier3PriceValueKey = 'gigPriceTier3Price';

mixin $AddGigPriceView on StatelessWidget {
  final TextEditingController gigPriceTier1TitleController =
      TextEditingController();
  final TextEditingController gigPriceTier1DescriptionController =
      TextEditingController();
  final TextEditingController gigPriceTier1PriceController =
      TextEditingController();
  final TextEditingController gigPriceTier2TitleController =
      TextEditingController();
  final TextEditingController gigPriceTier2DescriptionController =
      TextEditingController();
  final TextEditingController gigPriceTier2PriceController =
      TextEditingController();
  final TextEditingController gigPriceTier3TitleController =
      TextEditingController();
  final TextEditingController gigPriceTier3DescriptionController =
      TextEditingController();
  final TextEditingController gigPriceTier3PriceController =
      TextEditingController();
  final FocusNode gigPriceTier1TitleFocusNode = FocusNode();
  final FocusNode gigPriceTier1DescriptionFocusNode = FocusNode();
  final FocusNode gigPriceTier1PriceFocusNode = FocusNode();
  final FocusNode gigPriceTier2TitleFocusNode = FocusNode();
  final FocusNode gigPriceTier2DescriptionFocusNode = FocusNode();
  final FocusNode gigPriceTier2PriceFocusNode = FocusNode();
  final FocusNode gigPriceTier3TitleFocusNode = FocusNode();
  final FocusNode gigPriceTier3DescriptionFocusNode = FocusNode();
  final FocusNode gigPriceTier3PriceFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    gigPriceTier1TitleController.addListener(() => _updateFormData(model));
    gigPriceTier1DescriptionController
        .addListener(() => _updateFormData(model));
    gigPriceTier1PriceController.addListener(() => _updateFormData(model));
    gigPriceTier2TitleController.addListener(() => _updateFormData(model));
    gigPriceTier2DescriptionController
        .addListener(() => _updateFormData(model));
    gigPriceTier2PriceController.addListener(() => _updateFormData(model));
    gigPriceTier3TitleController.addListener(() => _updateFormData(model));
    gigPriceTier3DescriptionController
        .addListener(() => _updateFormData(model));
    gigPriceTier3PriceController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            GigPriceTier1TitleValueKey: gigPriceTier1TitleController.text,
            GigPriceTier1DescriptionValueKey:
                gigPriceTier1DescriptionController.text,
            GigPriceTier1PriceValueKey: gigPriceTier1PriceController.text,
            GigPriceTier2TitleValueKey: gigPriceTier2TitleController.text,
            GigPriceTier2DescriptionValueKey:
                gigPriceTier2DescriptionController.text,
            GigPriceTier2PriceValueKey: gigPriceTier2PriceController.text,
            GigPriceTier3TitleValueKey: gigPriceTier3TitleController.text,
            GigPriceTier3DescriptionValueKey:
                gigPriceTier3DescriptionController.text,
            GigPriceTier3PriceValueKey: gigPriceTier3PriceController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    gigPriceTier1TitleController.dispose();
    gigPriceTier1DescriptionController.dispose();
    gigPriceTier1PriceController.dispose();
    gigPriceTier2TitleController.dispose();
    gigPriceTier2DescriptionController.dispose();
    gigPriceTier2PriceController.dispose();
    gigPriceTier3TitleController.dispose();
    gigPriceTier3DescriptionController.dispose();
    gigPriceTier3PriceController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get gigPriceTier1TitleValue =>
      this.formValueMap[GigPriceTier1TitleValueKey];
  String? get gigPriceTier1DescriptionValue =>
      this.formValueMap[GigPriceTier1DescriptionValueKey];
  String? get gigPriceTier1PriceValue =>
      this.formValueMap[GigPriceTier1PriceValueKey];
  String? get gigPriceTier2TitleValue =>
      this.formValueMap[GigPriceTier2TitleValueKey];
  String? get gigPriceTier2DescriptionValue =>
      this.formValueMap[GigPriceTier2DescriptionValueKey];
  String? get gigPriceTier2PriceValue =>
      this.formValueMap[GigPriceTier2PriceValueKey];
  String? get gigPriceTier3TitleValue =>
      this.formValueMap[GigPriceTier3TitleValueKey];
  String? get gigPriceTier3DescriptionValue =>
      this.formValueMap[GigPriceTier3DescriptionValueKey];
  String? get gigPriceTier3PriceValue =>
      this.formValueMap[GigPriceTier3PriceValueKey];

  bool get hasGigPriceTier1Title =>
      this.formValueMap.containsKey(GigPriceTier1TitleValueKey);
  bool get hasGigPriceTier1Description =>
      this.formValueMap.containsKey(GigPriceTier1DescriptionValueKey);
  bool get hasGigPriceTier1Price =>
      this.formValueMap.containsKey(GigPriceTier1PriceValueKey);
  bool get hasGigPriceTier2Title =>
      this.formValueMap.containsKey(GigPriceTier2TitleValueKey);
  bool get hasGigPriceTier2Description =>
      this.formValueMap.containsKey(GigPriceTier2DescriptionValueKey);
  bool get hasGigPriceTier2Price =>
      this.formValueMap.containsKey(GigPriceTier2PriceValueKey);
  bool get hasGigPriceTier3Title =>
      this.formValueMap.containsKey(GigPriceTier3TitleValueKey);
  bool get hasGigPriceTier3Description =>
      this.formValueMap.containsKey(GigPriceTier3DescriptionValueKey);
  bool get hasGigPriceTier3Price =>
      this.formValueMap.containsKey(GigPriceTier3PriceValueKey);
}

extension Methods on FormViewModel {}
