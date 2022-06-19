import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:messengerapp/constants/navigation_constants.dart';
import 'package:messengerapp/services/firebase_service.dart';
import 'package:messengerapp/services/navigation_service.dart';
import 'package:messengerapp/services/shareprefernces_service.dart';

class HomeViewModel extends GetxController {
  final SharedPreferncesService _preferncesService =
      Get.find<SharedPreferncesService>();

  final FirebaseService _firebaseService = Get.find<FirebaseService>();
  final NavigationService _navserv = Get.find<NavigationService>();

  TextEditingController searchUsernameEditingController =
      TextEditingController();

  final RxBool _isSearching = false.obs;

  final RxString _name = "".obs;
  final RxString _profileUrl = "".obs;
  final RxString _userName = "".obs;
  final RxString _email = "".obs;
  final RxString _controllertext = "".obs;

  get myName => _name.value;
  get myProfilePic => _profileUrl.value;
  get myUserName => _userName.value;
  get myEmail => _email.value;

  get isSearching => _isSearching.value;

  Future<void> _getMyInfoFromSharedPreference() async {
    _name.value = await _preferncesService.getDisplayName();
    _profileUrl.value = await _preferncesService.getUserProfileUrl();
    _userName.value = await _preferncesService.getUserName();
    _email.value = await _preferncesService.getUserEmail();
  }

  void initialze() async {
    searchUsernameEditingController.text = _controllertext.value;

    await _getMyInfoFromSharedPreference();
  }

  void signOut() {
    _firebaseService
        .signOut()
        .then((value) => _navserv.replaceAndNavigateTo(Routes.signin));
  }

  void onSearchClick() {
    _isSearching.value = true;
  }

  void cancelSearch() {
    _isSearching.value = false;
    searchUsernameEditingController.text = "";
  }

  @override
  void dispose() {
    searchUsernameEditingController.dispose();
    super.dispose();
  }
}
