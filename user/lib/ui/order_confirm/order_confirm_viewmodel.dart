import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';

class OrderConfirmViewModel extends BaseViewModel {
  final log = getLogger('OrderConfirmViewModel');
  final _navigationService = locator<NavigationService>();

  void goBack() {
    _navigationService.back();
  }

  void goToHome() {
    _navigationService.clearStackAndShow(Routes.homeView);
  }
}
