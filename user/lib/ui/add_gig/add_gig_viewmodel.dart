import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/enums/basic_dialog_status.dart';
import 'package:xyz_prototype/enums/dialog_type.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/user_service.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_view.form.dart';

class AddGigViewModel extends FormViewModel {
  final log = getLogger('AddBusinessViewModel');
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _userService = locator<UserService>();
  final _firestoreApi = locator<FirestoreApi>();

  @override
  void setFormStatus() {}

  Future<void> addGig() async {
    final _currentUser = _userService.currentUser!;

    final gig = Gig(
      gigTitle: gigTitleValue,
      gigVendorId: _currentUser.clientVendorId,
    );

    setBusy(true);

    log.v('gigTitle from view: $gigTitleValue');

    final addSuccess = await _firestoreApi.addGig(gig: gig);

    if (!addSuccess) {
      await _dialogService.showCustomDialog(
        variant: DialogType.basic,
        data: BasicDialogStatus.error,
        mainButtonTitle: 'Go Back',
        title: 'Could not add gig',
      );
    } else {
      await _dialogService.showCustomDialog(
        variant: DialogType.basic,
        data: BasicDialogStatus.sucess,
        title: 'Gig successfully added',
        description: 'You gig has been added',
        mainButtonTitle: 'Ok',
        secondaryButtonTitle: 'Go Back',
      );
    }

    _navigationService.back();

    setBusy(false);
  }

  void goBack() {
    _navigationService.back();
  }
}
