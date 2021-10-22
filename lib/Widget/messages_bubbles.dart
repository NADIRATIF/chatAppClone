import 'package:chat_clone/constants.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    required this.data,
    required this.isMe,
  }) : super(key: key);

  final Map<String, dynamic> data;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingX10,
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Material(
            borderRadius: BorderRadius.only(
              topRight: kRadius,
              topLeft: kRadius,
              bottomLeft: isMe ? kRadius : Radius.zero,
              bottomRight: isMe ? Radius.zero : kRadius,
            ),
            elevation: 2.5,
            color: isMe ? Colors.lightBlue : Colors.blueAccent,
            child: Padding(
              padding: kPaddingSymmetric,
              child: Text(
                data['messageText'],
                style: kTextStyle3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
