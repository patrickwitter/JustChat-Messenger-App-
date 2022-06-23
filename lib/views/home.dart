import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messengerapp/viewmodel/home_viewmodel.dart';
import 'package:messengerapp/views/baseviewinit.dart';
import 'package:messengerapp/views/chatroom_list.dart';
import 'package:messengerapp/views/searchuser.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseViewInit<HomeViewModel>(
        onModelReady: (model) => model.initialze(),
        builder: (context, model) {
          print("on home");
          return Scaffold(
            appBar: AppBar(
              title: Text("Messenger Clone ${model.myUserName}"),
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
                      Obx(
                        () => Visibility(
                          visible: model.isSearching,
                          child: GestureDetector(
                            onTap: () {
                              model.cancelSearch();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Icon(Icons.arrow_back),
                            ),
                          ), // The back back arrow created when user searches something to delete it
                          replacement: Container(),
                        ),
                      ),
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
                              IconButton(
                                  onPressed: () {
                                    if (model.searchUsernameEditingController
                                            .text !=
                                        "") {
                                      model.onSearchClick();
                                    }
                                  },
                                  icon: Icon(Icons.search)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  Obx(() => Visibility(
                        visible: model.isSearching,
                        child: SearchUser(
                          user: model.searchUsernameEditingController.text,
                        ),
                        replacement: ChatRoomList(
                          myUserName: model.myUserName,
                        ),
                      )),

                  // If the user is searching the searchUsersList will be visible.
                  // Else the chat rooms list will be visible
                ],
              ),
            ),
          );
        });
  }
}
