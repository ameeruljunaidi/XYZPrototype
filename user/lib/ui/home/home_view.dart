import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:xyz_prototype/ui/home/home_viewmodel.dart';
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
            bottomNavigationBarItem(
              icon: Icons.home,
              label: 'Home',
            ),
            bottomNavigationBarItem(
              icon: Icons.inbox,
              label: 'Inbox',
            ),
            bottomNavigationBarItem(
              icon: Icons.search,
              label: 'Search',
            ),
            bottomNavigationBarItem(
              icon: Icons.notifications,
              label: 'Notifications',
            ),
            bottomNavigationBarItem(
              icon: Icons.list,
              label: 'Profile',
            ),
          ],
        ),
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: model.reverse,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          child: model.getViewForIndex(model.currentIndex),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem({icon, label}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
        child: Icon(icon),
      ),
      label: label,
    );
  }
}
