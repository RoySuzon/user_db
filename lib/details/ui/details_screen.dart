import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_db/sign_up/background.dart';
import 'package:user_db/user_list/models/user_model.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.userModel, required this.index});
  final UserModel userModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CustomeBackground(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Hero(
                  tag: index,
                  child: Image.asset(
                    userModel.img.toString(),
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  userModel.name.toString(),
                  style: GoogleFonts.nunito(fontSize: 24, color: Colors.brown),
                ),
              ),
              Wrap(
                children: List.generate(
                    userModel.phone!.length,
                    (index) => Card(
                          child: ListTile(
                            title: Text(userModel.phone![index]),
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
