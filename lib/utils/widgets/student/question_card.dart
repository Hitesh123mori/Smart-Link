import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ingenious_5/models/question_model/Question.dart';
import 'package:ingenious_5/transitions/left_right.dart';

import '../../../main.dart';
import '../../../models/user_model/AppUser.dart';
import '../../../screens/chat_room.dart';
import '../../colors.dart';

class QuestionCard extends StatefulWidget {
  final Question question;
  final double width;

  const QuestionCard({super.key, required this.question, required this.width});

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {

  final AppUser user = AppUser(
    userId: "123",
    name :"Hitesh Mori",
    email: "22bce197@nirmauni.ac.in",
    pincode: "3600001",
    type: "S",
    address: "Rajkot,Gujarat"
  );



  // retrive all data base on user's uid


  // Future<AppUser?> getUserData(String uid) async {
  //   try {
  //     final querySnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(uid)
  //         .get();
  //
  //     if (querySnapshot.exists) {
  //       final userData = querySnapshot.data() as Map<String, dynamic>;
  //       final  user = AppUser(
  //         userId: uid,
  //         name: userData['name'],
  //         email: userData['email'],
  //         address: userData['address'],
  //         pincode: userData['pincode'],
  //         type: userData['type'],
  //         interest: userData['interest'],
  //         qualification: userData['qualification'],
  //         vacancy: userData['vacancy'],
  //         institute: userData['institute'],
  //         staredList:userData['staredList'],
  //         notificationPushToken: userData['notificationPushToken'],
  //       ) ;
  //       return user ;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Error retrieving user data: $e');
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10),
      child: InkWell(
        onTap: (){
          Navigator.push(context, LeftToRight(ChatRoom(question: widget.question, user: user!,)));
        },
        child: Container(
          width: widget.width,
          height: 170,
          decoration: BoxDecoration(
            color: AppColors.theme['secondaryColor'].withOpacity(0.4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      widget.question.userName![0],
                      style: TextStyle(color: AppColors.theme['fontColor']),
                    ),
                    backgroundColor:
                        AppColors.theme['secondaryColor'].withOpacity(0.5),
                  ),
                  title: Text(widget.question.userName!,style: TextStyle(
                    color: AppColors.theme['fontColor'],
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(widget.question.text!,style: TextStyle(
                    color: AppColors.theme['fontColor'],
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                SizedBox(height: 20,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 18.0),
                     child: Text(widget.question.answer!.length.toString() + " Answers",style: TextStyle(
                       color: AppColors.theme['fontColor'],
                       fontWeight: FontWeight.bold,
                     ),),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 18.0),
                     child: Text(widget.question.createTime!,style: TextStyle(
                       color: AppColors.theme['fontColor'],
                       fontWeight: FontWeight.bold,
                     ),),
                   ),
                 ],
               )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
