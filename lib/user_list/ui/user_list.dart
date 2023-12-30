import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_db/details/ui/details_screen.dart';
import 'package:user_db/sign_up/background.dart';
import 'package:user_db/user_list/models/user_model.dart';
import 'package:user_db/widgets/custom_button.dart';
import 'package:user_db/widgets/custom_text_field.dart';

class UserListScreen extends StatefulWidget {
  UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<UserModel> _serchList = [];
  _serchingFunction() {
    final _serchHistory = box.values.toList().where((element) {
      return element.name!
                  .toLowerCase()
                  .contains(_serarchController.text.trim().toLowerCase()) ||
              element.email!.toLowerCase().contains(_serarchController.text
                  .trim()
                  .toLowerCase()) /*  ||
          element.phone!.first
              .toLowerCase()
              .contains(_serarchController.text.trim().toLowerCase()) ||
          element.phone!.last
              .toLowerCase()
              .contains(_serarchController.text.trim().toLowerCase()) */
          ;
    }).toList();

    setState(() => _serchList = _serchHistory);
  }

  var box = Hive.box<UserModel>('users');

  final _serarchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomeBackground(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomeTextField(
              controller: _serarchController,
              onChange: (value) {
                setState(() {
                  _serchingFunction();
                });
                print('object');
              },
              // witdh: 16,
            ),
            Expanded(
              child: ListenableBuilder(
                listenable: box.listenable(),
                builder: (context, child) {
                  if (box.values.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  } else if (_serarchController.text.trim().isEmpty) {
                    return ListView.builder(
                      itemCount: box.values.toList().length,
                      itemBuilder: (context, index) {
                        final user = box.values.toList()[index];
                        return Card(
                          // margin: EdgeInsets.zero,
                          color: Colors.white.withOpacity(.6),
                          elevation: 0,
                          child: ExpansionTile(
                            onExpansionChanged: (value) {
                              print('object');
                            },
                            trailing: IconButton(
                              icon: Icon(
                                Icons.info_outline_rounded,
                                color: Colors.deepPurple.shade400,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          userModel: user,
                                          index: index.toInt()),
                                    ));
                              },
                            ),
                            expandedAlignment: Alignment.centerLeft,
                            // expandedCrossAxisAlignment: CrossAxisAlignment.start,

                            title: Text(
                                box.values.toList()[index].name.toString()),
                            leading: ClipOval(
                              child: Hero(
                                tag: index,
                                child: user.img != null
                                    ? Image.file(
                                        File(user.img.toString()),
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        defaultImage,
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            // initiallyExpanded: true,
                            subtitle: Text(user.email.toString()),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomButton(
                                      'E D I T E',
                                      onTap: () {},
                                    ),
                                    CustomButton(
                                      'D E L E T E',
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'DO YO WANT TO DELETE\nTHIS USER ?',
                                                  textAlign: TextAlign.center,
                                                )
                                              ],
                                            ),
                                            actions: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: CustomButton(
                                                    'N O',
                                                    onTap: () =>
                                                        Navigator.pop(context),
                                                  )),
                                                  SizedBox(width: 12),
                                                  Expanded(
                                                      child: CustomButton(
                                                    'Y E S',
                                                    onTap: () {
                                                      user.delete();
                                                      Navigator.pop(context);
                                                    },
                                                  )),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: _serchList.length,
                      itemBuilder: (context, index) {
                        final user = _serchList[index];
                        return Card(
                          // margin: EdgeInsets.zero,
                          color: Colors.white.withOpacity(.6),
                          elevation: 0,
                          child: ExpansionTile(
                            onExpansionChanged: (value) {
                              print('object');
                            },
                            trailing: IconButton(
                              icon: Icon(
                                Icons.info_outline_rounded,
                                color: Colors.deepPurple.shade400,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          userModel: user,
                                          index: index.toInt()),
                                    ));
                              },
                            ),
                            expandedAlignment: Alignment.centerLeft,
                            // expandedCrossAxisAlignment: CrossAxisAlignment.start,

                            title: Text(_serchList[index].name.toString()),
                            leading: ClipOval(
                              child: Hero(
                                tag: index,
                                child: user.img != null
                                    ? Image.file(
                                        File(user.img.toString()),
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        defaultImage,
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            // initiallyExpanded: true,
                            subtitle: Text(user.email.toString()),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomButton(
                                      'E D I T E',
                                      onTap: () {},
                                    ),
                                    CustomButton(
                                      'D E L E T E',
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'DO YO WANT TO DELETE\nTHIS USER ?',
                                                  textAlign: TextAlign.center,
                                                )
                                              ],
                                            ),
                                            actions: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: CustomButton(
                                                    'N O',
                                                    onTap: () =>
                                                        Navigator.pop(context),
                                                  )),
                                                  SizedBox(width: 12),
                                                  Expanded(
                                                      child: CustomButton(
                                                    'Y E S',
                                                    onTap: () {
                                                      _serchList[index]
                                                          .delete();
                                                      _serchList
                                                          .removeAt(index);

                                                      Navigator.pop(context);
                                                    },
                                                  )),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
