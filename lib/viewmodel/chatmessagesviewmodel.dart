// ignore_for_file: unnecessary_string_escapes

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:messengerapp/services/firebase_service.dart';

class ChatMessagesViewModel extends GetxController {
  late Stream<QuerySnapshot<Object?>> messengeStream;
  final FirebaseService _firebaseService = Get.find<FirebaseService>();

  void initalize(chatRoomId) {
    messengeStream = _firebaseService.getChatRoomMessages(chatRoomId);
  }
}
