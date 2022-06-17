import 'package:get/get.dart';
import 'package:messengerapp/services/navigation_service.dart';
import 'package:messengerapp/services/shareprefernces_service.dart';

void setup() {
  SharedPreferncesService.init();

  Get.lazyPut<NavigationService>(() => NavigationService(), fenix: true);
}
