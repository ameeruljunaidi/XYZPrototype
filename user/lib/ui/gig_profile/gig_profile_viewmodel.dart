import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.router.dart';

class GigProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  List<String> _pricePackages = ['\$150', '\$75', '\$30', 'Request Quote'];
  List<String> get pricePackages => _pricePackages;

  List<String> _pricePackTypes = [
    'Premium Plan',
    'Pro Plan',
    'Basic Plan',
  ];
  List<String> get pricePackTypes => _pricePackTypes;

  ScrollController? _scrollController;
  ScrollController? get scrollController => _scrollController;

  PageController _pricePackPageController = PageController(initialPage: 0);
  PageController get pricePackPageController => _pricePackPageController;

  int? _selectedPricePackPage;
  int? get selectedPricePackPage => _selectedPricePackPage;

  void selectPricePack(int packageIndex) {
    setBusy(true);

    if (packageIndex != _selectedPricePackPage) {
      _selectedPricePackPage = packageIndex;
    } else {
      _selectedPricePackPage = null;
    }

    _pricePackPageController.animateToPage(
      packageIndex,
      duration: Duration(milliseconds: 250),
      curve: Curves.linear,
    );

    notifyListeners();
    setBusy(false);
  }

  updateSelectedPricePage(int page) {
    _selectedPricePackPage = page;

    notifyListeners();
  }

  // Navigation service
  void goToVendorProfile() {
    _navigationService.navigateTo(Routes.vendorProfileView);
  }

  void goToCalendarView() {
    _navigationService.navigateTo(Routes.dateSelectionView);
  }
}
