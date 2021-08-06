import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';

class ChatViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  // Navigation functions
  void goBack() {
    _navigationService.back();
  }
}
