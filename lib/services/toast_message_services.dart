import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomToastMessage {
  void show(BuildContext context, String messageText, bool success) {
    toastification.show(
      context: context,
      title: Text(messageText),
      type: success ? ToastificationType.success : ToastificationType.error,
      alignment: Alignment.topCenter,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: Duration(seconds: 5),
    );
  }
}
