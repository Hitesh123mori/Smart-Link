import 'package:flutter/material.dart' ;
import 'package:ingenious_5/utils/colors.dart';

import '../../main.dart';
import '../../models/question_model/Question.dart';
import '../../utils/widgets/student/question_card.dart';


class StudentDoubt extends StatefulWidget {
  const StudentDoubt({super.key});

  @override
  State<StudentDoubt> createState() => _StudentDoubtState();
}

class _StudentDoubtState extends State<StudentDoubt> {

  List<Question> dummyquestions = [
    Question(
        text: "What is Operating System ? What is Operating System ? ",
        userId: "1332324",
        userName: "Hitesh Mori",
        userType: "S",
        createTime: "2:03,3 March",
        chat: [
          Chats(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              fromId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Chats(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              fromId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Chats(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              fromId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Chats(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              fromId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
        ],
        domain: [
          "Computer Sciece",
          "Assemby Language",
          "Operating System"
        ]),
    Question(
        text: "What is Operating System ? What is Operating System ? ",
        userId: "1332324",
        userName: "Hitesh Mori",
        userType: "S",
        createTime: "2:03,3 March",
        chat: [
          Chats(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              fromId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Chats(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              fromId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Chats(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              fromId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Chats(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              fromId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
        ],
        domain: [
          "Computer Sciece",
          "Assemby Language",
          "Operating System"
        ]),
    Question(
        text: "What is Operating System ? What is Operating System ? ",
        userId: "1332324",
        userName: "Hitesh Mori",
        userType: "S",
        createTime: "2:03,3 March",
        chat: [
          Chats(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              fromId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Chats(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              fromId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Chats(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              fromId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Chats(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              fromId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
        ],
        domain: [
          "Computer Sciece",
          "Assemby Language",
          "Operating System"
        ]),
    Question(
        text: "What is Operating System ? What is Operating System ? ",
        userId: "1332324",
        userName: "Hitesh Mori",
        userType: "S",
        createTime: "2:03,3 March",
        chat: [
          Chats(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              fromId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Chats(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              fromId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Chats(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              fromId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Chats(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              fromId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
        ],
        domain: [
          "Computer Sciece",
          "Assemby Language",
          "Operating System"
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "My Questions",
            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.theme['backgroundColor'], fontSize: 20),
          ),
          backgroundColor: AppColors.theme['primaryColor'],
        ),

        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Text(
                "My Questions",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.theme['fontColor'],
                  fontSize: 21,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: dummyquestions.map((question) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: QuestionCard(
                          question: question,
                          width: mq.width * 1,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
