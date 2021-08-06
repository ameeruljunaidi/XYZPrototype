import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';

class InboxViewModel extends BaseViewModel {
  final log = getLogger('inboxViewmodel');
  final _navigationService = locator<NavigationService>();

  // Get the list of pages for inbox view
  List<String>? _pages = ['Messages', 'Notifications'];
  List<String>? get pages => _pages;

  // Functions for page controller on inbox page
  PageController _pageController = PageController(initialPage: 0);
  PageController get pageController => _pageController;

  int _selectedInboxPage = 0;
  int get selectedInboxPage => _selectedInboxPage;

  // Controller for pages
  void goToPageIndex(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );

    _selectedInboxPage = index;

    notifyListeners();
  }

  void updateSelectedPricePage(index) {
    _selectedInboxPage = index;

    notifyListeners();
  }

  // Navigation functions
  void goToChat() {
    _navigationService.navigateTo(Routes.chatView);
  }
}
