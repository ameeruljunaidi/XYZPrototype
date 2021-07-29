import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/services/realtime_database_service.dart';

class InboxViewModel extends BaseViewModel {
  final log = getLogger('inboxViewmodel');
  final _realtimeService = locator<RealtimeService>();

  List<String>? _subCategoriesList;
  List<String>? get subCategoriesList => _subCategoriesList;

  void getData() async {
    setBusy(true);

    await _realtimeService.getServices();
    _subCategoriesList = _realtimeService.getSubCategories();

    notifyListeners();
    setBusy(false);
  }
}
