import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/ui/home/home_viewmodel.dart';

class MarketPlaceViewModel extends HomeViewModel {
  final log = getLogger('MarketPlaceViewModel');

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void updateIndex(index) {
    _selectedIndex = index;
    notifyListeners();
    log.v('selectedIndex: $_selectedIndex');
  }
}
