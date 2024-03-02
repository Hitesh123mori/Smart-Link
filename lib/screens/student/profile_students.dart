import 'package:flutter/material.dart';
import 'package:ingenious_5/apis/FireStoreAPIs/InterestAPIs.dart';
import 'package:ingenious_5/providers/CurrentUser.dart';
import 'package:ingenious_5/screens/auth/login_screen.dart';
import 'package:ingenious_5/transitions/right_left.dart';
import 'package:ingenious_5/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../utils/widgets/text_field/custom_text_field.dart';
import '../../utils/widgets/text_field/custom_text_field2.dart';

class ProfileStudent extends StatefulWidget {
  const ProfileStudent({super.key});

  @override
  State<ProfileStudent> createState() => _ProfileStudentState();
}

class _ProfileStudentState extends State<ProfileStudent> {
  TextEditingController interestController = TextEditingController();
  List<String> interests = [];
  List<String> dummyInterests = ["Mathematics", "Physics", "Biology", "Computer Science", "History", "Literature"];
  List<String> suggestedInterests = [];

  void suggestInterests(String userInput) {
    suggestedInterests = dummyInterests.where((interest) => interest.toLowerCase().contains(userInput.toLowerCase())).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppUserProvider>(builder: (context, value, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColors.theme['backgroundColor'],
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Your Profile",
              style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.theme['backgroundColor'], fontSize: 20),
            ),
            backgroundColor: AppColors.theme['primaryColor'],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.logout,
              color: AppColors.theme['backgroundColor'],
            ),
            onPressed: () async {
              await value.logOut().then((_) {
                Navigator.pushReplacement(context, RightToLeft(LoginScreen()));
                // value.user  = null ;
              });
            },
            backgroundColor: AppColors.theme['primaryColor'],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.theme['secondaryColor'].withOpacity(0.2),
                    child: Center(
                      child: Text(
                        value.user!.name![0],
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.theme['fontColor']),
                      ),
                    ),
                  ),
                  title: Text(
                    value.user!.name!,
                    style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.theme['fontColor']),
                  ),
                  subtitle: Text(
                    value.user!.email!,
                    style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.theme['fontColor']),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Address",
                        style: TextStyle(
                          color: AppColors.theme['fontColor'],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField2(
                        initialText: value.user!.address!,
                        hintText: 'Update your address',
                        isNumber: false,
                        prefixicon: Icon(Icons.pin_drop_outlined),
                        obsecuretext: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Pincode",
                        style: TextStyle(
                          color: AppColors.theme['fontColor'],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField2(
                        initialText: value.user!.pincode!,
                        hintText: 'Update your pincode',
                        isNumber: false,
                        prefixicon: Icon(Icons.pin_drop_outlined),
                        obsecuretext: false,
                      ),
                      Text(
                        "Interest",
                        style: TextStyle(
                          color: AppColors.theme['fontColor'],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: mq.width * 0.61,
                            child: CustomTextField(
                              hintText: "Type interst",
                              isNumber: false,
                              prefixicon: Icon(Icons.interests_sharp),
                              obsecuretext: false,
                              controller: interestController,
                              onChange: (value) {
                                if (value!.isEmpty) {
                                  setState(() {
                                    suggestedInterests.clear();
                                  });
                                } else {
                                  suggestInterests(value);
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: mq.width * 0.02,
                          ),
                          InkWell(
                            onTap: () async {
                              String interest = interestController.text.trim();
                              if (interest.isNotEmpty) {
                                setState(() {
                                  value.user?.interest?.add(interest);
                                  interestController.clear();
                                });
                                dummyInterests.add(interest);
                                await InterestAPIs.addInterest(interest);
                              }
                            },
                            child: Container(
                              child: Center(
                                  child: Text(
                                "Add",
                                style: TextStyle(color: AppColors.theme['backgroundColor'], fontWeight: FontWeight.bold),
                              )),
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.theme['primaryColor']),
                            ),
                          ),
                        ],
                      ),
                      if (interestController.text.isNotEmpty)
                        Container(
                          height: 50,
                          child: ListView.builder(
                            itemCount: suggestedInterests.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(suggestedInterests[index]),
                                onTap: () {
                                  setState(() {
                                    value.user?.interest?.add(suggestedInterests[index]);
                                    interestController.clear();
                                    suggestedInterests.clear();
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      Wrap(
                        children: value.user!.interest!
                            .map(
                              (interest) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
                                child: Chip(
                                  backgroundColor: AppColors.theme['secondaryColor'],
                                  label: Text(interest),
                                  onDeleted: () {
                                    setState(() {
                                      value.user!.interest!.remove(interest);
                                    });
                                  },
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
