import 'package:flutter/material.dart';
import 'package:ingenious_5/models/user_model/AppUser.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../models/message_model.dart';
import '../../providers/CurrentUser.dart';


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
    return Consumer<AppUserProvider>(builder: (context, value, child){

      return InkWell(
        child: (value.user!.userId == widget.msg.fromId)? _SentMessage() : _ReceiveMessage(),
      );

    });
  }

  // recieve message ui card

  Widget _ReceiveMessage() {
    return Row(
      children: [
        Flexible(
          child: Container(
            child: Text(widget.msg.msg),
          ),
        ),
      ],
    );
  }

  Widget _SentMessage() {
    return Row(
      children: [
        Flexible(
          child: Container(child: Text(widget.msg.msg),),
        ),
      ],
    );
  }
}
