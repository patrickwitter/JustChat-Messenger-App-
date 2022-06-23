import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messengerapp/viewmodel/searchuser_viewmodel.dart';
import 'package:messengerapp/views/baseviewinit.dart';
import 'package:messengerapp/views/searchlist_usertile.dart';

class SearchUser extends StatelessWidget {
  const SearchUser({required this.user, Key? key}) : super(key: key);

  final String user;
  @override
  Widget build(BuildContext context) {
    print("User searched $user");
    return BaseViewInit<SearchUserViewModel>(
        onModelReady: (model) => model.initialize(user),
        builder: (context, model) {
          print("Search User Loaded");
          model.initialize(user);
          return StreamBuilder<QuerySnapshot>(
            stream: model.usersStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.docs.isNotEmpty) {
                  print(
                      "Snapshot data search user list ${snapshot.data} Connection state ${snapshot.connectionState}");
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
                } else {
                  print(
                      "Snapshot data search user list ${snapshot.data} Connection state ${snapshot.connectionState}");
                  return Center(
                    child: Text("No user found named $user"),
                  );
                }
              } else {
                print(
                    "Snapshot data search user list ${snapshot.data} Connection state ${snapshot.connectionState}");
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        });
  }
}
