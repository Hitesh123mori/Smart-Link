import 'package:flutter/material.dart';
import 'package:ingenious_5/models/user_model/AppUser.dart';
import 'package:ingenious_5/utils/colors.dart';

import '../../main.dart';

class HighRatedTeacherCard extends StatefulWidget {
  final AppUser user;

  const HighRatedTeacherCard({super.key, required this.user});

  @override
  State<HighRatedTeacherCard> createState() => _HighRatedTeacherCardState();
}

class _HighRatedTeacherCardState extends State<HighRatedTeacherCard> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        height: 100,
        width: mq.width * 1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.theme['secondaryColor'].withOpacity(0.5)),
        child: Center(
          child: ListTile(
            trailing: Chip(
              label: Text("Hire"),
              backgroundColor: AppColors.theme['primaryColor'],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            leading: CircleAvatar(
                radius: 30,
                child: Text(
                  widget.user.name![0].toUpperCase(),
                  style: TextStyle(color: AppColors.theme['fontColor']),
                ),
                backgroundColor:
                    AppColors.theme['secondaryColor'].withOpacity(0.5)),
            title: Text(
              widget.user!.name!,
              style: TextStyle(
                  color: AppColors.theme['fontColor'],
                  fontWeight: FontWeight.bold),
            ),
            // subtitle: Text(
            //
            //
            //   //todo here rating field
            //
            //   // style: TextStyle(
            //   //     color: AppColors.theme['fontColor'],
            //   //     fontWeight: FontWeight.bold),
            // ),
          ),
        ),
      ),
    );
  }
}
