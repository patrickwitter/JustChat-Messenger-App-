import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messengerapp/viewmodel/chatmessagesviewmodel.dart';
import 'package:messengerapp/views/baseviewinit.dart';
import 'package:messengerapp/widgets/chatmessagetile.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    required this.chatRoomid,
    required this.myUserName,
    Key? key,
  }) : super(key: key);

  final String chatRoomid, myUserName;
  @override
  Widget build(BuildContext context) {
    return BaseViewInit<ChatMessagesViewModel>(
        onModelReady: (model) => model.initalize(chatRoomid),
        builder: (context, model) {
          print("Is stream null ${model.messengeStream == null}");
          return StreamBuilder<QuerySnapshot>(
            stream: model.messengeStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    padding: EdgeInsets.only(bottom: 70, top: 16),
                    itemCount: snapshot.data!.docs.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data!.docs[index];
                      // print(
                      //     "message sent by ${ds["sendBy"]} the user $myUserName");
                      return ChatMessageTile(
                        message: ds["message"],
                        sendbyMe: myUserName == ds["sendBy"],
                      );
                    });
              } else if (snapshot.connectionState != ConnectionState.none) {
                print(
                    "Snapshot Data ${snapshot.hasData} connectionState ${snapshot.connectionState}");
                return ListView(
                  children: [
                    Center(
                      child: Text("Send your first message"),
                    )
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        });
  }
}
