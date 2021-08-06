import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SearchViewModel extends BaseViewModel {
  // Get the list of pages for inbox view
  List<String>? _pages = [
    'Today',
    'Tomorrow',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  List<String>? get pages => _pages;

  // Functions for page controller on inbox page
  PageController _pageController = PageController(initialPage: 0);
  PageController get pageController => _pageController;

  int _selectedActivitiesPage = 0;
  int get selectedActivitiesPage => _selectedActivitiesPage;

  // Controller for pages
  void goToPageIndex(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );

    _selectedActivitiesPage = index;

    notifyListeners();
  }

  void updateSelectedPricePage(index) {
    _selectedActivitiesPage = index;

    notifyListeners();
  }
}
