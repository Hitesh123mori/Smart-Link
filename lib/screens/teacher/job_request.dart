import 'package:flutter/material.dart' ;
import 'package:ingenious_5/utils/colors.dart';


class JobRequests extends StatefulWidget {
  const JobRequests({super.key});

  @override
  State<JobRequests> createState() => _JobRequestsState();
}

class _JobRequestsState extends State<JobRequests> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.theme['primaryColor'],
        ),
      ),
    );
  }
}
