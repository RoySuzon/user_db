import 'dart:math';
import 'package:flutter/material.dart';
import 'package:user_db/widgets/custom_button.dart';

class CustomeBackground extends StatelessWidget {
  final Widget? floatingActionButton;
  final Widget? body;
  final SliverAppBar? sliverAppBar;
  final AppBar? appBar;
  const CustomeBackground(
      {super.key,
      this.body,
      this.appBar,
      this.sliverAppBar,
      this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      // resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomInset: false,
      // extendBody: true,
      // bottomNavigationBar: Icon(Icons.abc),
      // bottomSheet: Icon(Icons.abc),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: appBar,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              bottom: -160,
              // right: 0,
              child: Transform.rotate(
                angle: pi / 5,
                child: Image.asset(
                  'assets/bottom.png',
                  fit: BoxFit.cover,
                ),
              )),
          Positioned(
              top: 0,
              // right: 0,
              // bottom: 0,
              left: 0,
              child: Image.asset(
                'assets/signup_top.png',
                fit: BoxFit.cover,
              )),
          Container(
              color: Colors.deepPurple.withOpacity(.15),
              height: double.infinity,
              width: double.infinity,
              child: body)
        ],
      ),
    );
  }
}
