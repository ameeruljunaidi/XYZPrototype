import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/models/application_models.dart';

class GigManagerViewModel extends BaseViewModel {
  final log = getLogger('GigManagerViewModel');
  final _navigationService = locator<NavigationService>();
  final _firestoreApi = locator<FirestoreApi>();
  final _dialogService = locator<DialogService>();

  List<Gig?>? _gigs;
  List<Gig?>? get gigs => _gigs;

  Future<void> goToAddGigView() async {
    await _navigationService.navigateTo(Routes.addGigView);
    await fetchGigs();
  }

  void goBack() {
    _navigationService.back();
  }

  Future<void> fetchGigs() async {
    setBusy(true);

    var gigResults = await _firestoreApi.getGigs();
    setBusy(false);

    if (gigResults is List<Gig?>) {
      _gigs = gigResults;
      notifyListeners();
    } else {
      await _dialogService.showDialog(title: 'Fetching gigs failed');
    }

    log.v('gig in viewmodel: $gigResults');
  }
}
