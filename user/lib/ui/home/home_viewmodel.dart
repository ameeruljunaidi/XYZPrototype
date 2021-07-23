import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/inbox/inbox_view.dart';
import 'package:xyz_prototype/ui/marketplace/marketplace_view.dart';
import 'package:xyz_prototype/ui/notifications/notification_view.dart';
import 'package:xyz_prototype/ui/profile/profile_view.dart';
import 'package:xyz_prototype/ui/search/search_view.dart';

class HomeViewModel extends IndexTrackingViewModel {
  Widget createWidgetIndex(int index) {
    switch (index) {
      case 0:
        return MarketPlaceView();
      case 1:
        return InboxView();
      case 2:
        return SearchView();
      case 3:
        return NotificationsView();
      case 4:
        return ProfileView();
      default:
        return MarketPlaceView();
    }
  }

  Widget getViewForIndex(int currentIndex) {
    return createWidgetIndex(currentIndex);
  }
}
