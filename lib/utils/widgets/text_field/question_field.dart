import 'package:flutter/material.dart';
import 'package:ingenious_5/utils/colors.dart';

class QuestionField extends StatefulWidget {
  final TextEditingController controller;
  const QuestionField({super.key, required this.controller});

  @override
  State<QuestionField> createState() => _QuestionFieldState();
}

class _QuestionFieldState extends State<QuestionField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              border: Border(
                left: BorderSide(width: 2, color: Colors.black),
                right: BorderSide(width: 2, color: Colors.black),
                top: BorderSide(width: 2, color: Colors.black),
              ),
              color: AppColors.theme['primaryColor'],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.image_outlined,
                      color: AppColors.theme['fontColor'],
                    )),
              ],
            )),
        Container(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            border: Border(
              left: BorderSide(width: 2, color: Colors.black),
              right: BorderSide(width: 2, color: Colors.black),
              bottom: BorderSide(width: 2, color: Colors.black),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              controller: widget.controller,
              cursorColor: AppColors.theme['primaryColor'],
              maxLines: null,
              decoration: InputDecoration(
                  hintText: 'Start writing your question here',
                  border: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }
}
