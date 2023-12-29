import 'package:flutter/material.dart';

showSnakbar(String msg, BuildContext context, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
    backgroundColor: color,
  ));
}
