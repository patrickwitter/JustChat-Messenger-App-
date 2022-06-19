import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messengerapp/viewmodel/home_viewmodel.dart';
import 'package:messengerapp/views/baseviewinit.dart';
import 'package:messengerapp/views/chatroom_list.dart';
import 'package:messengerapp/views/searchuserlist.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseViewInit<HomeViewModel>(
        onModelReady: (model) => model.initialze(),
        builder: (context, model) => Scaffold(
              appBar: AppBar(
                title: Text("Messenger Clone"),
                actions: [
                  InkWell(
                    onTap: () {
                      model.signOut();
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(Icons.exit_to_app)),
                  )
                ],
              ),
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        model.isSearching
                            ? GestureDetector(
                                onTap: () {
                                  model.cancelSearch();
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Icon(Icons.arrow_back)),
                              ) // The back back arrow created when user searches something to delete it
                            : Container(),
                        //end)

                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 16),
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(24)),
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextField(
                                  controller:
                                      model.searchUsernameEditingController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "username"),
                                )),
                                GestureDetector(
                                    onTap: () {
                                      if (model.searchUsernameEditingController
                                              .text !=
                                          "") {
                                        model.onSearchClick();
                                      }
                                    },
                                    child: Icon(Icons.search))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    model.isSearching
                        ? SearchUserList()
                        : ChatRoomList(
                            myUserName: model.myUserName,
                          ),
                    // If the user is searching the searchUsersList will be visible.
                    // Else the chat rooms list will be visible
                  ],
                ),
              ),
            ));
  }
}
