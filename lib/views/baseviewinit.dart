import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseViewInit<T extends GetxController> extends StatefulWidget {
  const BaseViewInit({
    this.onModelReady,
    required this.builder,
    Key? key,
  }) : super(key: key);

  final Function(T)? onModelReady;
  final Widget Function(BuildContext context, T model) builder;
  @override
  _BaseViewInitState<T> createState() => _BaseViewInitState<T>();
}

class _BaseViewInitState<T extends GetxController>
    extends State<BaseViewInit<T>> {
  T model = Get.find<T>();
  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      model,
    );
  }
}
