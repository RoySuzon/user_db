import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(this.title, {super.key, this.onTap});
  final VoidCallback? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: Colors.deepPurple.withOpacity(.5),
      disabledColor: Colors.deepPurple.withOpacity(.3),
      textColor: Color(0xffffffff),
      // color: Colors.blueGrey,
      // colorBrightness: Brightness.dark,
      child: Container(
        constraints: BoxConstraints(minWidth: 100),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            title,
            // style: TextStyle(color: Colors.white),
          ),
        )),
      ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon(this.title, {super.key, this.onTap, this.img});
  final VoidCallback? onTap;
  final String? img;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: MaterialButton(
        onPressed: onTap,
        color: Colors.deepPurple.withOpacity(.6),
        disabledColor: Colors.deepPurple.withOpacity(.3),
        textColor: Color(0xffffffff),
        // color: Colors.blueGrey,
        // colorBrightness: Brightness.dark,
        child: Container(
          constraints: BoxConstraints(minWidth: 100),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  img != null
                      ? Image.asset(
                          img!,
                          color: Colors.white,
                        )
                      : SizedBox(),
                  img == null ? SizedBox() : SizedBox(height: 8),
                  Text(
                    title, textAlign: TextAlign.center,
                    // style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
