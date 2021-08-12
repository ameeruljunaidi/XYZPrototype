import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';

class BookingSummaryViewModel extends BaseViewModel {
  final log = getLogger('BookingSummaryViewModel');
  final _navigationService = locator<NavigationService>();

  void goBack() {
    _navigationService.back();
  }

  void goToConfirmPage() {
    _navigationService.navigateTo(Routes.orderConfirmView);
  }
}
