import 'package:flutter/material.dart';
import 'package:ingenious_5/models/user_model/AppUser.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../models/message_model.dart';
import '../../providers/CurrentUser.dart';
import '../colors.dart';

class MessageCard extends StatefulWidget {
  final DoubtMessage msg;
  final AppUser user;

  const MessageCard({
    super.key,
    required this.msg,
    required this.user,
  });

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Consumer<AppUserProvider>(builder: (context, value, child) {
      return InkWell(
        child: (value.user!.userId == widget.msg.fromId)
            ? _SentMessage()
            : _ReceiveMessage(),
      );
    });
  }

  // recieve message ui card

  Widget _ReceiveMessage() {
    return Padding(
      padding: const EdgeInsets.only(right: 150.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20).copyWith(
                        topLeft: Radius.circular(0)
                    ),
                    // border: Border.all(color: AppColors.theme['fontColor']),
                    color: AppColors.theme['secondaryColor'],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                    child: Text(
                      widget.msg.msg,
                      style: TextStyle(
                          color: AppColors.theme['backgroundColor'],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _SentMessage() {
    return Padding(
      padding: const EdgeInsets.only(left: 150.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0,),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20).copyWith(
                      topRight: Radius.circular(0)
                    ),
                    // border: Border.all(color: AppColors.theme['fontColor']),
                    color: AppColors.theme['primaryColor'],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                    child: Text(
                        widget.msg.msg,
                      style: TextStyle(
                          color: AppColors.theme['backgroundColor'],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
