import 'package:flutter/material.dart' ;


class AddQuesion extends StatefulWidget {
  const AddQuesion({super.key});

  @override
  State<AddQuesion> createState() => _AddQuesionState();
}

class _AddQuesionState extends State<AddQuesion> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Add Question"),
        ),
      ),
    );
  }
}
