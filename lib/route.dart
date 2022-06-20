import 'package:flutter/material.dart';
import 'package:messengerapp/constants/navigation_constants.dart';
import 'package:messengerapp/views/chatscreen.dart';
import 'package:messengerapp/views/defaultpage.dart';
import 'package:messengerapp/views/home.dart';
import 'package:messengerapp/views/signin.dart';

Route<dynamic> ongenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.home:
      return MaterialPageRoute(builder: (context) => const Home());
    case Routes.signin:
      return MaterialPageRoute(builder: ((context) => const SignIn()));
    case Routes.chatscreen:
      Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
      print(args);
      return MaterialPageRoute(
        builder: ((context) => ChatScreen(
              otherUsername: args["otherUserName"],
              name: args["chatUser"],
              chatRoomId: args["chatid"],
            )),
      );
    default:
      return MaterialPageRoute(builder: (context) => const DefaultPage());
  }
}
