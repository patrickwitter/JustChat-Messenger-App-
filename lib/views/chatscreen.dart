import 'package:flutter/material.dart';
import 'package:messengerapp/viewmodel/chatscreen_viewmodel.dart';
import 'package:messengerapp/views/baseviewinit.dart';
import 'package:messengerapp/views/chatmessages.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    required this.otherUsername,
    required this.name,
    required this.chatRoomId,
    Key? key,
  }) : super(key: key);

  final String otherUsername, name, chatRoomId;
  @override
  Widget build(BuildContext context) {
    return BaseViewInit<ChatScreenViewModel>(
      onModelReady: (model) =>
          model.initialize(otherUsername, name, chatRoomId),
      builder: ((context, model) {
        return Scaffold(
          appBar: AppBar(
            title: Text(otherUsername),
          ),
          body: Container(
            child: Stack(
              children: [
                ChatMessages(chatRoomid: model.chatRoomId, myUserName: name),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.black.withOpacity(0.8),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller: model.messageTextEdittingController,
                          // calls addmessage as the text field changes. This gives makes the other user
                          onChanged: (value) {
                            //addMessage(false); // this used to clear the textfield if it is sent
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "type a message",
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.6))),
                        )),
                        GestureDetector(
                          onTap: () {
                            model.addMessage(true);
                          },
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
