import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/realtime_database_service.dart';

class ServiceService {
  final log = getLogger('serviceService');
  final _realtimeService = locator<RealtimeService>();

  List<String>? _serviceList;
  List<String>? get serviceList => _serviceList;

  Future<List<String>> getServiceListFromSubCategory(
    String subCategoryName,
  ) async {
    final List<Service> _allServiceList = await _realtimeService.getServices();

    final List<String> _serviceList = <String>[];

    for (Service _service in _allServiceList) {
      if (_service.serviceSubcategory == subCategoryName) {
        _serviceList.add(_service.serviceName!);
      }
    }

    return _serviceList;
  }

  Future<Map<String, String>> getFeaturesFromSubCategory(
      String loadedGigSubCategory) async {
    final List<ServiceSubCategory> _allSubCategoryList =
        await _realtimeService.getSubCategories();

    for (ServiceSubCategory _subCategory in _allSubCategoryList) {
      if (_subCategory.serviceSubCategoryName == loadedGigSubCategory) {
        final List<String> _featuresList =
            _subCategory.serviceSuggestedFeatures!;
        final List<String> _featuresListTypes =
            _subCategory.serviceSuggestedFeaturesTypes!;

        return Map.fromIterables(_featuresList, _featuresListTypes);
      }
    }
    throw UnimplementedError();
  }
}
