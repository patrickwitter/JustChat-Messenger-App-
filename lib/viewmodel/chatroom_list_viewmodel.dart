import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../services/firebase_service.dart';

class ChatRoomListViewModel extends GetxController {
  final FirebaseService _firebaseService = Get.find<FirebaseService>();
  Stream<QuerySnapshot>? chatRoomsStream;

  getChatRooms() async {
    chatRoomsStream = await _firebaseService.getChatRooms();
  }

  void initialize() async {
    await getChatRooms();
  }
}
