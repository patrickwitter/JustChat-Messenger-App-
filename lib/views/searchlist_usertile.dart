// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:messengerapp/viewmodel/searchlist_usertile_viewmodel.dart';
import 'package:messengerapp/views/baseview.dart';

class SearchListUserTile extends StatelessWidget {
  const SearchListUserTile(
      {required this.name,
      required this.email,
      required this.profileUrl,
      required this.username,
      Key? key})
      : super(key: key);

  final String profileUrl, name, username, email;

  @override
  Widget build(BuildContext context) {
    return BaseView<SearchListUserTileViewModel>(
      builder: (context, model) {
        return GestureDetector(
          onTap: () {
            model.createChatRoom(username);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    profileUrl,
                    height: 40,
                    width: 40,
                  ),
                ),
                SizedBox(width: 12),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(name), Text(email)])
              ],
            ),
          ),
        );
      },
    );
  }
}
