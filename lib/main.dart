import 'package:flutter/material.dart' ;
import 'package:ingenious_5/onboard_screen/splash_screen.dart';


late Size mq ;

void  main(){
   runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
      home: SplashScreen(),
    );
  }
}
