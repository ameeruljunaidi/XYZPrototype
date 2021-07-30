import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/enums/basic_dialog_status.dart';
import 'package:xyz_prototype/enums/dialog_type.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/cloud_storage_service.dart';
import 'package:xyz_prototype/services/user_service.dart';
import 'package:xyz_prototype/ui/add_business/add_business_view.dart';
import 'package:xyz_prototype/ui/login/login_view.dart';
import 'package:xyz_prototype/ui/profile/profile_add_avatar_view.dart';
import 'package:xyz_prototype/utils/image_selector.dart';

class ProfileViewModel extends BaseViewModel {
  final log = getLogger('profileViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _dialogService = locator<DialogService>();
  final _loginService = locator<LoginView>();
  final _addBusinessService = locator<AddBusinessView>();
  final _imageSelector = locator<ImageSelector>();
  final _cloudStorageService = locator<CloudStorageService>();
  final _firestoreApi = locator<FirestoreApi>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  XFile? _selectedImage;
  XFile? get selectedImage => _selectedImage;

  Client clientData() {
    return _userService.currentUser ??
        Client(
          clientId: 'anonymous',
          clientType: 'anonymous',
          clientRegistrationDate: 'anonymous',
        );
  }

  void goToAddBusiness(context) async {
    await _addBusinessService.addBusinessModal(context);
    await _userService.syncUserAccount();
    notifyListeners();
  }

  void goToLoginView(context) async {
    await _loginService.loginModal(context);
    notifyListeners();
  }

  void logOut() async {
    var logOut = await _dialogService.showCustomDialog(
      variant: DialogType.basic,
      data: BasicDialogStatus.warning,
      mainButtonTitle: 'Log Out',
      secondaryButtonTitle: 'Go Back',
      description: 'Are you sure you want to log out?',
      title: 'Log Out',
    );

    if (logOut!.confirmed) {
      _userService.logOut();
      _firebaseAuthenticationService.loginAnonymously();
      _navigationService.back();
      notifyListeners();
    }
  }

  void goToGigManagerView() async {
    final _currentUser = _userService.currentUser!;

    if (_currentUser.isBusiness) {
      _navigationService.navigateTo(Routes.gigManagerView);
    } else {
      var confirmToBeGig = await _dialogService.showConfirmationDialog(
          confirmationTitle: 'Continue',
          cancelTitle: 'Cancel',
          description:
              'To view and manage gigs, become on of our growing number of giggers!',
          title: 'Become a Gigger');

      if (confirmToBeGig!.confirmed) {
        _navigationService.navigateTo(Routes.addBusinessView);
      }
    }
  }

  void goToAddUserAvatar() async {
    setBusy(true);

    await _navigationService.navigateWithTransition(
      ProfileAddAvatarView(),
      transition: 'fade',
    );

    notifyListeners();
    setBusy(false);
  }

  void goBack() {
    _navigationService.back();
  }

  Future<void> addUserAvatar() async {
    setBusy(true);
    final _currentUser = _userService.currentUser!;
    log.v('Current user loaded: $_currentUser');

    String? storageResult;

    if (_selectedImage != null) {
      storageResult = await _cloudStorageService.uploadUserAvatar(
        imageToUpload: _selectedImage,
        client: _currentUser,
      );
    }

    final addSuccess = await _firestoreApi.addUserAvatar(
      client: _currentUser,
      avatarUrl: storageResult ?? 'noAvatarUrl',
    );

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
          title: 'Avatar successfully added',
          description: 'Your avatar has been added',
          mainButtonTitle: 'Ok');
    }

    setBusy(false);
    _navigationService.back();
  }

  Future chooseUserAvatar() async {
    var tempImage = await _imageSelector.selectImage();
    log.v('image retrieved: $tempImage');

    if (tempImage != null) {
      _selectedImage = tempImage;
      notifyListeners();
    } else {
      log.v('Image not picked');
      return;
    }
  }

  void listenToUser() {
    setBusy(true);
    _userService.listenToUser();
    setBusy(false);
  }

  void inProgressNotifier() async {
    var inProgressDialog = await _dialogService.showCustomDialog(
      variant: DialogType.basic,
      data: BasicDialogStatus.warning,
      mainButtonTitle: 'Ok',
      title: 'This Feature Is In Progress',
      description: 'We are working on something big, stay tuned!',
    );

    if (inProgressDialog!.confirmed) {
      return;
    }
  }
}
