import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/enums/basic_dialog_status.dart';
import 'package:xyz_prototype/enums/dialog_type.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/gig_service.dart';
import 'package:xyz_prototype/services/service_services.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_location_view.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_price_view.form.dart';

class AddGigPriceViewModel extends FormViewModel {
  final log = getLogger('AddGigPriceViewModel');
  final _gigService = locator<GigService>();
  final _serviceService = locator<ServiceService>();
  final _navigationService = locator<NavigationService>();
  final _firestoreApi = locator<FirestoreApi>();
  final _dialogService = locator<DialogService>();

  @override
  void setFormStatus() {}

  // Get the selected price type from gig service
  int? _selectedPriceType;
  int? get selectedPriceType => _selectedPriceType;

  // Get the selected quote type from gig service
  int? _selectedQuoteType;
  int? get selectedQuoteType => _selectedQuoteType;

  // Get the list of pages
  List<String>? _pages = ['Package 1', 'Package 2', 'Package 3', 'Quote'];
  List<String>? get pages => _pages;

  // Bool to see if the user selected the price or quote type
  List<bool>? _pagesBool;
  List<bool>? get pagesBool => _pagesBool;

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
  void getDataForScreen() async {
    setBusy(true);

    final _loadedGig = _gigService.currentGig;

    Map<String, String> _suggestedFeaturesMap;
    List<ServiceFeatures> _suggestedFeatures = <ServiceFeatures>[];

    if (_loadedGig != null) {
      final _loadedGigCategory = _loadedGig.gigCategory!;
      _suggestedFeaturesMap = await _serviceService.getFeaturesFromSubCategory(
        _loadedGigCategory,
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

      // _selectedPriceType = _gigService.chosenPriceType;
      // _selectedQuoteType = _gigService.choseQuoteType;

      // Map<int, List<bool>> _selectedPriceMap = {
      //   0: [true, false, false],
      //   1: [true, true, false],
      //   2: [true, true, true],
      // };

      // _pagesBool = _selectedPriceMap[_selectedPriceType];

      // if (_selectedQuoteType == 0) {
      //   _pagesBool!.add(true);
      // } else {
      //   _pagesBool!.add(false);
      // }
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

  List<String>? _quoteOptions = ['Enable', 'Disable'];
  List<String>? get quoteOptions => _quoteOptions;

  int? _quoteOptionSelected;
  int? get quoteOptionSelected => _quoteOptionSelected;

  void selectQuoteOption(index) {
    _quoteOptionSelected = index;
    notifyListeners();
  }

  bool intToBool(int quoteIndex) {
    if (quoteIndex == 0) {
      return true;
    } else if (quoteIndex == 1) {
      return false;
    } else {
      return false;
    }
  }

  // Store prices data, need to do it here to get the text controllers
  void storeData() {
    final Map<String, String> _packageOneFeaturesMap = Map.fromIterable(
      _packageOneFeatures!,
      key: (feature) => feature.serviceFeatureName,
      value: (feature) => feature.serviceFeatureValue,
    );

    final Map<String, String> _packageTwoFeaturesMap = Map.fromIterable(
      _packageTwoFeatures!,
      key: (feature) => feature.serviceFeatureName,
      value: (feature) => feature.serviceFeatureValue,
    );

    final Map<String, String> _packageThreeFeaturesMap = Map.fromIterable(
      _packageThreeFeatures!,
      key: (feature) => feature.serviceFeatureName,
      value: (feature) => feature.serviceFeatureValue,
    );

    final Map<String, Map<String, dynamic>> _priceData = {
      "package1": {
        "priceTitle": gigPriceTier1TitleValue,
        "priceDescription": gigPriceTier1DescriptionValue,
        "price": gigPriceTier1PriceValue,
        "features": _packageOneFeaturesMap,
      },
      "package2": {
        "priceTitle": gigPriceTier2TitleValue,
        "priceDescription": gigPriceTier2DescriptionValue,
        "price": gigPriceTier2PriceValue,
        "features": _packageTwoFeaturesMap,
      },
      "package3": {
        "priceTitle": gigPriceTier3TitleValue,
        "priceDescription": gigPriceTier3DescriptionValue,
        "price": gigPriceTier3PriceValue,
        "features": _packageThreeFeaturesMap,
      },
    };

    _gigService.addPriceData(_priceData);
    _gigService.addQuoteData(intToBool(_quoteOptionSelected!));
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

  // Navigation functions
  void goBack() {
    _navigationService.back();
  }

  void goToAddLocation() {
    if (_quoteOptionSelected != null) {
      setBusy(true);
      storeData();
      setBusy(false);

      final _loadedGig = _gigService.currentGig;

      // Need to add gig to firestore to get gigId for address
      _firestoreApi.addGig(gig: _loadedGig!);

      _navigationService.navigateWithTransition(
        AddGigLocationView(),
        transition: 'fade',
      );

      log.i('goToAddLocation check: ${_gigService.currentGig}');
    } else {
      _dialogService.showCustomDialog(
        variant: DialogType.basic,
        data: BasicDialogStatus.error,
        mainButtonTitle: 'Go Back',
        description:
            'Plase choose either you would want to allow users to request custom quotes',
        title: 'Error',
      );
    }
  }

  // Cancel add gig
  void cancelAddGig() {
    setBusy(true);
    final _loadedGig = _gigService.currentGig;

    if (_loadedGig != null) {
      if (_loadedGig.gigId != null || _loadedGig.gigId == '') {
        _firestoreApi.deleteGig(_loadedGig.gigId!);
        _gigService.clearGig();
      }
    }

    _navigationService.clearTillFirstAndShow(Routes.gigManagerView);
    setBusy(false);
    notifyListeners();
  }
}
