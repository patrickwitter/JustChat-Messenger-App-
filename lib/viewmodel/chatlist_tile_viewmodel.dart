import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:messengerapp/constants/navigation_constants.dart';
import 'package:messengerapp/services/firebase_service.dart';
import 'package:messengerapp/services/navigation_service.dart';

class ChatListTileViewModel extends GetxController {
  final RxString _profilePicUrl = "".obs;
  final RxString _name = "".obs;
  final RxString _username = "".obs;
  final FirebaseService _firebaseService = Get.find<FirebaseService>();
  final NavigationService _navServ = Get.find<NavigationService>();

  get profilePicUrl => _profilePicUrl.value;
  get name => _name.value;
  get otherusername => _username.value;

  void initialize(String chatRoomId, myUsername) async {
    await getThisUserInfo(chatRoomId, myUsername);
  }

  getThisUserInfo(String chatRoomId, myUsername) async {
    print("chatRoom Id b4 ${chatRoomId}");
    //This is the other person's username.()The person you are talking to). It replaces your
    //username and the underscore to get the other person's user name. eg. myusername_yourusername => yourusername
    _username.value = chatRoomId.replaceAll(myUsername, "").replaceAll("_", "");
    QuerySnapshot querySnapshot =
        await _firebaseService.getUserInfo(_username.value);
    _name.value = myUsername;
    _profilePicUrl.value = "${querySnapshot.docs[0]["imgUrl"]}";
  }

  void loadChatScreen(String chatRoomid) {
    print("MyUserName $name , OtherUserName $otherusername");
    _navServ.navigateTo(Routes.chatscreen, arguements: {
      "chatUser": name,
      "otherUserName": otherusername,
      "chatid": chatRoomid
    });
  }
}
