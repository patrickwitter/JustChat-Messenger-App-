import 'package:get/get.dart';
import 'package:messengerapp/services/firebase_service.dart';

class SignInViewModel extends GetxController {
  final FirebaseService _firebaseService = Get.find<FirebaseService>();

  Future<void> signIn() {
    return _firebaseService.signInWithGoogle();
  }
}
