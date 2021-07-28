import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/enums/basic_dialog_status.dart';
import 'package:xyz_prototype/enums/dialog_type.dart';
import 'package:xyz_prototype/services/cloud_storage_service.dart';
import 'package:xyz_prototype/services/gig_service.dart';
import 'package:xyz_prototype/services/user_service.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_photos_view.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_title_view.form.dart';
import 'package:xyz_prototype/utils/image_selector.dart';

class AddGigViewModel extends FormViewModel {
  final log = getLogger('AddBusinessViewModel');
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _userService = locator<UserService>();
  final _firestoreApi = locator<FirestoreApi>();
  final _imageSelector = locator<ImageSelector>();
  final _cloudStorageService = locator<CloudStorageService>();
  final _gigService = locator<GigService>();

  List<XFile>? _selectedImages;
  List<XFile>? get selectedImage => _selectedImages;

  @override
  void setFormStatus() {}

  Future<void> addGig() async {
    setBusy(true);

    List<String> storageResult = [];

    final _currentUser = _userService.currentUser!;
    final _loadedGig = _gigService.currentGig!;

    log.v('loadedGig: $_loadedGig');

    if (_selectedImages != null) {
      storageResult = await _cloudStorageService.uploadGigPhotos(
        client: _currentUser,
        imagesToUpload: _selectedImages,
        title: _loadedGig.gigTitle ?? 'untitled',
      );
    }

    final gig = _loadedGig.copyWith(
      gigVendorId: _currentUser.clientVendorId,
      gigPhotos: storageResult,
    );
    log.v('log for storage result $storageResult');

    final addSuccess = await _firestoreApi.addGig(gig: gig);
    log.v('log for gig to upload: $gig');
    log.v('log for addSuccess: $addSuccess');

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

    _navigationService.popRepeated(2);

    setBusy(false);
  }

  void goBack() {
    _navigationService.back();
  }

  Future selectImage() async {
    var tempImage = await _imageSelector.selectImage(multi: true);
    log.v('image retrieved: $tempImage');

    if (tempImage != null) {
      _selectedImages = tempImage;
      log.v('image picked: $_selectedImages');
      notifyListeners();
    } else {
      log.v('image not picked');
      return;
    }
  }

  void goToAddPhoto() {
    _gigService.initGig(
      gigTitle: gigTitleValue,
      gigSubtitle: gigSubtitleValue,
      gigDescription: gigDescriptionValue,
    );

    _navigationService.navigateWithTransition(
      AddGigPhotosView(),
      transition: 'fade',
    );
  }
}
