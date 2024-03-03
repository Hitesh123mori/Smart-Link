import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/widgets/student/question_card.dart';
import '../student/add_question.dart';

class HomeScreenTeacher extends StatefulWidget {
  const HomeScreenTeacher({super.key});

  @override
  State<HomeScreenTeacher> createState() => _HomeScreenTeacherState();
}

class _HomeScreenTeacherState extends State<HomeScreenTeacher> {
  bool isFirstTime = true;
  List<String> _filters = [];
  List<String> _items = [];

  bool _isSelected(String filter) {
    return _filters.contains(filter);
  }

  void _toggleFilter(String filter) {
    setState(() {
      if (_filters.contains(filter)) {
        _filters.remove(filter);
      } else {
        _filters.add(filter);
      }
    });
  }

  List<String> _getFilteredItems() {
    if (_filters.isEmpty) {
      return _items;
    } else {
      return _items.where((item) => _filters.contains(item)).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Consumer<AppUserProvider>(builder: (context, value, child){
      if(isFirstTime){
        value.initUser();
        isFirstTime = false;
      }
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
              Wrap(
                children: _items
                    .map((filter) => FilterChip(
                  label: Text(filter),
                  selected: _isSelected(filter),
                  onSelected: (_) {
                    _toggleFilter(filter);
                  },
                ))
                    .toList(),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: StreamBuilder(
                    stream: FirebaseAPIs.rtdbRef.child("questions").orderByChild("vote").limitToLast(2).onValue,
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
                        qList.add(Question.fromJson(value));
                      });

                      return Row(
                        children: List<Widget>.generate(
                          qList.length,
                              (index) => QuestionCard(question: qList[index], width: 300),
                        ).toList(),
                      );
                    },
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
                      child: StreamBuilder(
                        stream: FirebaseAPIs.rtdbRef.child("questions").onValue,
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

                    // Column(
                    //   children: dummyquestions.map((question) {
                    //     return Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    //       child: QuestionCard(
                    //         question: question,
                    //         width: mq.width * 1,
                    //       ),
                    //     );
                    //   }).toList(),
                    // ),
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
