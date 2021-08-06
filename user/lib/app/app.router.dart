// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/add_business/add_business_view.dart';
import '../ui/add_gig/add_gig_category_view.dart';
import '../ui/add_gig/add_gig_location_view.dart';
import '../ui/add_gig/add_gig_photos_view.dart';
import '../ui/add_gig/add_gig_price_chooser_view.dart';
import '../ui/add_gig/add_gig_price_view.dart';
import '../ui/add_gig/add_gig_service_view.dart';
import '../ui/add_gig/add_gig_title_view.dart';
import '../ui/address_selection/address_selection_view.dart';
import '../ui/chat/chat_view.dart';
import '../ui/create_account/create_account_view.dart';
import '../ui/favorites/favorites_view.dart';
import '../ui/gig_edit/gig_edit_view.dart';
import '../ui/gig_manager/gig_manager_view.dart';
import '../ui/home/home_view.dart';
import '../ui/inbox/inbox_view.dart';
import '../ui/login/login_view.dart';
import '../ui/marketplace/marketplace_view.dart';
import '../ui/profile/profile_add_avatar_view.dart';
import '../ui/profile/profile_view.dart';
import '../ui/search/search_view.dart';
import '../ui/startup/startup_view.dart';
import '../ui/vendor_profile/vendor_profile_view.dart';

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
  static const String favoritesView = '/favorites-view';
  static const String profileView = '/profile-view';
  static const String gigManagerView = '/gig-manager-view';
  static const String gigEditView = '/gig-edit-view';
  static const String addGigTitleView = '/add-gig-title-view';
  static const String addGigPhotosView = '/add-gig-photos-view';
  static const String addGigLocationView = '/add-gig-location-view';
  static const String profileAddAvatarView = '/profile-add-avatar-view';
  static const String addGigCategoryView = '/add-gig-category-view';
  static const String addGigServiceView = '/add-gig-service-view';
  static const String addGigPriceView = '/add-gig-price-view';
  static const String addGigPriceChooserView = '/add-gig-price-chooser-view';
  static const String vendorProfileView = '/vendor-profile-view';
  static const String chatView = '/chat-view';
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
    favoritesView,
    profileView,
    gigManagerView,
    gigEditView,
    addGigTitleView,
    addGigPhotosView,
    addGigLocationView,
    profileAddAvatarView,
    addGigCategoryView,
    addGigServiceView,
    addGigPriceView,
    addGigPriceChooserView,
    vendorProfileView,
    chatView,
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
    RouteDef(Routes.favoritesView, page: FavoritesView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.gigManagerView, page: GigManagerView),
    RouteDef(Routes.gigEditView, page: GigEditView),
    RouteDef(Routes.addGigTitleView, page: AddGigTitleView),
    RouteDef(Routes.addGigPhotosView, page: AddGigPhotosView),
    RouteDef(Routes.addGigLocationView, page: AddGigLocationView),
    RouteDef(Routes.profileAddAvatarView, page: ProfileAddAvatarView),
    RouteDef(Routes.addGigCategoryView, page: AddGigCategoryView),
    RouteDef(Routes.addGigServiceView, page: AddGigServiceView),
    RouteDef(Routes.addGigPriceView, page: AddGigPriceView),
    RouteDef(Routes.addGigPriceChooserView, page: AddGigPriceChooserView),
    RouteDef(Routes.vendorProfileView, page: VendorProfileView),
    RouteDef(Routes.chatView, page: ChatView),
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
    FavoritesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const FavoritesView(),
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
    ProfileAddAvatarView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ProfileAddAvatarView(),
        settings: data,
      );
    },
    AddGigCategoryView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddGigCategoryView(),
        settings: data,
      );
    },
    AddGigServiceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddGigServiceView(),
        settings: data,
      );
    },
    AddGigPriceView: (data) {
      var args = data.getArgs<AddGigPriceViewArguments>(
        orElse: () => AddGigPriceViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddGigPriceView(key: args.key),
        settings: data,
      );
    },
    AddGigPriceChooserView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddGigPriceChooserView(),
        settings: data,
      );
    },
    VendorProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const VendorProfileView(),
        settings: data,
      );
    },
    ChatView: (data) {
      var args = data.getArgs<ChatViewArguments>(
        orElse: () => ChatViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChatView(key: args.key),
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

/// AddGigPriceView arguments holder class
class AddGigPriceViewArguments {
  final Key? key;
  AddGigPriceViewArguments({this.key});
}

/// ChatView arguments holder class
class ChatViewArguments {
  final Key? key;
  ChatViewArguments({this.key});
}
