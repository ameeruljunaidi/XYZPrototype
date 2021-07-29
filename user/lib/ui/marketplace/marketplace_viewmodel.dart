import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/user_service.dart';
import 'package:xyz_prototype/ui/address_selection/address_selection_view.dart';
import 'package:xyz_prototype/ui/home/home_viewmodel.dart';

class MarketPlaceViewModel extends HomeViewModel {
  final log = getLogger('MarketPlaceViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  bool _addLocationCheck = false;
  bool get addLocationCheck => _addLocationCheck;

  void updateIndex(index) {
    _selectedIndex = index;
    notifyListeners();
    log.v('selectedIndex: $_selectedIndex');
  }

  void goToAddressSelection() async {
    await _navigationService.navigateWithTransition(
      AddressSelectionView(),
      transition: 'fade',
    );
    notifyListeners();
  }

  Client clientData() {
    return _userService.currentUser ??
        Client(
          clientId: 'anonymous',
          clientType: 'anonymous',
          clientRegistrationDate: 'anonymous',
        );
  }

  void listenToUser() {
    setBusy(true);
    _userService.listenToUser();
    setBusy(false);
  }
}
