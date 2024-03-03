import 'package:flutter/material.dart' ;
import 'package:ingenious_5/apis/FirebaseAPIs.dart';
import 'package:ingenious_5/models/message_model.dart';
import 'package:ingenious_5/providers/CurrentUser.dart';
import 'package:ingenious_5/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../models/question_model/Question.dart';
import '../../utils/widgets/student/question_card.dart';


class StudentDoubt extends StatefulWidget {
  const StudentDoubt({super.key});

  @override
  State<StudentDoubt> createState() => _StudentDoubtState();
}

class _StudentDoubtState extends State<StudentDoubt> {

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Consumer<AppUserProvider>(builder: (context, value, child){
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
                      child: StreamBuilder(
                        stream: FirebaseAPIs.rtdbRef.child("questions").orderByChild("userId").equalTo(value.user!.userId).onValue,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
                            return Text('No data available');
                          }
                          print("#snap ${snapshot.data!.snapshot.value}");
                          Map<dynamic, dynamic> messages = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                          // Extracting message values from the Map
                          List<Question> qList = [];
                          messages.forEach((key, value) {
                            Question q = Question.fromJson(value);
                            // for(int i=0; i<)
                            qList.add(q);
                          });

                          return Column(
                            children: List<Widget>.generate(
                              qList.length,
                                  (index) {
                                print("#obj: ${qList[index].qID} ${qList[index].userName}");
                                return QuestionCard(question: qList[index], width: mq.width * 1);
                              },
                            ).toList(),
                          );

                        },
                      )

                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
