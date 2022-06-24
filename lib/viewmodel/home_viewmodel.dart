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
  String _userName = "";
  final RxString _email = "".obs;
  final RxString _controllertext = "".obs;

  get myName => _name.value;
  get myProfilePic => _profileUrl.value;
  get myUserName => _userName;
  get myEmail => _email.value;

  get isSearching => _isSearching.value;

  void _getMyInfoFromSharedPreference() {
    _name.value = _preferncesService.getDisplayName();
    _profileUrl.value = _preferncesService.getUserProfileUrl();
    _userName = _preferncesService.getUserName();
    print("userName ${_userName}");
    _email.value = _preferncesService.getUserEmail();
  }

  void initialze() {
    searchUsernameEditingController.text = _controllertext.value;

    _getMyInfoFromSharedPreference();
  }

  void signOut() async {
    await _firebaseService.signOut();
    _navserv.pushReplacememtNamed(Routes.signin);
  }

  void onSearchClick() {
    print("Clicked Search");
    print(" text searched ${searchUsernameEditingController.text}");
    _toggleSearch();
  }

  void cancelSearch() {
    _isSearching.value = false;
    searchUsernameEditingController.text = "";
  }

  void _toggleSearch() {
    _isSearching.value = false;
    _isSearching.value = true;
  }

  @override
  void dispose() {
    searchUsernameEditingController.dispose();
    _isSearching.close();
    super.dispose();
  }
}
