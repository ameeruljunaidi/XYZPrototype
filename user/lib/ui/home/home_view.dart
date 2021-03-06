import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          iconSize: 24.0,
          selectedItemColor: kcPrimaryColor,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            bottomNavigationBarItem(
              icon: Icons.home_outlined,
              label: 'Home',
            ),
            bottomNavigationBarItem(
              icon: Icons.favorite_outline,
              label: 'Favorites',
            ),
            bottomNavigationBarItem(
              icon: FontAwesomeIcons.running,
              label: 'Activities',
            ),
            bottomNavigationBarItem(
              icon: Icons.chat_outlined,
              label: 'Messages',
            ),
            bottomNavigationBarItem(
              icon: Icons.person_outline_rounded,
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
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
      label: label,
    );
  }
}
