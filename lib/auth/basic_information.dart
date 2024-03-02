import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/colors.dart';
import '../utils/widgets/buttons/auth_button.dart';
import '../utils/widgets/text_field/custom_text_field.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo({Key? key});

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {


  String selectedOption = "Student";

  bool isStudent = true ;

  List<String> interests = [];

  List<String> dummyInterests = [
    "Mathematics",
    "Physics",
    "Biology",
    "Computer Science",
    "History",
    "Literature"
  ];

  List<String> suggestedInterests = [];

  TextEditingController interestController = TextEditingController();
  TextEditingController unicodeController = TextEditingController();

  void suggestInterests(String userInput) {
    suggestedInterests = dummyInterests
        .where((interest) =>
            interest.toLowerCase().contains(userInput.toLowerCase()))
        .toList();
    setState(() {});
  }

  TextEditingController _nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(updateButtonState);
    ;
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = _nameController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _nameController.removeListener(updateButtonState);

    super.dispose();
  }

  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }



  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
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
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                    title: Text('Student'),
                                    value: 'Student',
                                    activeColor: AppColors.theme['primaryColor'],
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value!;
                                        isStudent = true ;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                    title: Text('University'),
                                    value: 'University',
                                    activeColor: AppColors.theme['primaryColor'],
                                    groupValue: selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedOption = value!;
                                        isStudent = false;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              isStudent ? "Name" :"University Name",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomTextField(
                              hintText: isStudent ? 'Ex.Charles Babbage' : "xyz University",
                              isNumber: false,
                              prefixicon: isStudent ? Icon(Icons.person): Icon(Icons.warehouse_rounded),
                              controller: _nameController,
                              obsecuretext: false,
                              validator: _validateFullName,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              isStudent ? "Your interst" : "University Domains",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: CustomTextField(
                                    hintText: isStudent ? "Type interst" : "Enter Domain",
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
                                  width: mq.width*0.61,
                                ),
                                SizedBox(width: mq.width*0.02,),
                                InkWell(
                                    onTap: () {
                                      String interest =
                                      interestController.text.trim();
                                      if (interest.isNotEmpty) {
                                        print("doen");
                                        setState(() {
                                          interests.add(interest);
                                          interestController.clear();
                                        });
                                      }
                                    },
                                    child: Container(
                                      child: Center(
                                          child: Text(
                                            "Add",
                                            style: TextStyle(
                                                color: AppColors
                                                    .theme['backgroundColor'],
                                                fontWeight: FontWeight.bold),
                                          )),
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: AppColors.theme['primaryColor']),
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
                                          interests
                                              .add(suggestedInterests[index]);
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      child: Chip(
                                        backgroundColor:
                                            AppColors.theme['secondaryColor'],
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
                              height: 10,
                            ),

                            if(isStudent)
                            Text(
                              "University Code",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            if(isStudent)
                            SizedBox(
                              height: 10,
                            ),
                            if(isStudent)
                            CustomTextField(
                              hintText: 'Enter Unicode here',
                              isNumber: false,
                              prefixicon: Icon(Icons.person),
                              controller: unicodeController,
                              obsecuretext: false,
                              validator: _validateFullName,
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            AuthButton(
                              onpressed: isButtonEnabled
                                  ? () {
                                      FocusScope.of(context).unfocus();
                                      if (_formKey.currentState!.validate()) {
                                        //todo:handle register button
                                        //todo: for accesing name user _nameController
                                        //todo for accesing  interst lisst use "interests";

                                        print(interests);
                                      }
                                    }
                                  : () {
                                      FocusScope.of(context).unfocus();
                                    },
                              name: 'Register',
                              bcolor: isButtonEnabled
                                  ? AppColors.theme['fontColor']
                                  : AppColors.theme['secondaryColor']
                                      .withOpacity(0.4),
                              tcolor: isButtonEnabled
                                  ? AppColors.theme['backgroundColor']
                                  : AppColors.theme['fontColor']
                                      .withOpacity(0.5),
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
  }
}
