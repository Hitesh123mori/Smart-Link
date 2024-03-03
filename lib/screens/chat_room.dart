
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ingenious_5/models/question_model/Question.dart';
import 'package:ingenious_5/models/user_model/AppUser.dart';

import '../main.dart';
import '../models/message_model.dart';
import '../utils/colors.dart';

class ChatRoom extends StatefulWidget {
  final Question question;
  final AppUser user ;
  const ChatRoom({super.key, required this.question, required this.user});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  double _textFieldMaxHeight = 130.0;
  FocusNode _messageFocusNode = FocusNode();
  bool _isMessageTextFieldFocused = false;
  final _textController = TextEditingController();
  bool _showEmoji = false;
  bool _isUploading = false ;



  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 60),
              child: Container(
                width: mq.width * 1,
                height: 170,
                decoration: BoxDecoration(
                  color: AppColors.theme['secondaryColor'].withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            widget.question.userName![0],
                            style:
                                TextStyle(color: AppColors.theme['fontColor']),
                          ),
                          backgroundColor: AppColors.theme['secondaryColor']
                              .withOpacity(0.5),
                        ),
                        title: Text(
                          widget.question.userName!,
                          style: TextStyle(
                            color: AppColors.theme['fontColor'],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          widget.question.text!,
                          style: TextStyle(
                            color: AppColors.theme['fontColor'],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Text(
                              widget.question.answer!.length.toString() +
                                  " Answers",
                              style: TextStyle(
                                color: AppColors.theme['fontColor'],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Text(
                              widget.question.createTime!,
                              style: TextStyle(
                                color: AppColors.theme['fontColor'],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            buildChatInput(),
            Column(
              children: [


              ],
            )
          ],
        ),
      ),
    );
  }



  Widget buildChatInput() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mq.width * 0.01,
        vertical: mq.height * 0.01,
      ),
      child: Row(
        children: [
          Expanded(
            child: Card(
              color: AppColors.theme['secondaryColor'].withOpacity(0.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: mq.width * 0.03),
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(maxHeight: _textFieldMaxHeight),
                      child: SingleChildScrollView(
                        child: TextField(
                          controller: _textController,
                          focusNode: _messageFocusNode,
                          onChanged: (text) {
                            setState(() {
                              _isMessageTextFieldFocused = _messageFocusNode.hasFocus;
                            });
                          },
                          onTap: () {
                            setState(() {
                              _isMessageTextFieldFocused = _messageFocusNode.hasFocus;
                            });
                            if(_showEmoji)setState(() {
                              _showEmoji =!_showEmoji ;
                            });
                          },
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          cursorColor:AppColors.theme['fontColor'].withOpacity(0.9),
                          style: TextStyle(
                            color: AppColors.theme['primaryTextColor'],
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type Message...",
                            hintStyle: TextStyle(
                              color: AppColors.theme['fontColor'],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (!_isMessageTextFieldFocused)
                    IconButton(
                      onPressed: () async{


                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: AppColors.theme['iconColor'],
                      ),
                    ),
                  if (!_isMessageTextFieldFocused)
                    IconButton(
                      onPressed: () async {

                      },
                      icon: Icon(
                        Icons.image,
                        color: AppColors.theme['iconColor'],
                      ),
                    ),
                  SizedBox(width: mq.width * 0.03),
                ],
              ),
            ),
          ),
          MaterialButton(
            minWidth: 0,
            shape: CircleBorder(),
            onPressed: () {

              //todo: send button

            },
            color: AppColors.theme['primaryColor'],
            child: Icon(Icons.send),
            padding: EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }


}
