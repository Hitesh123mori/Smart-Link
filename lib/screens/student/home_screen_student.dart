import 'package:flutter/material.dart';
import 'package:ingenious_5/models/question_model/Question.dart';
import 'package:ingenious_5/utils/colors.dart';

import '../../utils/widgets/student/question_card.dart';

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
                        icon :Icon(Icons.search,
                          size: 32,
                          color: AppColors.theme['fontColor'],), onPressed: () {  },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon :Icon(Icons.add,
                        size: 32,
                        color: AppColors.theme['fontColor'],), onPressed: () {  },
                      )
                    ],
                  ),
                ],
              ),
            ),
            body: Column(
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
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            )));
  }
}
