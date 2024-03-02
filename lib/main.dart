import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' ;
import 'package:ingenious_5/firebase_options.dart';

import 'apis/FirebaseDatabaseAPIs/QuestionAPIs.dart';


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
    print("start");
    QuestionAPIs.getQuestions(filterBy: "userType", filterVal: "P");
    return const Placeholder();
  }
}
