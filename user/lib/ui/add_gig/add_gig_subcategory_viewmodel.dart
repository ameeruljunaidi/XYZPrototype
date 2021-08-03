import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/gig_service.dart';
import 'package:xyz_prototype/services/realtime_database_service.dart';
import 'package:xyz_prototype/ui/base/add_gig_viewmodel.dart';

class AddGigSubCategoryViewModel extends AddGigViewModel {
  final _realtimeService = locator<RealtimeService>();
  final _gigService = locator<GigService>();

  // Create getter for list of subcateogries
  List<ServiceSubCategory>? _subCategoriesList;
  List<ServiceSubCategory>? get subCategoriesList => _subCategoriesList;

  // Get list of available subcategories
  void getSubCategories() async {
    _subCategoriesList = await _realtimeService.getSubCategories();
    notifyListeners();
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
}
