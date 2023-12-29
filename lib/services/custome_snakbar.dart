import 'package:flutter/material.dart';

showSnakbar(String msg, BuildContext context, {Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(child: Text(msg)),
    closeIconColor: Colors.white,
    showCloseIcon: true,
    // margin: EdgeInsets.zero,
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.endToStart,

    clipBehavior: Clip.hardEdge,
    duration: Duration(milliseconds: 1000),
    backgroundColor: color,
  ));
}
