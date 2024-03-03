import 'package:flutter/material.dart';
import 'package:ingenious_5/models/user_model/AppUser.dart';
import 'package:ingenious_5/providers/CurrentUser.dart';
import 'package:ingenious_5/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../utils/widgets/high_rated_teacher_card.dart';
import '../student/add_question.dart';


class HomeScreenInstitute extends StatefulWidget {
  const HomeScreenInstitute({super.key});

  @override
  State<HomeScreenInstitute> createState() => _HomeScreenInstituteState();
}

class _HomeScreenInstituteState extends State<HomeScreenInstitute> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppUserProvider>(builder: (context,value,child){
      return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColors.theme['backgroundColor'],
          appBar: AppBar(
            backgroundColor: AppColors.theme['backgroundColor'],
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Faculties",
                  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.theme['fontColor']),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 32,
                        color: AppColors.theme['fontColor'],
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),

              ],
            ),
          ),

          body:   HighRatedTeacherCard(
            user: value.user!,
          ),
        ),
      );
    });
  }
}
