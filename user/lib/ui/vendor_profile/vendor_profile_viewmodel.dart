import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';

class VendorProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Navigation function
  void goBack() {
    _navigationService.back();
  }
}
