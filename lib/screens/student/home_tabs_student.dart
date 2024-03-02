import 'package:flutter/material.dart';
import 'package:ingenious_5/screens/student/profile_students.dart';

import '../../utils/colors.dart';
import 'fav_teachers_students.dart';
import 'home_screen_student.dart';
import 'notifications_student.dart';


class HomeTabsStudents extends StatefulWidget {
  const HomeTabsStudents({super.key});

  @override
  State<HomeTabsStudents> createState() => _HomeTabsStudentsState();
}

class _HomeTabsStudentsState extends State<HomeTabsStudents> {


  int _currentIndex = 0;

  final List<Widget> children = [
    HomeScreenStudent(),
    FavTeachers(),
    NotificationStudent(),
    ProfileStudent(),
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
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
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
        return HomeScreenStudent();
      case 1:
        return FavTeachers();
      case 2:
        return NotificationStudent();
      default:
        return ProfileStudent();
    }
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }





}
