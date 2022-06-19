// ignore_for_file: unnecessary_string_escapes

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:messengerapp/services/firebase_service.dart';

class ChatMessagesViewModel extends GetxController {
  Stream<QuerySnapshot>? messengeStream;
  final FirebaseService _firebaseService = Get.find<FirebaseService>();

  void initalize(chatRoomId) async {
    messengeStream = await _firebaseService.getChatRoomMessages(chatRoomId);
  }
}
