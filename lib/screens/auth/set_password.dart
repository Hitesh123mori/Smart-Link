import 'package:flutter/material.dart';
import 'package:ingenious_5/apis/FirebaseAuthentication/AppFirebaseAuth.dart';
import 'package:ingenious_5/transitions/left_right.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';
import '../../utils/widgets/buttons/auth_button.dart';
import '../../utils/widgets/text_field/custom_text_field.dart';
import 'basic_information.dart';

class SetPassword extends StatefulWidget {
  final String email;
  const SetPassword({required this.email, Key? key}) : super(key: key);

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {

  // textfields controllers
  TextEditingController _passController = TextEditingController();
  TextEditingController _confirmPassController = TextEditingController();
  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _passController.addListener(updateButtonState);
    _confirmPassController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled =
          _passController.text.isNotEmpty && _confirmPassController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _confirmPassController.removeListener(updateButtonState);
    _passController.removeListener(updateButtonState);
    super.dispose();
  }


  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, value, child){
      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: AppColors.theme['secondaryBgColor'],
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: [
                        SizedBox(height: 60,),
                        Center(
                          child: Container(
                            child: Image.asset("assets/images/set_password.png"),
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
                                "Set your password",
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
                                "Password",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.theme['fontColor']),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CustomTextField(
                                hintText: 'Enter your password',
                                isNumber: false,
                                prefixicon: Icon(Icons.lock),
                                controller: _passController,
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
                                validator: _validatePassword,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Confirm Password",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.theme['fontColor']),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CustomTextField(
                                hintText: 'Re-enter your password',
                                isNumber: false,
                                prefixicon: Icon(Icons.lock),
                                controller: _confirmPassController,
                                obsecuretext: _isConfirmPasswordHidden,
                                suffix: IconButton(
                                  icon: Icon(
                                    _isConfirmPasswordHidden
                                        ? (Icons.visibility_off)
                                        : (Icons.visibility),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isConfirmPasswordHidden =
                                      !_isConfirmPasswordHidden;
                                    });
                                  },
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your password';
                                  } else if (value != _passController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              AuthButton(
                                onpressed: isButtonEnabled
                                    ? () async {
                                  FocusScope.of(context).unfocus();
                                  if (_formKey.currentState!.validate()) {

                                    //todo:enter set password line
                                    final res = await AppFirebaseAuth.signUp(widget.email, _passController.text);

                                    print("#res registration: $res");
                                    if(res == "Registered") {
                                      Navigator.pushReplacement(context, LeftToRight(BasicInfo()));
                                    }

                                  }
                                }
                                    : () {
                                  FocusScope.of(context).unfocus();
                                },
                                name: 'Set Password',
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