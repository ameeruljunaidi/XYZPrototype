import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/enums/basic_dialog_status.dart';
import 'package:xyz_prototype/enums/dialog_type.dart';
import 'package:xyz_prototype/services/cloud_storage_service.dart';
import 'package:xyz_prototype/services/gig_service.dart';
import 'package:xyz_prototype/services/user_service.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_location_view.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_photos_view.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_price_view.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_service_view.dart';
import 'package:xyz_prototype/ui/add_gig/add_gig_title_view.dart';
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

  @override
  void setFormStatus() {}

  // Create getter for selected image/images
  List<XFile>? _selectedImages;
  List<XFile>? get selectedImages => _selectedImages;

  // Function to add gig
  Future<void> addGig() async {
    setBusy(true);

    List<String> storageResult = [];

    final _currentUser = _userService.currentUser!;
    var _loadedGig = _gigService.currentGig!;

    if (_selectedImages != null) {
      storageResult = await _cloudStorageService.uploadGigPhotos(
        client: _currentUser,
        imagesToUpload: _selectedImages,
        title: _loadedGig.gigTitle ?? 'untitled',
      );
    }

    _gigService.addGigPhotos(storageResult);
    _gigService.addGigVendorId(_currentUser.clientVendorId);

    notifyListeners();

    _loadedGig = _gigService.currentGig!;
    final addSuccess = await _firestoreApi.addGig(gig: _loadedGig);

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
      );
    }

    _navigationService.clearTillFirstAndShow(Routes.gigManagerView);
    log.i('final check: ${_gigService.currentGig}');

    setBusy(false);
  }

  // Image selector function
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

  void goToAddLocation() {
    _gigService.addGigTitle(
      gigTitleValue,
      gigSubtitleValue,
      gigDescriptionValue,
    );

    final _loadedGig = _gigService.currentGig;

    // Need to add gig to firestore to get gigId for address
    _firestoreApi.addGig(gig: _loadedGig!);

    _navigationService.navigateWithTransition(AddGigLocationView(),
        transition: 'fade');

    log.i('goToAddLocation check: ${_gigService.currentGig}');
  }

  void goToAddPhoto() {
    _navigationService.navigateWithTransition(
      AddGigPhotosView(),
      transition: 'fade',
    );
  }

  void goToAddPrice() {
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
