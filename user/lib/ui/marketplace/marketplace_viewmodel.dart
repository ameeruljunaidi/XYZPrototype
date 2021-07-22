import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.router.dart';

class MarketPlaceViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  void goToSearch() {
    _navigationService.navigateTo(Routes.searchView);
  }
}
