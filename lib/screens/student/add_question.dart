import 'package:flutter/material.dart';
import 'package:ingenious_5/utils/colors.dart';

import '../../utils/widgets/text_field/question_field.dart';

class AddQuesion extends StatefulWidget {
  const AddQuesion({super.key});

  @override
  State<AddQuesion> createState() => _AddQuesionState();
}

class _AddQuesionState extends State<AddQuesion> {


  TextEditingController _questionController = TextEditingController() ;

  bool isButtonEnabled = false;


  @override
  void initState() {
    super.initState();
    _questionController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = _questionController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _questionController.removeListener(updateButtonState);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColors.theme['backgroundColor'],
          appBar: AppBar(
            actions: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 40,
                  width: 100,
                  child: Center(
                      child: Text(
                        "Post",
                        style: TextStyle(
                          color: isButtonEnabled
                              ? AppColors.theme['backgroundColor']
                              : AppColors.theme['primaryColor'],
                        ),
                      )),
                  decoration: BoxDecoration(
                    color: isButtonEnabled
                        ? AppColors.theme['fontColor'].withOpacity(0.9)
                        : AppColors.theme['fontColor'],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )

            ],
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left_outlined,
                size: 32,
                color: AppColors.theme['backgroundColor'],
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            backgroundColor: AppColors.theme['primaryColor'],
            title: Text(
              "Ask Question",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.theme['backgroundColor'],
                  fontSize: 20),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Question",
                    style: TextStyle(
                      color: AppColors.theme['fontColor'],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20,),
                  QuestionField(controller: _questionController,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
