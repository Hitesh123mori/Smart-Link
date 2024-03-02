import 'package:flutter/material.dart' ;
import 'package:introduction_screen/introduction_screen.dart';

import '../../utils/colors.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _IntroState();
}

class _IntroState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.theme['secondaryBgColor'],
        body: SafeArea(
          child: IntroductionScreen(
            dotsDecorator: DotsDecorator(
              activeColor: AppColors.theme["primaryColor"],
              size: Size(10.0, 10.0),
              activeSize: Size(12.0, 12.0),
              spacing: EdgeInsets.all(5.0),
            ),
            showNextButton: true,
            showSkipButton: true,
            skip: Text("skip",style: TextStyle(color: AppColors.theme["primaryColor"],),),
            next: Text("Next",style: TextStyle(color: AppColors.theme["primaryColor"],),),
            showDoneButton: true,
            done: Text("Done",style: TextStyle(color: AppColors.theme["primaryColor"],),),
            globalBackgroundColor:  AppColors.theme["secondaryColor"],
            freeze: false,
            animationDuration: 10,
            // onSkip: (){
            //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen(),)) ;
            // },
            // onDone: (){
            //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen(),) ) ;
            // },
            pages: [
              PageViewModel(
                title: "Screen 1",
                // image: Transform.scale(scale:2,child: Image.asset('')),
                body: "Introduction Screen 1",
                footer: Container(color: Colors.white,height: 600,width: 200,),
              ),
              PageViewModel(
                title: "Screen 2",
                // image: Transform.scale(scale:2,child: Image.asset('')),
                body: "Introduction Screen 2",
                // footer: Container(color: Colors.white,height: 600,width: 200,),
              ),
              PageViewModel(
                title: "Screen 3",
                // image: Transform.scale(scale:2,child: Image.asset('')),
                body: "Introduction Screen 3",
                // footer: Container(color: Colors.white,height: 600,width: 200,),
              ),
              PageViewModel(
                title: "Screen 4",
                // image: Transform.scale(scale:2,child: Image.asset('')),
                body: "Introduction Screen 4",
                // footer: Container(color: Colors.white,height: 600,width: 200,),
              ),
            ],

          ),
        ),
      ),

    ) ;

  }
}