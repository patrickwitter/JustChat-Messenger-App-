import 'package:flutter/material.dart';
import 'package:messengerapp/constants/navigation_constants.dart';
import 'package:messengerapp/views/defaultpage.dart';
import 'package:messengerapp/views/home.dart';

Route<dynamic> ongenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.home:
      return MaterialPageRoute(builder: (context) => const Home());
    default:
      return MaterialPageRoute(builder: (context) => const DefaultPage());
  }
}
