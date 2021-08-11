import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/services/orders_services.dart';

class DateSelectionViewModel extends BaseViewModel {
  final log = getLogger('DateSelectionViewModel');
  final _orderService = locator<OrderService>();

  void testOrder() {
    _orderService.createGigOrder();
  }
}
