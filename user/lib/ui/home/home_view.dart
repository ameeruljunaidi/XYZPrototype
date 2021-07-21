import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/home/home_viewmodel.dart';
import 'package:xyz_prototype/ui/inbox/inbox_view.dart';
import 'package:xyz_prototype/ui/marketplace/marketplace_view.dart';
import 'package:xyz_prototype/ui/notifications/notification_view.dart';
import 'package:xyz_prototype/ui/profile/profile_view.dart';
import 'package:xyz_prototype/ui/search/search_view.dart';
import 'package:xyz_ui/xyz_ui.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 32.0,
          selectedItemColor: kcPrimaryColor,
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Profile',
            ),
          ],
        ),
        body: getViewForIndex(model.currentIndex),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
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
}
