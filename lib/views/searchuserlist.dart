import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messengerapp/viewmodel/searchuser_viewmodel.dart';
import 'package:messengerapp/views/baseviewinit.dart';
import 'package:messengerapp/views/searchlist_usertile.dart';

class SearchUserList extends StatelessWidget {
  const SearchUserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseViewInit<SearchUserViewModel>(builder: (context, model) {
      return StreamBuilder<QuerySnapshot>(
        stream: model.usersStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
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
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      );
    });
  }
}
