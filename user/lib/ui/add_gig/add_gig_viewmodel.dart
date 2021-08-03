import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/enums/basic_dialog_status.dart';
import 'package:xyz_prototype/enums/dialog_type.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/cloud_storage_service.dart';
import 'package:xyz_prototype/services/gig_service.dart';
import 'package:xyz_prototype/services/realtime_database_service.dart';
import 'package:xyz_prototype/services/service_services.dart';
import 'package:xyz_prototype/services/user_service.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_location_view.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_photos_view.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_price.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_service_view.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_title_view.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_title_view.form.dart';
import 'package:xyz_prototype/utils/image_selector.dart';

class AddGigViewModel extends FormViewModel {
  final log = getLogger('AddBusinessViewModel');
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _userService = locator<UserService>();
  final _firestoreApi = locator<FirestoreApi>();
  final _imageSelector = locator<ImageSelector>();
  final _cloudStorageService = locator<CloudStorageService>();
  final _gigService = locator<GigService>();
  final _realtimeService = locator<RealtimeService>();
  final _serviceService = locator<ServiceService>();

  // Create getter for selected image/images
  List<XFile>? _selectedImages;
  List<XFile>? get selectedImages => _selectedImages;

  @override
  void setFormStatus() {}

  // Function to add gig
  Future<void> addGig() async {
    setBusy(true);

    List<String> storageResult = [];

    final _currentUser = _userService.currentUser!;
    var _loadedGig = _gigService.currentGig!;

    if (_selectedImages != null) {
      storageResult = await _cloudStorageService.uploadGigPhotos(
        client: _currentUser,
        imagesToUpload: _selectedImages,
        title: _loadedGig.gigTitle ?? 'untitled',
      );
    }

    _gigService.addGigPhotos(storageResult);
    _gigService.addGigVendorId(_currentUser.clientVendorId);

    notifyListeners();

    _loadedGig = _gigService.currentGig!;
    final addSuccess = await _firestoreApi.addGig(gig: _loadedGig);

    if (!addSuccess) {
      await _dialogService.showCustomDialog(
        variant: DialogType.basic,
        data: BasicDialogStatus.error,
        mainButtonTitle: 'Go Back',
        title: 'Could not add gig',
      );
    } else {
      await _dialogService.showCustomDialog(
        variant: DialogType.basic,
        data: BasicDialogStatus.sucess,
        title: 'Gig successfully added',
        description: 'You gig has been added',
        mainButtonTitle: 'Ok',
      );
    }

    _navigationService.clearTillFirstAndShow(Routes.gigManagerView);
    log.i('final check: ${_gigService.currentGig}');

    setBusy(false);
  }

  // Image selector function
  Future selectImage() async {
    var tempImage = await _imageSelector.selectImage(multi: true);
    log.v('image retrieved: $tempImage');

    if (tempImage != null) {
      _selectedImages = tempImage;
      log.v('image picked: $_selectedImages');
      notifyListeners();
    } else {
      log.v('image not picked');
      return;
    }
  }

  // Create getter for list of subcateogries
  List<ServiceSubCategory>? _subCategoriesList;
  List<ServiceSubCategory>? get subCategoriesList => _subCategoriesList;

  // Get list of available subcategories
  void getSubCategories() async {
    _subCategoriesList = await _realtimeService.getSubCategories();
    notifyListeners();
  }

  List<String>? _servicesList;
  List<String>? get servicesList => _servicesList;

  // Get list of available services based on chose subcategory
  void getServicesFromSubCategory() async {
    final _loadedGig = _gigService.currentGig;

    final _serviceList = await _serviceService.getServiceListFromSubCategory(
      _loadedGig!.gigSubCategory!,
    );

    _servicesList = _serviceList;
    notifyListeners();
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

  int? _selectedSubcategory;
  int? get selectedSubCategory => _selectedSubcategory;

  // State manaagement for selected cateogory
  void changeSelectedCategory(index) {
    _selectedSubcategory = index;

    final _selectedSubcategoryName =
        _subCategoriesList![index].serviceSubCategoryName;

    _gigService.clearGig();
    _gigService.initGig(_selectedSubcategoryName);

    notifyListeners();
  }

  int? _selectedServiceIndex;
  int? get selectedService => _selectedServiceIndex;

  // State management for selected service
  void changeSelectedService(index) {
    _selectedServiceIndex = index;

    _gigService.addGigService(_servicesList![index]);

    notifyListeners();
  }

  // Navigation functions
  void goBack() {
    _navigationService.back();
  }

  void goToAddService() {
    _navigationService.navigateWithTransition(
      AddGigServiceView(),
      transition: 'fade',
    );

    log.i('goToAddService check: ${_gigService.currentGig}');
  }

  void goToAddTitle() {
    _navigationService.navigateWithTransition(
      AddGigTitleView(),
      transition: 'fade',
    );

    log.i('goToAddTitle check: ${_gigService.currentGig}');
  }

  void goToAddLocation() {
    _gigService.addGigTitle(
      gigTitleValue,
      gigSubtitleValue,
      gigDescriptionValue,
    );

    final _loadedGig = _gigService.currentGig;

    // Need to add gig to firestore to get gigId for address
    _firestoreApi.addGig(gig: _loadedGig!);

    _navigationService.navigateWithTransition(AddGigLocationView(),
        transition: 'fade');

    log.i('goToAddLocation check: ${_gigService.currentGig}');
  }

  void goToAddPhoto() {
    _navigationService.navigateWithTransition(
      AddGigPhotosView(),
      transition: 'fade',
    );
  }

  void goToAddPrice() {
    _navigationService.navigateWithTransition(
      AddGigPriceView(),
      transition: 'fade',
    );
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

    setBusy(false);
    _navigationService.clearTillFirstAndShow(Routes.gigManagerView);
    notifyListeners();
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
