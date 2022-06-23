import 'package:get/get.dart';
import 'package:messengerapp/constants/navigation_constants.dart';
import 'package:messengerapp/services/firebase_service.dart';
import 'package:messengerapp/services/navigation_service.dart';

class SignInViewModel extends GetxController {
  final FirebaseService _firebaseService = Get.find<FirebaseService>();
  final NavigationService _navigationService = Get.find<NavigationService>();
  Future<void> signIn() async {
    await _firebaseService.signInWithGoogle();
    await _navigationService.replaceAndNavigateTo(Routes.home);
  }
}
