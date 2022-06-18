import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseView<T extends GetxController> extends StatelessWidget {
  BaseView({required this.builder, Key? key}) : super(key: key);

  final Widget Function(BuildContext context, T model) builder;

  final T model = Get.find<T>();

  @override
  Widget build(BuildContext context) {
    return builder(context, model);
  }
}
