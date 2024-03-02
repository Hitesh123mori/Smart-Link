import 'package:flutter/material.dart';
import 'package:ingenious_5/screens/Institute/Started_teachers_institute.dart';
import 'package:ingenious_5/screens/Institute/home_screen_institute.dart';
import 'package:ingenious_5/screens/Institute/notifications_institute.dart';
import 'package:ingenious_5/screens/Institute/profile_institute.dart';

import 'package:ingenious_5/utils/colors.dart';


class HomeTabsInstitute extends StatefulWidget {
  const HomeTabsInstitute({super.key});

  @override
  State<HomeTabsInstitute> createState() => _HomeTabsInstituteState();
}

class _HomeTabsInstituteState extends State<HomeTabsInstitute> {


  int _currentIndex = 0;

  final List<Widget> children = [
    HomeScreenInstitute(),
    StartedTeachers(),
    NotificationInstitute(),
    ProfileInstitute(),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          selectedItemColor: AppColors.theme['primaryColor'],
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Stared',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.warehouse),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return HomeScreenInstitute();
      case 1:
        return StartedTeachers();
      case 2:
        return NotificationInstitute();
      default:
        return ProfileInstitute();
    }
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }





}
