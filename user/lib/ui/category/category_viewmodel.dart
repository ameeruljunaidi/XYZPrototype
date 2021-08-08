import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/gig_service.dart';
import 'package:xyz_prototype/services/realtime_database_service.dart';

class CategoryViewModel extends BaseViewModel {
  final log = getLogger('CategoryViewModel');
  final _navigationService = locator<NavigationService>();
  final _realtimeService = locator<RealtimeService>();
  final _gigService = locator<GigService>();

  // Create getter for list of subcateogries
  List<ServiceSubCategory>? _categoriesList;
  List<ServiceSubCategory>? get categoriesList => _categoriesList;

  // Get list of available subcategories
  void getSubCategories() async {
    _categoriesList = await _realtimeService.getSubCategories();
    notifyListeners();
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
    } else {
      log.e('Categories list is empty');
    }
  }

  // Navigation functions
  void goBack() {
    _navigationService.back();
  }
}
