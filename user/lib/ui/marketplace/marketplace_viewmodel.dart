import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/gig_service.dart';
import 'package:xyz_prototype/services/realtime_database_service.dart';
import 'package:xyz_prototype/services/user_service.dart';
import 'package:xyz_prototype/ui/address_selection/address_selection_view.dart';
import 'package:xyz_prototype/ui/home/home_viewmodel.dart';

class MarketPlaceViewModel extends HomeViewModel {
  final log = getLogger('MarketPlaceViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _realtimeService = locator<RealtimeService>();
  final _gigService = locator<GigService>();

  List<ServiceSubCategory>? _categoriesList;
  List<ServiceSubCategory>? get categoriesList => _categoriesList;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  bool _addLocationCheck = false;
  bool get addLocationCheck => _addLocationCheck;

  void updateIndex(index) {
    _selectedIndex = index;
    notifyListeners();
    log.v('selectedIndex: $_selectedIndex');
  }

  Client clientData() {
    return _userService.currentUser ??
        Client(
          clientId: 'anonymous',
          clientType: 'anonymous',
          clientRegistrationDate: 'anonymous',
        );
  }

  void listenToUser() async {
    setBusy(true);
    _userService.listenToUser();
    _categoriesList = await _realtimeService.getSubCategories();
    setBusy(false);
  }

  // Load the tapped subcategory to temp gig
  void selectCategory(index) {
    // Clear gig first
    _gigService.clearGig();

    // If categories list is not null, which it shouldn't, load it into temp
    if (_categoriesList != null) {
      _gigService.addGigCategory(
        _categoriesList![index].serviceSubCategoryName,
      );

      _navigationService.navigateTo(Routes.servicesView);
      notifyListeners();
    } else {
      log.e('Categories list is empty');
    }
  }

  // Navigation functions
  void goToAddressSelection() async {
    await _navigationService.navigateWithTransition(
      AddressSelectionView(),
      transition: 'fade',
    );
    _userService.syncUserAccount();
    notifyListeners();
  }
}
