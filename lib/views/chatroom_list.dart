import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messengerapp/viewmodel/chatroom_list_viewmodel.dart';
import 'package:messengerapp/views/baseviewinit.dart';
import 'package:messengerapp/views/chatroom_listtile.dart';

class ChatRoomList extends StatelessWidget {
  const ChatRoomList({
    required this.myUserName,
    Key? key,
  }) : super(key: key);
  final String myUserName;
  @override
  Widget build(BuildContext context) {
    return BaseViewInit<ChatRoomListViewModel>(
        onModelReady: (model) => model.initialize(),
        builder: ((context, model) {
          print("is chatroom stream null ${model.chatRoomListStream == null}");
          return StreamBuilder<QuerySnapshot<Object?>>(
            stream: model.chatRoomListStream,
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.active) {
                print(
                    "chatroom snapshot ${snapshot.data} ${snapshot.connectionState}");
                if (snapshot.data!.docs.isEmpty) {
                  return Center(
                      child: Text(
                          "No chats Created Search for a user to chat with"));
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data?.docs
                          .length, // The length of the chatrooms that the user is apart of
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data!.docs[
                            index]; // The index of the ith chatroom the user is apart of
                        print("ChatRoom id ${ds.id} myUserName $myUserName");
                        return ChatRoomListTile(
                          lastMessage: ds["lastMessage"],
                          chatRoomId: ds.id,
                          myUsername: myUserName,
                        );
                      });
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error "),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        }));
  }
}
