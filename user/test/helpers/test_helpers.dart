import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/user_service.dart';

import 'test_helpers.mocks.dart';

const String UserIdTestKey = 'default_user';

@GenerateMocks([], customMocks: [
  MockSpec<UserService>(returnNullOnMissingStub: true),
  MockSpec<NavigationService>(returnNullOnMissingStub: true),
  MockSpec<PlacesService>(returnNullOnMissingStub: true),
  MockSpec<DialogService>(returnNullOnMissingStub: true),
  MockSpec<FirestoreApi>(returnNullOnMissingStub: true),
  MockSpec<FirebaseAuthenticationService>(returnNullOnMissingStub: true),
])
MockUserService getAndRegisterUserService({
  bool hasLoggedInUser = false,
  User? currentUser,
}) {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();
  when(service.hasLoggedInUser).thenReturn(hasLoggedInUser);
  when(service.currentUser).thenReturn(currentUser ?? User(id: UserIdTestKey));
  locator.registerSingleton<UserService>(service);
  return service;
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockPlacesService getAndRegisterPlacesService({PlacesDetails? placesDetails}) {
  _removeRegistrationIfExists<PlacesService>();
  final service = MockPlacesService();

  when(service.getPlaceDetails(any)).thenAnswer(
    (realInvocation) => Future<PlacesDetails>.value(
      placesDetails ?? PlacesDetails(placeId: 'TestId'),
    ),
  );

  locator.registerSingleton<PlacesService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();

  when(service.showDialog(
          barrierDismissible: anyNamed('barrierDismissible'),
          buttonTitle: anyNamed('buttonTitle'),
          buttonTitleColor: anyNamed('buttonTitleColor'),
          cancelTitle: anyNamed('cancelTitle'),
          cancelTitleColor: anyNamed('cancelTitleColor'),
          description: anyNamed('description'),
          dialogPlatform: anyNamed('dialogPlatform'),
          title: anyNamed('title')))
      .thenAnswer((realInvocation) => Future.value(DialogResponse()));

  locator.registerSingleton<DialogService>(service);
  return service;
}

MockFirestoreApi getAndRegisterFirestoreApi({
  bool saveAddressSuccess = true,
}) {
  _removeRegistrationIfExists<FirestoreApi>();
  final service = MockFirestoreApi();

  when(
    service.saveAddress(
      address: anyNamed('address'),
      user: anyNamed('user'),
    ),
  ).thenAnswer((realInvocation) => Future.value(saveAddressSuccess));

  locator.registerSingleton<FirestoreApi>(service);
  return service;
}

MockFirebaseAuthenticationService
    getAndRegisterFirebaseAuthenticationService() {
  _removeRegistrationIfExists<FirebaseAuthenticationService>();
  final service = MockFirebaseAuthenticationService();
  locator.registerSingleton<FirebaseAuthenticationService>(service);
  return service;
}

void registerServices() {
  getAndRegisterUserService();
  getAndRegisterNavigationService();
  getAndRegisterPlacesService();
  getAndRegisterDialogService();
  getAndRegisterFirestoreApi();
  getAndRegisterFirebaseAuthenticationService();
}

void unregisterServices() {
  locator.unregister<UserService>();
  locator.unregister<NavigationService>();
  locator.unregister<PlacesService>();
  locator.unregister<DialogService>();
  locator.unregister<FirestoreApi>();
  locator.unregister<FirebaseAuthenticationService>();
}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
