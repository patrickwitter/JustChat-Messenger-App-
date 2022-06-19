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
      return MaterialPageRoute(
        builder: ((context) => ChatScreen(
              chatWithUsername: args["name"],
              name: args["chatUser"],
            )),
      );
    default:
      return MaterialPageRoute(builder: (context) => const DefaultPage());
  }
}
