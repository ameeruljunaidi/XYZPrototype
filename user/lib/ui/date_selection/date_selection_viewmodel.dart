import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/services/orders_services.dart';

class DateSelectionViewModel extends BaseViewModel {
  final log = getLogger('DateSelectionViewModel');
  final _orderService = locator<OrderService>();
  final _navigationService = locator<NavigationService>();

  void testOrder() {
    _orderService.createGigOrder();

    _navigationService.navigateTo(Routes.homeView);
  }
}
