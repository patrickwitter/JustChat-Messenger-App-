import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messengerapp/viewmodel/searchuser_viewmodel.dart';
import 'package:messengerapp/views/baseviewinit.dart';
import 'package:messengerapp/views/searchlist_usertile.dart';

class SearchUserList extends StatelessWidget {
  const SearchUserList({required this.user, Key? key}) : super(key: key);

  final String user;
  @override
  Widget build(BuildContext context) {
    return BaseViewInit<SearchUserViewModel>(
        onModelReady: (model) => model.initialize(user),
        builder: (context, model) {
          print("Search User Loaded");
          return StreamBuilder<QuerySnapshot>(
            stream: model.usersStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("has data");
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data!.docs[index];
                    return SearchListUserTile(
                      profileUrl: ds["imgUrl"],
                      name: ds["name"],
                      email: ds["email"],
                      username: ds["username"],
                    );
                  },
                );
              } else if (!snapshot.hasData) {
                return Center(
                  child: Text("No user found"),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        });
  }
}
