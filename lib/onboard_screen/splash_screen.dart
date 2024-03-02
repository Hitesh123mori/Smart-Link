import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import '../transitions/right_left.dart';
import '../utils/colors.dart';
import 'onboarding_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
      ));

      Navigator.pushReplacement(context, RightToLeft(OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: AppColors.theme['backgroundColor'],
          body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   "assets/images/csi_logo.png",
                  //   height: 200,
                  //   width: 200,
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mq.width * 0.2),
                    child: Text(
                      "Nirma University",
                      style: TextStyle(
                          color: AppColors.theme['secondaryColor'],
                          fontSize:25),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mq.width * 0.2),
                    child: Text(
                      "Student Chapter",
                      style: TextStyle(
                          color: AppColors.theme['secondaryColor'],
                          fontSize: 25),
                    ),
                  )
                ]),
          )),
    );
  }
}