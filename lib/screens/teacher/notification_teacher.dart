import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class NotificationsTeacher extends StatefulWidget {
  const NotificationsTeacher({super.key});

  @override
  State<NotificationsTeacher> createState() => _NotificationsTeacherState();
}

class _NotificationsTeacherState extends State<NotificationsTeacher> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.theme['primaryColor'],
        ),
      ),
    );
  }
}
