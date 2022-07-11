import 'package:flutter/material.dart';

void showMessage({required BuildContext context, required String message, Color color = Colors.green}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
}
