import 'package:flutter/material.dart';
import 'package:ingenious_5/transitions/left_right.dart';
import 'package:ingenious_5/utils/colors.dart';
import '../main.dart';
import '../utils/widgets/buttons/auth_button.dart';
import '../utils/widgets/text_field/custom_text_field.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(updateButtonState);
    _passController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled =
          _emailController.text.isNotEmpty && _passController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _emailController.removeListener(updateButtonState);
    _passController.removeListener(updateButtonState);
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  // validation of password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!value.contains(new RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    } else if (!value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  bool _isPasswordHidden = false;

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: _formKey,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: AppColors.theme['backgroundColor'],
            body: Stack(children: [
              Container(
                color: AppColors.theme['backgroundColor'],
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: mq.height * 0.1,
                      ),
                      Image.asset(
                        "assets/images/CampusQ.png",
                        height: 250,
                        width: 250,
                      ),
                      SizedBox(
                        height: mq.height * 0.003,
                      ),
                      Text(
                        "CampusQ",
                        style: TextStyle(
                            color: AppColors.theme['primaryTextColor'],
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: mq.height * 0.003,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: mq.height * 0.5,
                    width: mq.width * 1,
                    decoration: BoxDecoration(
                        color: AppColors.theme['primaryColor'],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        )),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: mq.height * 0.02,
                          ),
                          Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 25,
                                color: AppColors.theme['backgroundColor'],
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: mq.height * 0.02,
                          ),
                          Text(
                            "Welcome back! Please enter your details.",
                            style: TextStyle(
                                fontSize: 17,
                                color: AppColors.theme['backgroundColor'],
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: mq.height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTextField(
                              controller: _emailController,
                              hintText: 'Enter your email',
                              isNumber: false,
                              prefixicon: Icon(Icons.mail_outline_outlined),
                              obsecuretext: false,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTextField(
                              controller: _passController,
                              hintText: 'Enter your password',
                              isNumber: false,
                              prefixicon: Icon(Icons.password),
                              obsecuretext: _isPasswordHidden,
                              suffix: IconButton(
                                icon: Icon(
                                  _isPasswordHidden
                                      ? (Icons.visibility_off)
                                      : (Icons.visibility),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordHidden = !_isPasswordHidden;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: AuthButton(
                              onpressed: isButtonEnabled
                                  ? () {
                                      FocusScope.of(context).unfocus();

                                      //todo:enter your logic here
                                      //_passController,_emailController
                                      if (_formKey.currentState!.validate()) {}
                                    }
                                  : () {
                                      FocusScope.of(context).unfocus();
                                    },
                              name: 'Log In',
                              bcolor: isButtonEnabled
                                  ? AppColors.theme['fontColor']
                                  : AppColors.theme['secondaryColor']
                                      .withOpacity(0.4),
                              tcolor: isButtonEnabled
                                  ? AppColors.theme['backgroundColor']
                                  : AppColors.theme['fontColor']
                                      .withOpacity(0.5),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account ?",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: AppColors.theme['backgroundColor'],
                                    fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(context, LeftToRight(OtpScreen()));
                                  },
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: AppColors.theme['fontColor'],
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
