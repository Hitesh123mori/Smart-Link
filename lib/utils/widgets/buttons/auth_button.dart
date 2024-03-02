import 'package:flutter/material.dart';
import '../../../main.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String name;
  final Color bcolor;
  final Color tcolor ;
  const AuthButton({super.key, required this.onpressed, required this.name, required this.bcolor, required this.tcolor,});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return InkWell(
      onTap: onpressed,
      child: Container(
          height: 50,
          width:mq.width*1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:bcolor,
          ),
          child: Center(
            child: Text(name,style: TextStyle(
                color:tcolor,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),
          )
      ),
    );
  }
}
