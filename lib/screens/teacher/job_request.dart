import 'package:flutter/material.dart';
import 'package:ingenious_5/utils/colors.dart';

import '../../utils/widgets/job_request.dart';

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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.theme['primaryColor'],
          centerTitle: true,
          title: Text(
            "Job Requests",
            style: TextStyle(
                color: AppColors.theme['backgroundColor'],
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jobs",
                  style: TextStyle(
                      color: AppColors.theme['fontColor'],
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                SizedBox(height: 10,),
                JobRequest(name: 'Dholakiya School', salary: 'Salary : 45000/month',),
                SizedBox(height: 10,),
                JobRequest(name: 'Modi School', salary: 'Salary : 460000/month',),
                SizedBox(height: 10,),
                JobRequest(name: 'Nirma University', salary: 'Salary : 1000000/month',),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
