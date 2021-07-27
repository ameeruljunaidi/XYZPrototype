import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/enums/basic_dialog_status.dart';
import 'package:xyz_prototype/enums/dialog_type.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/user_service.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_title_view.dart';

class GigManagerViewModel extends BaseViewModel {
  final log = getLogger('MarketPlaceViewModel');
  final _navigationService = locator<NavigationService>();
  final _firestoreApi = locator<FirestoreApi>();
  final _dialogService = locator<DialogService>();
  final _userService = locator<UserService>();

  List<Gig?>? _gigs;
  List<Gig?>? get gigs => _gigs;

  void goBack() {
    _navigationService.back();
  }

  Future<void> fetchGigs() async {
    setBusy(true);

    final _currentUser = _userService.currentUser!;

    var gigResults = await _firestoreApi.getGigs(_currentUser);
    setBusy(false);

    if (gigResults is List<Gig?>) {
      _gigs = gigResults;
      notifyListeners();
    } else {
      await _dialogService.showDialog(title: 'Fetching gigs failed');
    }

    log.v('gig in viewmodel: $gigResults');
  }

  void listenToGigs() {
    setBusy(true);

    final _currentUser = _userService.currentUser!;

    _firestoreApi.getGigsRealtime(_currentUser).listen(
      (gigsData) {
        List<Gig?> updatedGigs = gigsData;
        if (updatedGigs.length > 0) {
          _gigs = updatedGigs;
          notifyListeners();
        }
        setBusy(false);
      },
    );
  }

  void removeGig(int index) async {
    var dialogResponse = await _dialogService.showCustomDialog(
      variant: DialogType.basic,
      data: BasicDialogStatus.warning,
      mainButtonTitle: 'Confirm',
      secondaryButtonTitle: 'Cancel',
      description: 'Are you sure you want to delete this gig?',
      title: 'Delete Gig,',
    );

    if (dialogResponse!.confirmed) {
      setBusy(true);

      await _firestoreApi.deleteGig(_gigs![index]!.gigId!);

      setBusy(false);
    }
  }

  void goToAddGig() {
    _navigationService.navigateTo(Routes.addGigTitleView);
  }
}
