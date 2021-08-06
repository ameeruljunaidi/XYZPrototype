// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String MessageInputValueKey = 'messageInput';

mixin $ChatView on StatelessWidget {
  final TextEditingController messageInputController = TextEditingController();
  final FocusNode messageInputFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    messageInputController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            MessageInputValueKey: messageInputController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    messageInputController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get messageInputValue => this.formValueMap[MessageInputValueKey];

  bool get hasMessageInput =>
      this.formValueMap.containsKey(MessageInputValueKey);
}

extension Methods on FormViewModel {}
