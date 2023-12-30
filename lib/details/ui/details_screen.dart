import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_db/sign_up/background.dart';
import 'package:user_db/user_list/models/user_model.dart';

const String defaultImage = "assets/young-man.png";

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
                  child: userModel.img != null
                      ? Image.file(
                          File(userModel.img.toString()),
                          fit: BoxFit.cover,
                          height: 200,
                          width: 200,
                        )
                      : Image.asset(
                          defaultImage,
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
                          child: ExpansionTile(
                              children: [ListTile()],
                              title: Text(
                                userModel.phone![index],
                              )),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
