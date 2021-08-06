import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/services/gig_service.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_photos_view.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_price_chooser_view.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_price_view.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_service_view.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_title_view.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_title_view.form.dart';

class AddGigViewModel extends FormViewModel {
  final log = getLogger('AddBusinessViewModel');
  final _navigationService = locator<NavigationService>();
  final _firestoreApi = locator<FirestoreApi>();
  final _gigService = locator<GigService>();

  @override
  void setFormStatus() {}

  // Navigation functions
  void goBack() {
    _navigationService.back();
  }

  void goToAddService() {
    _navigationService.navigateWithTransition(
      AddGigServiceView(),
      transition: 'fade',
    );

    log.i('goToAddService check: ${_gigService.currentGig}');
  }

  void goToAddTitle() {
    _navigationService.navigateWithTransition(
      AddGigTitleView(),
      transition: 'fade',
    );

    log.i('goToAddTitle check: ${_gigService.currentGig}');
  }

  void goToAddPhoto() {
    _navigationService.navigateWithTransition(
      AddGigPhotosView(),
      transition: 'fade',
    );
  }

  void goToPriceChoose() {
    _navigationService.navigateWithTransition(
      AddGigPriceChooserView(),
      transition: 'fade',
    );
  }

  void goToAddPrice() {
    _gigService.addGigTitle(
      gigTitleValue,
      gigDescriptionValue,
    );

    _navigationService.navigateWithTransition(
      AddGigPriceView(),
      transition: 'fade',
    );
  }

  // Cancel add gig
  void cancelAddGig() {
    setBusy(true);
    final _loadedGig = _gigService.currentGig;

    if (_loadedGig != null) {
      if (_loadedGig.gigId != null || _loadedGig.gigId == '') {
        _firestoreApi.deleteGig(_loadedGig.gigId!);
        _gigService.clearGig();
      }
    }

    _navigationService.clearTillFirstAndShow(Routes.gigManagerView);
    setBusy(false);
    notifyListeners();
  }
}
