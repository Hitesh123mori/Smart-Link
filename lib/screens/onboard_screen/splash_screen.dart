import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ingenious_5/transitions/left_right.dart';
import '../../main.dart';
import '../../utils/colors.dart';
import '../auth/login_screen.dart';




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

      //     if(Api.auth != null){
      //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen())) ;
      // }else{
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;
      // }


      ));

      // Navigator.pushReplacement(context, RightToLeft(OnboardingScreen()));
      Navigator.pushReplacement(context, LeftToRight(LoginScreen()));
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
                  Image.asset(
                    "assets/images/CampusQ.png",
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mq.width * 0.2),
                    child: Text(
                      "CampusQ",
                      style: TextStyle(
                          color: AppColors.theme['fontColor'],
                          fontSize:25,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mq.width * 0.2),
                    child: Text(
                      "Doubt no more!",
                      style: TextStyle(
                          color: AppColors.theme['primaryColor'],
                          fontSize: 25,fontWeight:FontWeight.bold),
                    ),
                  )
                ]),
          )),
    );
  }
}