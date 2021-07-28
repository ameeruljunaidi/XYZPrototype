// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

import '../api/firestore_api.dart';
import '../services/cloud_storage_service.dart';
import '../services/gig_service.dart';
import '../services/user_service.dart';
import '../ui/add_business/add_business_view.dart';
import '../ui/create_account/create_account_view.dart';
import '../ui/inbox/inbox_viewmodel.dart';
import '../ui/login/login_view.dart';
import '../ui/marketplace/marketplace_viewmodel.dart';
import '../ui/notifications/notification_viewmodel.dart';
import '../ui/profile/profile_viewmodel.dart';
import '../ui/search/search_viewmodel.dart';
import '../utils/image_selector.dart';

final locator = StackedLocator.instance;

void setupLocator({String? environment, EnvironmentFilter? environmentFilter}) {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => FirestoreApi());
  locator.registerLazySingleton(() => PlacesService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => MarketPlaceViewModel());
  locator.registerLazySingleton(() => InboxViewModel());
  locator.registerLazySingleton(() => SearchViewModel());
  locator.registerLazySingleton(() => NotificationsViewModel());
  locator.registerLazySingleton(() => ProfileViewModel());
  locator.registerLazySingleton(() => CloudStorageService());
  locator.registerLazySingleton(() => LoginView());
  locator.registerLazySingleton(() => CreateAccountView());
  locator.registerLazySingleton(() => AddBusinessView());
  locator.registerLazySingleton(() => GigService());
  locator.registerSingleton(ImageSelector());
  locator.registerSingleton(FirebaseAuthenticationService());
}
