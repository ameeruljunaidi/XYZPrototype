import 'package:places_service/places_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/services/user_service.dart';
import 'package:xyz_prototype/ui/add_business/add_business_view.dart';
import 'package:xyz_prototype/ui/address_selection/address_selection_view.dart';
import 'package:xyz_prototype/ui/create_account/create_account_view.dart';
import 'package:xyz_prototype/ui/home/home_view.dart';
import 'package:xyz_prototype/ui/inbox/inbox_view.dart';
import 'package:xyz_prototype/ui/login/login_view.dart';
import 'package:xyz_prototype/ui/marketplace/marketplace_view.dart';
import 'package:xyz_prototype/ui/notifications/notification_view.dart';
import 'package:xyz_prototype/ui/profile/profile_view.dart';
import 'package:xyz_prototype/ui/search/search_view.dart';
import 'package:xyz_prototype/ui/startup/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: AddressSelectionView),
    MaterialRoute(page: CreateAccountView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: AddBusinessView),
    MaterialRoute(page: MarketPlaceView),
    MaterialRoute(page: InboxView),
    MaterialRoute(page: SearchView),
    MaterialRoute(page: NotificationsView),
    MaterialRoute(page: ProfileView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirestoreApi),
    LazySingleton(classType: PlacesService),
    LazySingleton(classType: DialogService),
    Singleton(classType: FirebaseAuthenticationService),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
