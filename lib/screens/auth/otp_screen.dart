import 'package:flutter/material.dart';

import 'package:ingenious_5/screens/auth/set_password.dart';
import 'package:ingenious_5/transitions/left_right.dart';
import 'package:pinput/pinput.dart';
import '../../transitions/right_left.dart';
import '../../utils/colors.dart';
import '../../utils/widgets/buttons/auth_button.dart';
import '../../utils/widgets/text_field/custom_text_field.dart';
import 'login_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isButtonEnabled = false;
  bool enablePinput = false;
  bool isButtonClicked = false;
  bool isPinFilled = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(updateButtonState);

    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.theme['secondaryColor']!),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.theme['primaryColor']),
      borderRadius: BorderRadius.circular(10),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration:
      defaultPinTheme.decoration?.copyWith(color: Colors.transparent),
    );
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = _emailController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _emailController.removeListener(updateButtonState);
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  late final PinTheme defaultPinTheme;
  late final PinTheme focusedPinTheme;
  late final PinTheme submittedPinTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColors.theme['backgroundColor']!,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      SizedBox(height: 60,),
                      Center(
                        child: Container(
                          child: Image.asset(
                              "assets/images/verify_email.png"),
                          height: 250,
                          width: 250,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Verify your email",
                              style: TextStyle(
                                color: AppColors.theme['fontColor'],
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.theme['fontColor']
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomTextField(
                              hintText: 'Enter your email',
                              isNumber: false,
                              prefixicon: Icon(Icons.email),
                              controller: _emailController,
                              obsecuretext: false,
                              validator: _validateEmail,
                              onChange: (_) {
                                setState(() {
                                  enablePinput = false;
                                  isButtonClicked = false;
                                });
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            if (isButtonClicked &&
                                isButtonEnabled &&
                                enablePinput)
                              Text(
                                "Please check your email. We have sent you an OTP to ${_emailController.text}.",
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                              ),
                            if (isButtonClicked &&
                                isButtonEnabled &&
                                enablePinput)
                              SizedBox(
                                height: 20,
                              ),
                            if (isButtonClicked &&
                                isButtonEnabled &&
                                enablePinput)
                              Pinput(
                                length: 6,
                                defaultPinTheme: defaultPinTheme,
                                focusedPinTheme: focusedPinTheme,
                                submittedPinTheme: submittedPinTheme,
                                showCursor: false,
                                onChanged: (_) {
                                  setState(() {
                                    isPinFilled = false;
                                    updateButtonState();
                                  });
                                },
                                onCompleted: (pin) {
                                  setState(() {
                                    isPinFilled = true;
                                    updateButtonState();
                                  });
                                  print(pin);
                                },
                              ),
                            SizedBox(
                              height: 20,
                            ),
                            (isButtonClicked && isButtonEnabled && enablePinput)
                                ? AuthButton(
                              onpressed: () {
                                if (isPinFilled) {
                                  // todo : enter here verify option here
                                  Navigator.pushReplacement(context, LeftToRight(SetPassword()));

                                }
                              },
                              name: 'Verify',
                              bcolor: isPinFilled
                                  ? AppColors.theme['fontColor']
                                  : AppColors.theme['secondaryColor']
                                  .withOpacity(0.4),
                              tcolor: isPinFilled
                                  ? AppColors.theme['backgroundColor']
                                  : AppColors.theme['fontColor']
                                  .withOpacity(0.5),
                            )
                                : AuthButton(
                              onpressed: () {
                                if (isButtonEnabled) {
                                  FocusScope.of(context).unfocus();
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      isButtonClicked = true;
                                      enablePinput = true;
                                    });



                                    //todo : enter get otp logic here
                                  }
                                }
                              },
                              name: 'Get OTP',
                              bcolor: isButtonEnabled
                                  ? AppColors.theme['fontColor']
                                  : AppColors.theme['secondaryColor']
                                  .withOpacity(0.4),
                              tcolor: isButtonEnabled
                                  ? AppColors.theme['backgroundColor']
                                  : AppColors.theme['fontColor']
                                  .withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                      if (isButtonClicked && isButtonEnabled && enablePinput)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {

                                  //todo:enter here resend otp logic


                                },
                                child: Text(
                                  "Resend OTP",
                                  style: TextStyle(
                                    color: AppColors.theme['primaryColor']!,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account ?",
                              style: TextStyle(
                                color: AppColors.theme['fontColor']!,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  RightToLeft(LoginScreen()),
                                );
                              },
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                  color: AppColors.theme['primaryColor']!,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
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
