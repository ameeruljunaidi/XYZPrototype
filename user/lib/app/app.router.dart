// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/add_business/add_business_view.dart';
import '../ui/address_selection/address_selection_view.dart';
import '../ui/create_account/create_account_view.dart';
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
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MarketPlaceView(),
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
