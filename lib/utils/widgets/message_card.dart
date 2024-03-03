import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ingenious_5/models/user_model/AppUser.dart';
import 'package:ingenious_5/utils/helper_functions/date_formate.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Widget _ReceiveMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 130),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 12, left: 16),
                  margin: EdgeInsets.symmetric(
                      horizontal: mq.width * 0.03, vertical: mq.height * 0.004),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: AppColors.theme['secondaryColor'],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:20,left: 10.0, right: 10),
                        child: Text(
                          widget.msg.msg,
                          style: TextStyle(
                              color: AppColors.theme['fontColor'],
                              fontSize: 16),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              MyDateUtil.getFormattedTime(
                                  context: context, time: widget.msg.time),
                              style: TextStyle(
                                  color: AppColors.theme['secondaryTextColor'],
                                  fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top:10, // Adjust this value as per your design
                  left:10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Center(
                      child: Text(
                        widget.user.name!,
                        style: TextStyle(
                            color: AppColors.theme['fontColor'],
                            fontSize: 14,fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _SentMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 100.0),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 12, left: 16),
                  margin: EdgeInsets.symmetric(
                      horizontal: mq.width * 0.03, vertical: mq.height * 0.004),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: AppColors.theme['primaryColor'].withOpacity(0.5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10,top: 30),
                        child: buildContent(widget.msg.msg),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end, // Adjusted for the like button
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              MyDateUtil.getFormattedTime(
                                  context: context, time: widget.msg.time),
                              style: TextStyle(
                                  color: AppColors.theme['secondaryTextColor'],
                                  fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top:10,
                  right:10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10,bottom: 10),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          widget.user.name!,
                          style: TextStyle(
                              color: AppColors.theme['fontColor'],
                              fontSize: 14,fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }



  Widget buildContent(String content) {
    List<InlineSpan> children = [];

    RegExp regex = RegExp(r'https?://\S+');
    Iterable<RegExpMatch> matches = regex.allMatches(content);

    int currentIndex = 0;

    for (RegExpMatch match in matches) {
      String url = match.group(0)!;
      int start = match.start;
      int end = match.end;

      children.add(TextSpan(text: content.substring(currentIndex, start)));

      children.add(
        TextSpan(
          text: url,
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launchUrl(Uri.parse(url));
            },
        ),
      );

      currentIndex = end;
    }

    // Add the remaining non-link text
    children.add(TextSpan(text: content.substring(currentIndex), style: TextStyle(color: Colors.black)));

    return RichText(
        text: TextSpan(
          children: children,
          style: TextStyle(color: Colors.black, fontSize: 15,), // Default text style
        ));
  }

}

