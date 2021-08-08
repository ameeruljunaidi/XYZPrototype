import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';

class GigListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Navigation functions
  void goBack() {
    _navigationService.back();
  }
}
