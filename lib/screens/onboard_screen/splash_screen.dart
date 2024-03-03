import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ingenious_5/apis/FirebaseAPIs.dart';
import 'package:ingenious_5/screens/Institute/home_tab_institute.dart';
import 'package:ingenious_5/screens/student/home_tabs_student.dart';
import 'package:ingenious_5/screens/teacher/home_tabs_teachers.dart';
import 'package:ingenious_5/transitions/left_right.dart';
import '../../apis/FireStoreAPIs/UserProfileAPI.dart';
import '../../main.dart';
import '../../models/user_model/AppUser.dart';
import '../../utils/colors.dart';
import '../auth/login_screen.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future initUser() async {
    String? uid = FirebaseAPIs.auth.currentUser?.uid;
    print("#authId: $uid");
    if(uid != null){
      var user = AppUser.fromJson(await UserProfile.getUser(uid));

      if (user.type == 'S') Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeTabsStudents())) ;
      if (user.type == 'I') Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeTabsInstitute())) ;
      if (user.type == 'T') Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeTabsTeachers())) ;

    }
    print("#initUser complete");
  }


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
      if(FirebaseAPIs.auth.currentUser != null){

        initUser();
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())) ;
      }

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
                    "assets/images/SL (1).png",
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mq.width * 0.2),
                    child: Text(
                      "SmartLink",
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
