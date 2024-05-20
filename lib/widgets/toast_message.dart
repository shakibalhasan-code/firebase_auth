import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomToastMessage {
  static void show(BuildContext context, String messageText) {
    toastification.show(
      context: context,
      title: Text(messageText),
      type: ToastificationType.success,
      alignment: Alignment.topCenter,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: Duration(seconds: 5),
    );
  }
}
