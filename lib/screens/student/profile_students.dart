import 'package:flutter/material.dart';
import 'package:ingenious_5/providers/CurrentUser.dart';
import 'package:ingenious_5/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../utils/widgets/text_field/custom_text_field2.dart';

class ProfileStudent extends StatefulWidget {
  const ProfileStudent({super.key});

  @override
  State<ProfileStudent> createState() => _ProfileStudentState();
}

class _ProfileStudentState extends State<ProfileStudent> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.theme['backgroundColor'],
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Your Profile",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.theme['backgroundColor'],
                fontSize: 20),
          ),
          backgroundColor: AppColors.theme['primaryColor'],
        ),
        body: Consumer<AppUserProvider>(builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    child: Center(
                      child: Text(
                        value.user!.name![0],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.theme['fontColor']),
                      ),
                    ),
                    backgroundColor:
                        AppColors.theme['secondaryColor'].withOpacity(0.2),
                  ),
                  title: Text(
                    value.user!.name!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.theme['fontColor']),
                  ),
                  subtitle: Text(
                    value.user!.email!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.theme['fontColor']),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Address",
                        style: TextStyle(
                          color: AppColors.theme['fontColor'],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField2(
                        initialText: value.user!.address!,
                        hintText: 'Update your address',
                        isNumber: false,
                        prefixicon: Icon(Icons.pin_drop_outlined),
                        obsecuretext: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Pincode",
                        style: TextStyle(
                          color: AppColors.theme['fontColor'],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField2(
                        initialText: value.user!.pincode!,
                        hintText: 'Update your pincode',
                        isNumber: false,
                        prefixicon: Icon(Icons.pin_drop_outlined),
                        obsecuretext: false,
                      ),
                      Text(
                        "Interest",
                        style: TextStyle(
                          color: AppColors.theme['fontColor'],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: value.user!.interest!
                            .map(
                              (interest) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3.0,vertical: 3),
                            child: Chip(
                              backgroundColor:
                              AppColors.theme['secondaryColor'],
                              label: Text(interest),
                              onDeleted: () {
                                setState(() {
                                  value.user!.interest!.remove(interest);
                                });
                              },
                            ),
                          ),
                        )
                            .toList(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
