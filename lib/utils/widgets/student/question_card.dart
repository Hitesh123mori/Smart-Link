import 'package:flutter/material.dart';
import 'package:ingenious_5/models/question_model/Question.dart';
import 'package:ingenious_5/screens/chat_room.dart';
import 'package:ingenious_5/transitions/left_right.dart';
import 'package:ingenious_5/utils/helper_functions/HelperFunction.dart';
import 'package:ingenious_5/utils/helper_functions/date_formate.dart';
import '../../../main.dart';
import '../../colors.dart';

class QuestionCard extends StatefulWidget {
  final Question question;
  final double width;

  const QuestionCard({super.key, required this.question, required this.width});

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10),
      child: InkWell(
        onTap: (){
          print("#Q: ${widget.question.toJson()}");
          Navigator.push(context, LeftToRight(ChatRoom(question: widget.question,)));

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
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
                     child: Text((widget.question.chat?.length.toString() ?? "0") + " Answers",style: TextStyle(
                       color: AppColors.theme['fontColor'],
                       fontWeight: FontWeight.bold,
                     ),),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 18.0),
                     child: Text(MyDateUtil.getLastMessageTime(context: context, time: widget.question.createTime ?? "0"),style: TextStyle(
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
