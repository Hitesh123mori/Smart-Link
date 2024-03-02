import 'package:flutter/material.dart';
import 'package:ingenious_5/screens/teacher/profile_teacher.dart';
import '../../utils/colors.dart';
import 'home_screen_teachers.dart';
import 'job_request.dart';
import 'notification_teacher.dart';



class HomeTabsTeachers extends StatefulWidget {
  const HomeTabsTeachers({super.key});

  @override
  State<HomeTabsTeachers> createState() => _HomeTabsTeachersState();
}

class _HomeTabsTeachersState extends State<HomeTabsTeachers> {


  int _currentIndex = 0;

  final List<Widget> children = [

    HomeScreenTeacher(),
    JobRequests(),
    NotificationsTeacher(),
    ProfileTeacher(),

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
              icon: Icon(Icons.request_page_outlined),
              label: 'Jobs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_outlined),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return HomeScreenTeacher();
      case 1:
        return JobRequests();
      case 2:
        return NotificationsTeacher();
      default:
        return ProfileTeacher();
    }
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}
