import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/services/gig_service.dart';
import 'package:xyz_prototype/services/service_services.dart';

class ServicesViewModel extends BaseViewModel {
  final log = getLogger('ServicesViewModel');
  final _navigationService = locator<NavigationService>();
  final _serviceService = locator<ServiceService>();
  final _gigService = locator<GigService>();

  List<String>? _servicesList;
  List<String>? get servicesList => _servicesList;

  // Get list of available services based on chose subcategory
  void getServicesFromSubCategory() async {
    // Get the current temp gig
    final _loadedGig = _gigService.currentGig;

    // Get the list of services based on the category chose
    final _serviceList = await _serviceService.getServiceListFromSubCategory(
      _loadedGig!.gigCategory!,
    );

    _servicesList = _serviceList;
    notifyListeners();
  }

  String? _categoryName;
  String? get categoryName => _categoryName;

  void getCategoryName() {
    // Load the current gig first
    final _loadedGig = _gigService.currentGig;

    // If loaded gig is not null, which it shouldn't be, get the category name
    if (_loadedGig != null) {
      _categoryName = _loadedGig.gigCategory;
    } else {
      log.e('Loaded gig is empty for some reason');
    }
  }

  // NavigationServices
  void goBack() {
    _navigationService.back();
  }

  void goToGigView() {
    _navigationService.navigateTo(Routes.gigListView);
  }
}
