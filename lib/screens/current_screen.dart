import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/screens/basic_details_screen.dart';
import 'package:vriddhi_0/screens/crop_guide_screen.dart';
import 'package:vriddhi_0/screens/explore_screen.dart';
import 'package:vriddhi_0/screens/home_screen.dart';
import 'package:vriddhi_0/screens/progress_screen.dart';
import 'package:vriddhi_0/screens/user_profile_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CurrentBottomNavBarScreen extends StatefulWidget {
  static const String id = 'current_screen';
  @override
  State<CurrentBottomNavBarScreen> createState() => _CurrentBottomNavBarScreenState();
}

class _CurrentBottomNavBarScreenState extends State<CurrentBottomNavBarScreen> {
  int _currentIndex = 0;
  List<Widget> widgetListForBottomNav =  [
    HomeScreen(),
    CropGuideScreen(),
    ExploreScreen(),
    ProgressScreen(),
    UserProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: IndexedStack(
          children: widgetListForBottomNav,
          index: _currentIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: kBottomNavBarColor,
          // showUnselectedLabels: false,
          // showSelectedLabels: false,
          selectedIconTheme: const IconThemeData(
            color: kPrimaryAppColor,
            size: 25,
          ),
          unselectedIconTheme: const IconThemeData(
            color: kNavyBlueColor,
            size: 20,
          ),
          selectedItemColor: kPrimaryAppColor,
          // selectedFontSize: 0,
          // unselectedFontSize: 0,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu_book_outlined,
                ),
                label: 'Guide'),
            const BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.seedling),
                label: 'Explore'),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.task_alt_rounded,
                ),
                label: 'Task'),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                label: 'Account'),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
