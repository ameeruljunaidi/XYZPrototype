import 'package:flutter/material.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/gig_service.dart';
import 'package:xyz_prototype/services/service_services.dart';
import 'package:xyz_prototype/ui/base/add_gig_viewmodel.dart';

class AddGigPriceViewModel extends AddGigViewModel {
  final log = getLogger('AddGigPriceViewModel');
  final _gigService = locator<GigService>();
  final _serviceService = locator<ServiceService>();

  // Get the list of pages
  List<String>? _pages = ['Package 1', 'Package 2', 'Package 3', 'Quote'];
  List<String>? get pages => _pages;

  // Get price tier title based on page number
  String? getPricePackageTitle(int pageViewIndex) {
    Map<int, String> pricePackageTitleMap = {
      0: _pages![0],
      1: _pages![1],
      2: _pages![2],
      3: _pages![3],
    };

    return pricePackageTitleMap[pageViewIndex];
  }

  // Get list of suggested features
  // All the features options would be the same regardless of the price package
  // Creating getters for list of features for different price packages
  List<ServiceFeatures>? _packageOneFeatures = [];
  List<ServiceFeatures>? _packageTwoFeatures = [];
  List<ServiceFeatures>? _packageThreeFeatures = [];

  // Each sub-category would have different suggested features
  // See https://rb.gy/dso2ep for list in Google sheets
  void getSuggestedFeaturesFromSubCategory() async {
    setBusy(true);
    final _loadedGig = _gigService.currentGig;

    Map<String, String> _suggestedFeaturesMap;
    List<ServiceFeatures> _suggestedFeatures = <ServiceFeatures>[];

    if (_loadedGig != null) {
      final _loadedGigSubCategory = _loadedGig.gigSubCategory!;
      _suggestedFeaturesMap = await _serviceService.getFeaturesFromSubCategory(
        _loadedGigSubCategory,
      );

      _suggestedFeaturesMap.forEach((key, value) {
        _suggestedFeatures.add(
          ServiceFeatures(
            serviceFeatureName: key,
            serviceFeatureType: value,
            serviceFeatureValue: 'false',
          ),
        );
      });

      _suggestedFeatures.forEach((features) {
        _packageOneFeatures!.add(features);
        _packageTwoFeatures!.add(features);
        _packageThreeFeatures!.add(features);
      });
    } else {
      log.v('Could not find loaded gig');
    }

    notifyListeners();
    setBusy(false);
  }

  // Get features list based on the page index
  List<ServiceFeatures>? suggestedFeaturesList(int pageIndex) {
    Map<int, List<ServiceFeatures>?> _features = {
      0: _packageOneFeatures,
      1: _packageTwoFeatures,
      2: _packageThreeFeatures,
    };

    return _features[pageIndex];
  }

  // Function to toggle check box
  void featureCheckboxToggle(
    List<ServiceFeatures> featuresList,
    int pageIndex,
    int featureIndex,
    bool value,
  ) {
    setBusy(true);
    suggestedFeaturesList(pageIndex)![featureIndex] =
        featuresList[featureIndex].copyWith(
      serviceFeatureValue: boolToString(value),
    );

    log.v('Feature update: ${featuresList[featureIndex]}');

    notifyListeners();
    setBusy(false);
  }

  bool stringToBool(String value) {
    if (value == 'true') {
      return true;
    } else if (value == 'false') {
      return false;
    } else {
      return false;
    }
  }

  String boolToString(bool value) {
    if (value == true) {
      return 'true';
    } else if (value == false) {
      return 'false';
    } else {
      return 'false';
    }
  }

  // Tracker for custom features

  int? _customFeaturesCount = 0;
  int? get customFeaturesCount => _customFeaturesCount;

  // Function to add custom feature depending on which package
  void addCustomFeature() {
    setBusy(true);
    if (_customFeaturesCount! < 9) {
      _packageOneFeatures!
          .add(getCustomeFeaturesControllers(_customFeaturesCount)!);
      _packageTwoFeatures!
          .add(getCustomeFeaturesControllers(_customFeaturesCount)!);
      _packageThreeFeatures!
          .add(getCustomeFeaturesControllers(_customFeaturesCount)!);

      _customFeaturesCount = _customFeaturesCount! + 1;
    } else {
      log.v('No more custome features available');
    }
    log.v('Custom feature count: $_customFeaturesCount');
    notifyListeners();
    setBusy(false);
  }

  // Functions for page controller on price page
  PageController _pageController = PageController(initialPage: 0);
  PageController get pageController => _pageController;

  int _selectedPricePage = 0;
  int get selectedPricePage => _selectedPricePage;

  // Controller for pages
  void goToPageIndex(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );

    _selectedPricePage = index;

    notifyListeners();
  }

  void updateSelectedPricePage(index) {
    _selectedPricePage = index;
    log.v('check 1st page: $_packageOneFeatures');
    log.v('check 2nd page: $_packageTwoFeatures');
    log.v('check 3rd page: $_packageThreeFeatures');

    notifyListeners();
  }
}
