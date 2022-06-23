import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:messengerapp/services/shareprefernces_service.dart';

import '../services/firebase_service.dart';

class ChatRoomListViewModel extends GetxController {
  final FirebaseService _firebaseService = Get.find<FirebaseService>();
  final SharedPreferncesService _preferncesService =
      Get.find<SharedPreferncesService>();
  late Stream<QuerySnapshot<Object?>> chatRoomListStream;

  getChatRooms() {
    // Gets username from shared preferences.
    String myUsername = _preferncesService.getUserName();
    chatRoomListStream = _firebaseService.getChatRooms(myUsername);
  }

  void initialize() {
    getChatRooms();
  }
}
