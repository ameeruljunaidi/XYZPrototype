import 'package:flutter/material.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/services/gig_service.dart';
import 'package:xyz_prototype/ui/base/add_gig_viewmodel.dart';

class AddGigPriceChooserViewModel extends AddGigViewModel {
  final log = getLogger('addGigPriceChooserView');
  final _gigService = locator<GigService>();

  // List of pages
  List<String>? _pages = [
    'Choose Pricing Type',
    'Choose Quoting Type',
    'Continue',
  ];
  List<String>? get pages => _pages;

  // List of options for price type
  List<String>? _priceTypes = ['One Price', 'Two Packages', 'Three Packages'];
  List<String>? get priceTypes => _priceTypes;

  int? _selectedPriceType;
  int? get selectedPriceType => _selectedPriceType;

  void changeSelectedPriceType(index) {
    _selectedPriceType = index;
    notifyListeners();
  }

  // List of options for price type
  List<String>? _quoteTypes = ['Allow Quotes', 'Fixed Prices Only'];
  List<String>? get quoteTypes => _quoteTypes;

  int? _selectedQuoteType;
  int? get selectedQuoteType => _selectedQuoteType;

  void changeSelectedQuoteType(index) {
    _selectedQuoteType = index;
    notifyListeners();
  }

  // Functions for page controller on price chooser page
  PageController _pageController = PageController(initialPage: 0);
  PageController get pageController => _pageController;
}
