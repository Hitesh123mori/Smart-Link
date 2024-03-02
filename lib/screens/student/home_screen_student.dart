import 'package:flutter/material.dart';
import 'package:ingenious_5/models/question_model/Question.dart';
import 'package:ingenious_5/transitions/left_right.dart';
import 'package:ingenious_5/utils/colors.dart';

import '../../main.dart';
import '../../utils/widgets/student/question_card.dart';
import 'add_question.dart';

class HomeScreenStudent extends StatefulWidget {
  const HomeScreenStudent({super.key});

  @override
  State<HomeScreenStudent> createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  final FocusNode _focusNode = FocusNode();

  List<Question> dummyquestions = [
    Question(
        text: "What is Operating System ? What is Operating System ? ",
        userId: "1332324",
        userName: "Hitesh Mori",
        userType: "S",
        createTime: "2:03,3 March",
        answer: [
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
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
        answer: [
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
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
        answer: [
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
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
        answer: [
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
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
        answer: [
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
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
        answer: [
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
              userName: "Harsh Rajput",
              userType: "T",
              createTime: "2:07"),
          Answer(
              text: "Operating system is moderator between use and hideware",
              vote: 23,
              userId: "1312131313",
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
            backgroundColor: AppColors.theme['backgroundColor'],
            appBar: AppBar(
              backgroundColor: AppColors.theme['backgroundColor'],
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Questions",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.theme['fontColor']),
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
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          size: 32,
                          color: AppColors.theme['fontColor'],
                        ),
                        onPressed: () {
                          Navigator.push(context, LeftToRight(AddQuesion()));
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: dummyquestions.map((question) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: QuestionCard(
                        question: question,
                        width: 300,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Text(
                "Related Questions",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.theme['fontColor'],
                  fontSize: 21,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
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



    ));
  }
}
