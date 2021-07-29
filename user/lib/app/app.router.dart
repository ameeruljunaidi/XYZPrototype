// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/add_business/add_business_view.dart';
import '../ui/add_gig/add_gig_location_view.dart';
import '../ui/add_gig/add_gig_photos_view.dart';
import '../ui/add_gig/add_gig_title_view.dart';
import '../ui/address_selection/address_selection_view.dart';
import '../ui/create_account/create_account_view.dart';
import '../ui/gig_edit/gig_edit_view.dart';
import '../ui/gig_manager/gig_manager_view.dart';
import '../ui/home/home_view.dart';
import '../ui/inbox/inbox_view.dart';
import '../ui/login/login_view.dart';
import '../ui/marketplace/marketplace_view.dart';
import '../ui/notifications/notification_view.dart';
import '../ui/profile/profile_view.dart';
import '../ui/search/search_view.dart';
import '../ui/startup/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String homeView = '/home-view';
  static const String addressSelectionView = '/address-selection-view';
  static const String createAccountView = '/create-account-view';
  static const String loginView = '/login-view';
  static const String addBusinessView = '/add-business-view';
  static const String marketPlaceView = '/market-place-view';
  static const String inboxView = '/inbox-view';
  static const String searchView = '/search-view';
  static const String notificationsView = '/notifications-view';
  static const String profileView = '/profile-view';
  static const String gigManagerView = '/gig-manager-view';
  static const String gigEditView = '/gig-edit-view';
  static const String addGigTitleView = '/add-gig-title-view';
  static const String addGigPhotosView = '/add-gig-photos-view';
  static const String addGigLocationView = '/add-gig-location-view';
  static const all = <String>{
    startupView,
    homeView,
    addressSelectionView,
    createAccountView,
    loginView,
    addBusinessView,
    marketPlaceView,
    inboxView,
    searchView,
    notificationsView,
    profileView,
    gigManagerView,
    gigEditView,
    addGigTitleView,
    addGigPhotosView,
    addGigLocationView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.addressSelectionView, page: AddressSelectionView),
    RouteDef(Routes.createAccountView, page: CreateAccountView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.addBusinessView, page: AddBusinessView),
    RouteDef(Routes.marketPlaceView, page: MarketPlaceView),
    RouteDef(Routes.inboxView, page: InboxView),
    RouteDef(Routes.searchView, page: SearchView),
    RouteDef(Routes.notificationsView, page: NotificationsView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.gigManagerView, page: GigManagerView),
    RouteDef(Routes.gigEditView, page: GigEditView),
    RouteDef(Routes.addGigTitleView, page: AddGigTitleView),
    RouteDef(Routes.addGigPhotosView, page: AddGigPhotosView),
    RouteDef(Routes.addGigLocationView, page: AddGigLocationView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartupView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    AddressSelectionView: (data) {
      var args = data.getArgs<AddressSelectionViewArguments>(
        orElse: () => AddressSelectionViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddressSelectionView(key: args.key),
        settings: data,
      );
    },
    CreateAccountView: (data) {
      var args = data.getArgs<CreateAccountViewArguments>(
        orElse: () => CreateAccountViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateAccountView(key: args.key),
        settings: data,
      );
    },
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    AddBusinessView: (data) {
      var args = data.getArgs<AddBusinessViewArguments>(
        orElse: () => AddBusinessViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddBusinessView(key: args.key),
        settings: data,
      );
    },
    MarketPlaceView: (data) {
      var args = data.getArgs<MarketPlaceViewArguments>(
        orElse: () => MarketPlaceViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MarketPlaceView(key: args.key),
        settings: data,
      );
    },
    InboxView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const InboxView(),
        settings: data,
      );
    },
    SearchView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SearchView(),
        settings: data,
      );
    },
    NotificationsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NotificationsView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ProfileView(),
        settings: data,
      );
    },
    GigManagerView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const GigManagerView(),
        settings: data,
      );
    },
    GigEditView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const GigEditView(),
        settings: data,
      );
    },
    AddGigTitleView: (data) {
      var args = data.getArgs<AddGigTitleViewArguments>(
        orElse: () => AddGigTitleViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddGigTitleView(key: args.key),
        settings: data,
      );
    },
    AddGigPhotosView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddGigPhotosView(),
        settings: data,
      );
    },
    AddGigLocationView: (data) {
      var args = data.getArgs<AddGigLocationViewArguments>(
        orElse: () => AddGigLocationViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddGigLocationView(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AddressSelectionView arguments holder class
class AddressSelectionViewArguments {
  final Key? key;
  AddressSelectionViewArguments({this.key});
}

/// CreateAccountView arguments holder class
class CreateAccountViewArguments {
  final Key? key;
  CreateAccountViewArguments({this.key});
}

/// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}

/// AddBusinessView arguments holder class
class AddBusinessViewArguments {
  final Key? key;
  AddBusinessViewArguments({this.key});
}

/// MarketPlaceView arguments holder class
class MarketPlaceViewArguments {
  final Key? key;
  MarketPlaceViewArguments({this.key});
}

/// AddGigTitleView arguments holder class
class AddGigTitleViewArguments {
  final Key? key;
  AddGigTitleViewArguments({this.key});
}

/// AddGigLocationView arguments holder class
class AddGigLocationViewArguments {
  final Key? key;
  AddGigLocationViewArguments({this.key});
}
