import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/widgets/fav_teacher.card.dart';


class FavTeachers extends StatefulWidget {
  const FavTeachers({super.key});

  @override
  State<FavTeachers> createState() => _FavTeachersState();
}

class _FavTeachersState extends State<FavTeachers> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.theme['primaryColor'],
          centerTitle: true,
          title: Text(
            "Liked Teachers",
            style: TextStyle(
                color: AppColors.theme['backgroundColor'],
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rated by you",
                  style: TextStyle(
                      color: AppColors.theme['fontColor'],
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                SizedBox(height: 10,),
                FavTeacherCard(name: 'Dr.Sapan', rating: '4.5 star',),
                SizedBox(height: 10,),
                FavTeacherCard(name: 'Jishan', rating: '4 star',),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
