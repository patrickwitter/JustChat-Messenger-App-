import 'package:flutter/cupertino.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> _navigatorkey =
      GlobalKey<NavigatorState>();
  get navkey => _navigatorkey;

  Future<dynamic> navigateTo(String routeName, {dynamic arguements}) {
    return _navigatorkey.currentState!
        .pushNamed(routeName, arguments: arguements);
  }

  void navigateBack({dynamic arguements}) {
    return (arguements != null)
        ? _navigatorkey.currentState!.pop(arguements)
        : _navigatorkey.currentState!.pop();
  }

  Future<dynamic> replaceAndNavigateTo(String routeName, {dynamic arguements}) {
    return _navigatorkey.currentState!
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  Future<dynamic> pushReplacememtNamed(String routeName, {dynamic arguements}) {
    return _navigatorkey.currentState!.pushReplacementNamed(routeName);
  }
}
