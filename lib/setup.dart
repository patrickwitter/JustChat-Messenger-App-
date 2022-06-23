import 'package:get/get.dart';
import 'package:messengerapp/services/firebase_service.dart';
import 'package:messengerapp/services/navigation_service.dart';
import 'package:messengerapp/services/shareprefernces_service.dart';
import 'package:messengerapp/viewmodel/chatlist_tile_viewmodel.dart';
import 'package:messengerapp/viewmodel/chatmessagesviewmodel.dart';
import 'package:messengerapp/viewmodel/chatroom_list_viewmodel.dart';
import 'package:messengerapp/viewmodel/chatscreen_viewmodel.dart';
import 'package:messengerapp/viewmodel/home_viewmodel.dart';
import 'package:messengerapp/viewmodel/searchlist_usertile_viewmodel.dart';
import 'package:messengerapp/viewmodel/searchuser_viewmodel.dart';
import 'package:messengerapp/viewmodel/signin_viewmodel.dart';

void setup() {
  Get.put(SharedPreferncesService(), permanent: true);
  Get.put<NavigationService>(NavigationService(), permanent: true);
  Get.put<FirebaseService>(FirebaseService(), permanent: true);
  Get.put<ChatRoomListViewModel>(ChatRoomListViewModel());
  Get.lazyPut<SearchUserViewModel>(() => SearchUserViewModel());
  Get.lazyPut<ChatListTileViewModel>(() => ChatListTileViewModel());
  Get.put<ChatMessagesViewModel>(ChatMessagesViewModel());
  Get.lazyPut<SearchListUserTileViewModel>(() => SearchListUserTileViewModel());
  Get.lazyPut<ChatScreenViewModel>(() => ChatScreenViewModel());
  Get.lazyPut<SearchUserViewModel>(() => SearchUserViewModel());

  Get.put(HomeViewModel());
  Get.put(SignInViewModel());
}
