import 'package:flutter/material.dart';
import 'package:ingenious_5/screens/student/profile_students.dart';
import 'package:ingenious_5/screens/student/student_question.dart';
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
    StudentDoubt(),
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
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Teachers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.question_answer_outlined),
              label: 'My Doubts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_outlined),
              label: 'Notification',
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
        return HomeScreenStudent();
      case 1:
        return FavTeachers();
      case 2:
        return StudentDoubt();
      case 3:
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
