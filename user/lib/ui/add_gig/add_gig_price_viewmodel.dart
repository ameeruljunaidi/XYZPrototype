import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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

  // Get price tier title based on page number
  String? getPricePackageTitle(int pageViewIndex) {
    Map<int, String> pricePackageTitleMap = {
      0: 'Package 1',
      1: 'Package 2',
      2: 'Package 3',
      3: 'Custom Quote'
    };

    return pricePackageTitleMap[pageViewIndex];
  }

  List<ServiceFeatures>? _suggestedFeaturesList;
  List<ServiceFeatures>? get suggestedFeaturesList => _suggestedFeaturesList;

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

      _suggestedFeaturesList = _suggestedFeatures;
    } else {
      log.v('Could not find loaded gig');
    }

    notifyListeners();
    setBusy(false);
  }

  bool _featureCheckbox = false;
  bool get featureCheckbox => _featureCheckbox;

  void featureCheckboxToggle(
    List<ServiceFeatures> featuresList,
    int index,
    bool value,
  ) {
    _suggestedFeaturesList![index] = featuresList[index].copyWith(
      serviceFeatureValue: boolToString(value),
    );
    log.v('see value: $value');
    log.v('see boolToStirng: ${boolToString(value)}');
    log.v('see feature update: ${featuresList[index]}');

    notifyListeners();
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

    notifyListeners();
  }
}
