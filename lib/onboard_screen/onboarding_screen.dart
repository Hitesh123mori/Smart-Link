import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../utils/colors.dart';
import '../auth/login_screen.dart';

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
        backgroundColor: AppColors.theme['backgroundColor'],
        body: SafeArea(
          child: IntroductionScreen(
            dotsDecorator: DotsDecorator(
              activeColor: AppColors.theme["fontColor"],
              size: Size(10.0, 10.0),
              activeSize: Size(12.0, 12.0),
              spacing: EdgeInsets.all(5.0),
            ),
            showNextButton: true,
            showSkipButton: true,
            skip: Text(
              "skip",
              style: TextStyle(
                color: AppColors.theme["fontColor"],
              ),
            ),
            next: Text(
              "Next",
              style: TextStyle(
                color: AppColors.theme["fontColor"],
              ),
            ),
            showDoneButton: true,
            done: Text(
              "Done",
              style: TextStyle(
                color: AppColors.theme["fontColor"],
              ),
            ),
            globalBackgroundColor: AppColors.theme["backgroundColor"],
            freeze: false,
            animationDuration: 10,
            onSkip: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
            onDone: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
            pages: [
              PageViewModel(
                bodyWidget: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: CircleAvatar(
                            radius: 150,
                            backgroundColor: AppColors.theme['secondaryColor']
                                .withOpacity(0.2),
                            child: Image.asset("assets/images/ask.png")),
                      ),
                      SizedBox(height: 60,),
                      Text("Ask: Fuel Curiosity",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Explore, ask questions, and let",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "your querie lead to discovery.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                title: "",
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
    );
  }
}
