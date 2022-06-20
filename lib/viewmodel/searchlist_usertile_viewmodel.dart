import 'package:get/get.dart';
import 'package:messengerapp/constants/navigation_constants.dart';
import 'package:messengerapp/services/firebase_service.dart';
import 'package:messengerapp/services/navigation_service.dart';
import 'package:messengerapp/services/shareprefernces_service.dart';

class SearchListUserTileViewModel extends GetxController {
  final FirebaseService _firebaseService = Get.find<FirebaseService>();
  final SharedPreferncesService _preferncesService =
      Get.find<SharedPreferncesService>();
  final NavigationService _navserv = Get.find<NavigationService>();

  _getChatRoomIdByUsernames(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  void createChatRoom(String otheruserUsername) async {
    String myUserName = await _preferncesService.getUserName();
    var chatRoomId = _getChatRoomIdByUsernames(myUserName, otheruserUsername);
    Map<String, dynamic> chatRoomInfoMap = {
      "users": [myUserName, otheruserUsername]
    };
    await _firebaseService.createChatRoom(chatRoomId, chatRoomInfoMap);
    print("otheruserUsername $otheruserUsername myUserName $myUserName");
    _navserv.navigateTo(Routes.chatscreen, arguements: {
      "otherUserName": otheruserUsername,
      "chatUser": myUserName,
      "chatid": chatRoomId,
    });
  }
}
