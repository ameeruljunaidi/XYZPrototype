import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/services/gig_service.dart';
import 'package:xyz_prototype/services/service_services.dart';
import 'package:xyz_prototype/ui/base/add_gig_viewmodel.dart';

class AddGigServiceViewModel extends AddGigViewModel {
  final _serviceService = locator<ServiceService>();
  final _gigService = locator<GigService>();

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

  int? _selectedServiceIndex;
  int? get selectedService => _selectedServiceIndex;

  // State management for selected service
  void changeSelectedService(index) {
    _selectedServiceIndex = index;

    _gigService.addGigService(_servicesList![index]);

    notifyListeners();
  }
}
