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
          return StreamBuilder<QuerySnapshot>(
            stream: model.chatRoomsStream,
            builder: (context, snapshot) {
              // print(
              //     "SnapShot infor ${snapshot.hasData}\n  Error: ${snapshot.hasError}");
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.docs
                        .length, // The length of the chatrooms that the user is apart of
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data!.docs[
                          index]; // The index of the ith chatroom the user is apart of
                      return ChatRoomListTile(
                        lastMessage: ds["lastMessage"],
                        chatRoomId: ds.id,
                        myUsername: myUserName,
                      );
                      // return Center(
                      //   child: Text("has data"),
                      // );
                    });
              } else if (!snapshot.hasData && !snapshot.hasError) {
                return Center(child: CircularProgressIndicator());
              } else
                print("Error ${snapshot.error}");
              return Container();
            },
          );
        }));
  }
}
