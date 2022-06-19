import 'package:flutter/material.dart';

class ChatMessageTile extends StatelessWidget {
  const ChatMessageTile(
      {required this.message, required this.sendbyMe, Key? key})
      : super(key: key);

  final String message;
  final bool sendbyMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          sendbyMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomRight:
                      sendbyMe ? Radius.circular(0) : Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft:
                      sendbyMe ? Radius.circular(24) : Radius.circular(0),
                ),
                color: sendbyMe ? Colors.blue : Color(0xfff1f0f0),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              )),
        ),
      ],
    );
  }
}
