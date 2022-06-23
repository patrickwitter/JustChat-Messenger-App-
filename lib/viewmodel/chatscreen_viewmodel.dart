// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messengerapp/services/firebase_service.dart';
import 'package:messengerapp/services/shareprefernces_service.dart';
import 'package:random_string/random_string.dart';

class ChatScreenViewModel extends GetxController {
  TextEditingController messageTextEdittingController = TextEditingController();
  final FirebaseService _firebaseService = Get.find<FirebaseService>();
  final SharedPreferncesService _preferncesService =
      Get.find<SharedPreferncesService>();

  String? _name;
  String? _profileUrl;
  String? _userName;
  String? _email;
  String? _chatRoomId;
  String messageId = "";

  get chatRoomId => _chatRoomId;

  addMessage(bool sendClicked) {
    if (messageTextEdittingController.text != "") {
      String message = messageTextEdittingController.text;

      var lastMessageTs = DateTime.now();

      Map<String, dynamic> messageInfoMap = {
        "message": message,
        "sendBy": _userName,
        "ts": lastMessageTs,
        "imgUrl": _profileUrl
      };

      //messageId
      if (messageId == "") {
        messageId = randomAlphaNumeric(12);
      }
// Adds message to the chats message doc
      _firebaseService
          .addMessage(_chatRoomId!, messageId, messageInfoMap)
          .then((value) {
        Map<String, dynamic> lastMessageInfoMap = {
          "lastMessage": message,
          "lastMessageSendTs": lastMessageTs,
          "lastMessageSendBy": _userName
        };

// Updates the chat collection with last infoMap
        _firebaseService.updateLastMessageSend(
            _chatRoomId!, lastMessageInfoMap);

        if (sendClicked) {
          // remove the text in the message input field
          messageTextEdittingController.text = "";
          // make message id blank to get regenerated on next message send
          messageId = "";
        }
      });
    }
  }

  void initialize(String chatWithUsername, myUserName, chatroomId) {
    _chatRoomId = chatroomId;
    print("chatroom id ${_chatRoomId!}");
    _name = _preferncesService.getDisplayName();
    _profileUrl = _preferncesService.getUserProfileUrl();
    _userName = _preferncesService.getUserName();
    _email = _preferncesService.getUserEmail();
  }
}
