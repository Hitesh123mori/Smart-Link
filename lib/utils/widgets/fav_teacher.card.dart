import 'package:flutter/material.dart' ;

import '../../main.dart';
import '../colors.dart';


class FavTeacherCard extends StatefulWidget {

  final String name ;
  final String rating;

  const FavTeacherCard({super.key, required this.name, required this.rating});

  @override
  State<FavTeacherCard> createState() => _FavTeacherCardState();
}

class _FavTeacherCardState extends State<FavTeacherCard> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Container(
      height: 100,
      width: mq.width * 1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.theme['secondaryColor'].withOpacity(0.5)),
      child: Center(
        child: ListTile(
          trailing: Chip(
            label: Text("Request"),
            backgroundColor: AppColors.theme['primaryColor'],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          leading: CircleAvatar(
              radius: 30,
              child: Text(
                widget.name[0].toUpperCase(),
                style: TextStyle(color: AppColors.theme['fontColor']),
              ),
              backgroundColor:
              AppColors.theme['secondaryColor'].withOpacity(0.5)),
          title: Text(
            widget.name,
            style: TextStyle(
                color: AppColors.theme['fontColor'],
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            widget.rating,
            style: TextStyle(
                color: AppColors.theme['fontColor'],
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
