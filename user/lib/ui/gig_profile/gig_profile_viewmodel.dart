import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/gig_service.dart';

class GigProfileViewModel extends BaseViewModel {
  final log = getLogger('GigProfileViewModel');
  final _navigationService = locator<NavigationService>();
  final _gigService = locator<GigService>();
  final _firestoreApi = locator<FirestoreApi>();

  void startupLogic() async {
    setBusy(true);
    await getGig();
    await getClient();
    await getVendor();
    await getLocation();
    await getPrices();
    setBusy(false);
  }

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

    _pricePackPageController.jumpToPage(packageIndex);

    notifyListeners();
    setBusy(false);
  }

  updateSelectedPricePage(int page) {
    _selectedPricePackPage = page;

    notifyListeners();
  }

  /// Gig management functions
  /// 1. Need to get the gig itself - get the vendorId from the gig
  /// 2. Need to get the client
  ///   - Get the client with the vendorId == vendorId from gig
  /// 3. Need to get the vendor attached to client
  /// 4. Need to get address from client
  Gig? _currentGig;
  Gig? get currentGig => _currentGig;

  Future<void> getGig() async {
    _currentGig = _gigService.currentGig;

    if (_currentGig != null) {
      log.v('Gig loaded: ${_currentGig!.gigId}');
    }

    notifyListeners();
  }

  List<String>? _pricePackages;
  List<String>? get pricePackages => _pricePackages;

  List<String>? _pricePackName;
  List<String>? get pricePackName => _pricePackName;

  List<String>? _pricePackDescription;
  List<String>? get pricePackDescription => _pricePackDescription;

  List<Map<String, dynamic>>? _priceFeatures;
  List<Map<String, dynamic>>? get priceFeatures => _priceFeatures;

  Future<void> getPrices() async {
    if (_currentGig != null) {
      final Map<String, dynamic>? _gigPrice = _currentGig!.gigPrice;

      if (_gigPrice != null) {
        final Map<String, dynamic>? _package1 = _gigPrice['package1'];
        final Map<String, dynamic>? _package2 = _gigPrice['package2'];
        final Map<String, dynamic>? _package3 = _gigPrice['package3'];

        final bool _package1Exist = _package1 != null;
        final bool _package2Exist = _package2 != null;
        final bool _package3Exist = _package3 != null;

        if (_package1Exist & !_package2Exist & !_package3Exist) {
          String? _package1Price = _package1!['price'].toString();
          String? _package1Title = _package1['priceTitle'];
          String? _package1Description = _package1['priceDescription'];
          Map<String, dynamic> _package1Features = _package1['features'];

          _pricePackages = [
            '\$$_package1Price',
            'N/A',
            'N/A',
            'Request Quote',
          ];

          _pricePackName = [
            '$_package1Title',
            'N/A',
            'N/A',
            'Quote',
          ];

          _pricePackDescription = [
            '$_package1Description',
            'N/A',
            'N/A',
            'Quote',
          ];

          _priceFeatures = [
            _package1Features,
            Map(),
            Map(),
            Map(),
          ];

          log.i('Loaded price pack details');
          log.v('Prices: $_pricePackages');
          log.v('Titles: $_pricePackName');
          log.v('Description: $_pricePackDescription');
          log.v('Features: $_priceFeatures');
        } else if (_package1Exist & _package2Exist & !_package3Exist) {
          String? _package1Price = _package1!['price'].toString();
          String? _package2Price = _package2!['price'].toString();

          String? _package1Title = _package1['priceTitle'];
          String? _package2Title = _package2['priceTitle'];

          String? _package1Description = _package1['priceDescription'];
          String? _package2Description = _package2['priceDescription'];

          Map<String, dynamic> _package1Features = _package1['features'];
          Map<String, dynamic> _package2Features = _package2['features'];

          _pricePackages = [
            '\$$_package1Price',
            '\$$_package2Price',
            'N/A',
            'Request Quote',
          ];

          _pricePackName = [
            '$_package1Title',
            '$_package2Title',
            'N/A',
            'Quote',
          ];

          _pricePackDescription = [
            '$_package1Description',
            '$_package2Description',
            'N/A',
            'Quote',
          ];

          _priceFeatures = [
            _package1Features,
            _package2Features,
            Map(),
            Map(),
          ];

          log.i('Loaded price pack details');
          log.v('Prices: $_pricePackages');
          log.v('Titles: $_pricePackName');
          log.v('Description: $_pricePackDescription');
          log.v('Features: $_priceFeatures');
        } else if (_package1Exist & _package2Exist & _package3Exist) {
          String? _package1Price = _package1!['price'].toString();
          String? _package2Price = _package2!['price'].toString();
          String? _package3Price = _package3!['price'].toString();

          String? _package1Title = _package1['priceTitle'];
          String? _package2Title = _package2['priceTitle'];
          String? _package3Title = _package3['priceTitle'];

          String? _package1Description = _package1['priceDescription'];
          String? _package2Description = _package2['priceDescription'];
          String? _package3Description = _package3['priceDescription'];

          Map<String, dynamic> _package1Features = _package1['features'];
          Map<String, dynamic> _package2Features = _package2['features'];
          Map<String, dynamic> _package3Features = _package3['features'];

          _pricePackages = [
            '\$$_package1Price',
            '\$$_package2Price',
            '\$$_package3Price',
            'Request Quote',
          ];

          _pricePackName = [
            '$_package1Title',
            '$_package2Title',
            '$_package3Title',
            'Quote',
          ];

          _pricePackDescription = [
            '$_package1Description',
            '$_package2Description',
            '$_package3Description',
            'Quote',
          ];

          _priceFeatures = [
            _package1Features,
            _package2Features,
            _package3Features,
            Map(),
          ];

          log.i('Loaded price pack details');
          log.v('Prices: $_pricePackages');
          log.v('Titles: $_pricePackName');
          log.v('Description: $_pricePackDescription');
          log.v('Features: $_priceFeatures');
        } else {
          log.e('None of the price packs exist');
        }
      } else {
        log.e('No prices exist for this gig');
      }
    } else {
      log.e('Current gig is null');
    }

    notifyListeners();
  }

  Client? _gigClient;
  Client? get gigClient => _gigClient;

  Future<void> getClient() async {
    if (_currentGig != null) {
      _gigClient = await _firestoreApi.getClientFromGigId(_currentGig!);

      if (_gigClient != null) {
        log.v('Client loaded: ${_gigClient!.clientId}');
      }
    } else {
      log.e('currentGig is null $_currentGig');
    }

    notifyListeners();
  }

  Vendor? _gigVendor;
  Vendor? get gigVendor => _gigVendor;

  Future<void> getVendor() async {
    if (_currentGig != null && _gigClient != null) {
      _gigVendor = await _firestoreApi.getVendor(client: _gigClient!);

      if (_gigVendor != null) {
        log.v('Vendor loaded ${_gigVendor!.vendorId}');
      }
    } else {
      log.e('Either currentGig: $_currentGig or gigClient $_gigClient is null');
    }

    notifyListeners();
  }

  Address? _gigLocation;
  Address? get gigLocation => _gigLocation;

  Future<void> getLocation() async {
    if (_currentGig != null) {
      _gigLocation = await _firestoreApi.getGigAddress(_currentGig!);

      if (_gigLocation != null) {
        log.v('Gig address loaded: ${_gigLocation!.id}');
      }
    } else {
      log.e('Current gig is null: $_currentGig');
    }

    notifyListeners();
  }

  // Navigation service
  void goToVendorProfile() {
    _navigationService.navigateTo(Routes.vendorProfileView);
  }

  void goToCalendarView() {
    _navigationService.navigateTo(Routes.dateSelectionView);
  }

  void goBack() {
    _navigationService.back();
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
}
