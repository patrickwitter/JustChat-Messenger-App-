import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messengerapp/constants/navigation_constants.dart' as navconst;
import 'package:messengerapp/route.dart' as router;
import 'package:messengerapp/services/navigation_service.dart';
import 'package:messengerapp/setup.dart';
import 'package:messengerapp/theme.dart';
import 'package:messengerapp/views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MessengerApp());
}

class MessengerApp extends StatelessWidget {
  const MessengerApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Messenger App',
        theme: appTheme,
        home: const Home(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.ongenerateRoute,
        initialRoute: navconst.Routes.home,
        navigatorKey: Get.find<NavigationService>().navkey);
  }
}
