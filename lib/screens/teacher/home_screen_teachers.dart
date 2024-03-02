import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class HomeScreenTeacher extends StatefulWidget {
  const HomeScreenTeacher({super.key});

  @override
  State<HomeScreenTeacher> createState() => _HomeScreenTeacherState();
}

class _HomeScreenTeacherState extends State<HomeScreenTeacher> {
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
