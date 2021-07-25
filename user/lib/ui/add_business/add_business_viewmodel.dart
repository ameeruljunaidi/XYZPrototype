import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/constants/app_keys.dart';
import 'package:xyz_prototype/constants/app_strings.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/user_service.dart';
import 'package:xyz_prototype/ui/add_business/add_business_view.form.dart';

class AddBusinessViewModel extends FormViewModel {
  final log = getLogger('AddBusinessViewModel');
  final _dialogService = locator<DialogService>();
  final _firestoreApi = locator<FirestoreApi>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  @override
  void setFormStatus() {}

  Future<void> submitBusinessRegistration() async {
    final business = Business(
      businessRegistrationDate: defaultRegistrationDate,
      businessName: businessNameValue,
      businessDescription: businessDescriptionValue,
      businessWebsite: businessWebsiteValue,
    );

    setBusy(true);

    log.v('Business info: $business');

    final user = _userService.currentUser!;

    final saveSucess = await _firestoreApi.saveBusiness(
      business: business,
      client: user,
    );

    if (!saveSucess) {
      log.v('Business saved failed. Notify users to try again.');
      _dialogService.showDialog(
        title: BusinessSaveFailedDialogTitle,
        description: BusinesSaveFailedDialogDescription,
      );
    } else {
      log.v('Business saved! You can now add gigs!');
    }

    notifyListeners();
    _navigationService.clearStackAndShow(Routes.homeView);

    setBusy(false);
  }

  void cancelAddBusiness() {
    _navigationService.back();
  }
}
