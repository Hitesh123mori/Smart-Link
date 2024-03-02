import 'package:flutter/material.dart';

import '../../utils/colors.dart';


class ProfileTeacher extends StatefulWidget {
  const ProfileTeacher({super.key});

  @override
  State<ProfileTeacher> createState() => _ProfileTeacherState();
}

class _ProfileTeacherState extends State<ProfileTeacher> {
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
