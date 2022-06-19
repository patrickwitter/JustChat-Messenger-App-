import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:messengerapp/constants/navigation_constants.dart';
import 'package:messengerapp/models/user.dart';
import 'package:messengerapp/services/navigation_service.dart';
import 'package:messengerapp/services/shareprefernces_service.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final NavigationService _navigationService = Get.find<NavigationService>();
  final SharedPreferncesService _preferncesService =
      Get.find<SharedPreferncesService>();

  // 1.1  Returns the current user if user is signed in. If not null
  getCurrentUser() async {
    return _auth.currentUser;
  }

// 1.2
  signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential result = await _auth.signInWithCredential(credential);

      User? userDetails = result.user;

      if (userDetails != null) {
        _preferncesService.saveUserEmail(userDetails.email!);
        _preferncesService.saveUserId(userDetails.uid);
        _preferncesService
            .saveUserName(userDetails.email!.replaceAll("@gmail.com", ""));
        _preferncesService.saveDisplayName(userDetails.displayName!);
        _preferncesService.saveUserProfileUrl(userDetails.photoURL!);

        Map<String, dynamic> userInfoMap = AppUser(
          email: userDetails.email!,
          name: userDetails.displayName!,
          imgUrl: userDetails.photoURL!,
          username: userDetails.email!.replaceAll("@gmail.com", ""),
        ).toJson();

        addUserInfoToDB(userDetails.uid, userInfoMap).then((value) {
          _navigationService.replaceAndNavigateTo(Routes.home);
        });
      }
    }
  }

  Future signOut() async {
    await _preferncesService.deleteUserInfo();
    await _auth.signOut();
  }

  Future addUserInfoToDB(
      String userId, Map<String, dynamic> userInfoMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

// 6.a Searches in the user collection where it returns a stream
// of query snapshot where the username is equal to the user name we passed in
  Future<Stream<QuerySnapshot>> getUserByUserName(String username) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where("username", isEqualTo: username)
        .snapshots();
  }

// 11.1 Adds message to firestore database
  Future addMessage(String chatRoomId, String messageId,
      Map<String, dynamic> messageInfoMap) async {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .collection("chats")
        .doc(messageId)
        .set(messageInfoMap);
  }

  updateLastMessageSend(
      String chatRoomId, Map<String, dynamic> lastMessageInfoMap) {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .update(lastMessageInfoMap);
  }

// 7.b Gets a document snapshot enquiring in the chatrooms collection if the
// collection chatrooms has a chatroom doc witht the id specified.
// If it does , it returns true.
// If it doesn't exist it creates a chatroom(document) with that id and
//add the infoMap properties.
  Future<void> createChatRoom(
      String chatRoomId, Map<String, dynamic> chatRoomInfoMap) async {
    final snapShot = await FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .get();

    if (!snapShot.exists) {
      // chatroom does not exists
      return FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(chatRoomId)
          .set(chatRoomInfoMap);
    }
  }

// 8.1
// Goes to the collection chatrooms then goes to the appropriate chatroom id
// Goes into the chats collection orders the messages by desceding order by
// timestamp and then  returns the querysnap shots
  Future<Stream<QuerySnapshot>> getChatRoomMessages(chatRoomId) async {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy("ts", descending: true)
        .snapshots();
  }

  // 4.a
  Future<Stream<QuerySnapshot>> getChatRooms() async {
    // Gets username from shared preferences.
    String myUsername = await _preferncesService.getUserName();

    //Gets stream info from firebase. Gets the collection "chatrooms "
    // and orders each of it's children (the different chatrooms) by the last
    //message timestamp in descending order. And the users array contains
    // the users in the chat. If the user contains the user name then it
    //will return that chat room.
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .orderBy("lastMessageSendTs", descending: true) //This is a document
        .where("users", arrayContains: myUsername) //property on document
        .snapshots();
  }

  Future<QuerySnapshot> getUserInfo(String username) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("username", isEqualTo: username)
        .get();
  }
}
