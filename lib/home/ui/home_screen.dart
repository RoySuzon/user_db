import 'package:flutter/material.dart';
import 'package:user_db/sign_up/background.dart';
import 'package:user_db/sign_up/ui/sign_up_screen.dart';
import 'package:user_db/user_list/ui/user_list.dart';
import 'package:user_db/widgets/custom_button.dart';
import 'package:user_db/widgets/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(DateTime.timestamp().microsecondsSinceEpoch.toString());
    final _emailController = TextEditingController();
    return CustomeBackground(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: 10),
            Container(
              width: 160,
              height: 160,
              child: CustomButtonWithIcon(
                'A D D\nU S E R',
                img: 'assets/user.png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ));
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 160,
              height: 160,
              child: CustomButtonWithIcon(
                'U S E R S\nL I S T',
                img: 'assets/user (1).png',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserListScreen(),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
