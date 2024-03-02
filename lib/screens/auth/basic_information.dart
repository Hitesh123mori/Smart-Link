import 'package:flutter/material.dart';
import 'package:ingenious_5/apis/FireStoreAPIs/InterestAPIs.dart';
import 'package:ingenious_5/apis/FireStoreAPIs/UserProfileAPI.dart';
import 'package:ingenious_5/apis/FirebaseAuthentication/AppFirebaseAuth.dart';
import 'package:ingenious_5/providers/CurrentUser.dart';
import 'package:ingenious_5/screens/Institute/home_tab_institute.dart';
import 'package:ingenious_5/transitions/left_right.dart';
import 'package:ingenious_5/utils/helper_functions/HelperFunction.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../utils/colors.dart';
import '../../utils/widgets/buttons/auth_button.dart';
import '../../utils/widgets/text_field/custom_text_field.dart';
import '../student/home_tabs_student.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo({Key? key});

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  String selectedOption = "Student";

  bool isStudent = true;
  bool isTeacher = false;
  bool isInstitute = false;

  // all three user common fields
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addContoller = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();

  // student  and teacher common fields
  TextEditingController interestController = TextEditingController();
  List<String> interests = [];
  List<String> dummyInterests = [];
  List<String> suggestedInterests = [];

  void suggestInterests(String userInput) {
    suggestedInterests = dummyInterests.where((interest) => interest.toLowerCase().contains(userInput.toLowerCase())).toList();
    setState(() {});
  }

  // form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //button disable
  bool isButtonEnabled = false;
  bool isLoading = false;

  Future getInterest() async {
    dummyInterests = await InterestAPIs.getInterests();
  }


  @override
  void initState() {
    super.initState();
    _nameController.addListener(updateButtonState);
    _addContoller.addListener(updateButtonState);
    _pincodeController.addListener(updateButtonState);
    getInterest();
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = _nameController.text.isNotEmpty && _addContoller.text.isNotEmpty && _pincodeController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _nameController.removeListener(updateButtonState);
    _addContoller.removeListener(updateButtonState);
    _pincodeController.removeListener(updateButtonState);
    super.dispose();
  }

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter details';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Consumer<AppUserProvider>(builder: (context, value, child) {
      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: AppColors.theme['backgroundColor'],
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your information",
                                style: TextStyle(
                                  color: AppColors.theme['fontColor'],
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  RadioListTile(
                                    title: Text('Student'),
                                    value: 'Student',
                                    activeColor: AppColors.theme['primaryColor'],
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value!;
                                        isStudent = true;
                                        isInstitute = false;
                                        isTeacher = false;
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    title: Text('Teacher/tutor'),
                                    value: 'Teacher/tutor',
                                    activeColor: AppColors.theme['primaryColor'],
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value!;
                                        isTeacher = true;
                                        isInstitute = false;
                                        isStudent = false;
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    title: Text('Institute'),
                                    value: 'Institute',
                                    activeColor: AppColors.theme['primaryColor'],
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value!;
                                        isInstitute = true;
                                        isStudent = false;
                                        isTeacher = false;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Name",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CustomTextField(
                                hintText: 'Enter your name',
                                isNumber: false,
                                prefixicon: Icon(Icons.person),
                                controller: _nameController,
                                obsecuretext: false,
                                validator: _validate,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Your interst",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
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
                                    height: 60,
                                    width: mq.width * 0.61,
                                  ),
                                  SizedBox(
                                    width: mq.width * 0.02,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      String interest = interestController.text.trim();
                                      if (interest.isNotEmpty) {
                                        setState(() {
                                          interests.add(interest);
                                          interestController.clear();
                                        });
                                      }

                                      await InterestAPIs.addInterest(interest);

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
                                        onTap: () async {
                                          setState(() {
                                            interests.add(suggestedInterests[index]);
                                            interestController.clear();
                                            suggestedInterests.clear();
                                          });
                                        },
                                      );
                                    },
                                  ),
                                ),
                              Wrap(
                                children: interests
                                    .map(
                                      (interest) => Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                        child: Chip(
                                          backgroundColor: AppColors.theme['secondaryColor'],
                                          label: Text(interest),
                                          onDeleted: () {
                                            setState(() {
                                              interests.remove(interest);
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Address",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CustomTextField(
                                hintText: 'Enter address here',
                                isNumber: false,
                                prefixicon: Icon(Icons.pin_drop),
                                controller: _addContoller,
                                obsecuretext: false,
                                validator: _validate,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Pincode",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CustomTextField(
                                hintText: 'Enter your area pincode',
                                isNumber: false,
                                prefixicon: Icon(Icons.pin_drop),
                                controller: _pincodeController,
                                obsecuretext: false,
                                validator: _validate,
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              //todo:work here
                              isLoading
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.theme["fontColor"],
                                      ),
                                    )
                                  : AuthButton(
                                      onpressed: isButtonEnabled
                                          ? () async {
                                              FocusScope.of(context).unfocus();
                                              if (_formKey.currentState!.validate()) {
                                                setState(() {
                                                  isLoading = true;
                                                });

                                                print("#insterest: $interests");
                                                var type;
                                                if (isStudent)
                                                  type = "S";
                                                else if (isInstitute)
                                                  type = "I";
                                                else
                                                  type = "T";
                                                final res = UserProfile.signupUser(
                                                    name: _nameController.text,
                                                    interest: interests,
                                                    type: type,
                                                    pincode: _pincodeController.text,
                                                    address: _addContoller.text);

                                                res.then((val) {
                                                  print("#res-base_info: $val");
                                                  // todo if (res == 'ok') push to home screen
                                                  if (val == "ok") {
                                                    value.initUser();
                                                    if (isStudent) Navigator.pushReplacement(context, LeftToRight(HomeTabsStudents()));
                                                    if (isInstitute) Navigator.pushReplacement(context, LeftToRight(HomeTabsInstitute()));
                                                  }
                                                  HelperFunction.showToast(val=='ok'? 'Registered': val);
                                                  return null;
                                                }).onError((error, stackTrace) {
                                                  print("res-regitration: $error, $selectedOption");
                                                  return null;
                                                });
                                              }

                                              setState(() {
                                                isLoading = false;
                                              });
                                            }
                                          : () {
                                              FocusScope.of(context).unfocus();
                                            },
                                      name: 'Register',
                                      bcolor: isButtonEnabled ? AppColors.theme['fontColor'] : AppColors.theme['secondaryColor'].withOpacity(0.4),
                                      tcolor: isButtonEnabled ? AppColors.theme['backgroundColor'] : AppColors.theme['fontColor'].withOpacity(0.5),
                                    ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
