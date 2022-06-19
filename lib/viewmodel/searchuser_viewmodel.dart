import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:messengerapp/services/firebase_service.dart';

class SearchUserViewModel extends GetxController {
  final FirebaseService _firebaseService = Get.find<FirebaseService>();

  Stream<QuerySnapshot>? usersStream;

  void initialize(String text) async {
    usersStream = await _firebaseService.getUserByUserName(text);
  }
}
