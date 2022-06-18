import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:messengerapp/services/shareprefernces_service.dart';

class HomeController extends GetxController {
  final SharedPreferncesService _preferncesService =
      Get.find<SharedPreferncesService>();

  late Stream usersStream, chatRoomsStream;

  TextEditingController searchUsernameEditingController =
      TextEditingController();

  bool isSearching = false;

  RxString _name = "".obs;
  RxString _profileUrl = "".obs;
  RxString _userName = "".obs;
  RxString _email = "".obs;

  get myName => _name.value;
  get myProfilePic => _profileUrl.value;
  get myUserName => _userName.value;
  get myEmail => _email.value;

  void _getMyInfoFromSharedPreference() async {
    _name.value = await _preferncesService.getDisplayName();
    _profileUrl.value = await _preferncesService.getUserProfileUrl();
    _userName.value = await _preferncesService.getUserName();
    _email.value = await _preferncesService.getUserEmail();
  }
}
