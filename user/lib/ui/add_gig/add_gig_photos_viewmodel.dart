import 'package:image_picker/image_picker.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/enums/basic_dialog_status.dart';
import 'package:xyz_prototype/enums/dialog_type.dart';
import 'package:xyz_prototype/services/cloud_storage_service.dart';
import 'package:xyz_prototype/services/gig_service.dart';
import 'package:xyz_prototype/services/user_service.dart';
import 'package:xyz_prototype/ui/base/add_gig_viewmodel.dart';
import 'package:xyz_prototype/utils/image_selector.dart';

class AddGigPhotosViewModel extends AddGigViewModel {
  final _imageSelector = locator<ImageSelector>();
  final _userService = locator<UserService>();
  final _gigService = locator<GigService>();
  final _cloudStorageService = locator<CloudStorageService>();
  final _firestoreApi = locator<FirestoreApi>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  // Create getter for selected image/images
  List<XFile>? _selectedImages;
  List<XFile>? get selectedImages => _selectedImages;

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

  Future<void> addImages() async {
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
    setBusy(false);
  }

  // Function to add gig
  Future<void> addGig() async {
    setBusy(true);

    await addImages();

    var _loadedGig = _gigService.currentGig!;

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
}
