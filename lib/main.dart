import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' ;
import 'package:ingenious_5/screens/onboard_screen/splash_screen.dart';

import 'firebase_options.dart';


late Size mq ;

void  main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
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
