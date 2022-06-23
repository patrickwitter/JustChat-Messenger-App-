import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:messengerapp/services/firebase_service.dart';

class SearchUserViewModel extends GetxController {
  final FirebaseService _firebaseService = Get.find<FirebaseService>();

  late Stream<QuerySnapshot<Object?>> usersStream;

  void initialize(String text) async {
    print("User searching is $text");
    usersStream = _firebaseService.getUserByUserName(text);
  }
}
