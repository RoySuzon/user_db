import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_db/home/ui/home_screen.dart';
import 'package:user_db/services/custome_snakbar.dart';
import 'package:user_db/sign_up/background.dart';
import 'package:user_db/user_list/models/user_model.dart';
import 'package:user_db/widgets/custom_button.dart';
import 'package:user_db/widgets/custom_text_field.dart';

class SteperOnseScreen extends StatefulWidget {
  const SteperOnseScreen({super.key, this.name, this.email, this.password});

  final String? name, email, password;

  @override
  State<SteperOnseScreen> createState() => _SteperOnseScreenState();
}

class _SteperOnseScreenState extends State<SteperOnseScreen> {
  var box = Hive.box<UserModel>('users');
  int index = 0;
  String? bloodGroup;
  final _adressController = TextEditingController();
  final _mobileController = TextEditingController();
  String? imgPath;

  List<String> listMobile = [];
  List listOfblood = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];
  _getImage() async {
    final _piker = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (_piker == null) return;

    imgPath = _piker.path;
    // setState(() {});

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomeBackground(
      // appBar: AppBar(
      //   title: Text('About'),
      // ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              _getImage();
                            },
                            child: imgPath == null
                                ? Center(
                                    child: Image.asset(
                                      'assets/Login.png',
                                      height: 200,
                                      // width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(30),
                                    child: Center(
                                      child: ClipOval(
                                        child: Image.file(
                                          File(imgPath!),
                                          height: 140,
                                          width: 140,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      )
                    ],
                  ),

                  CustomeTextField(
                    controller: _adressController,
                    hintText: "A D D R E S S",
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Chip(
                          // padding: EdgeInsets.zero,
                          backgroundColor: Colors.deepPurple.withOpacity(.6),
                          label: Text(
                            'SELECT BLOOD GROUP',
                            style: TextStyle(color: Colors.white),
                          )),
                      _bloodGroupOption(),
                    ],
                  ),
                  // CustomeCard(
                  //   child: DropdownButton(
                  //     itemHeight: 55,
                  //     isExpanded: true,
                  //     hint: Text(bloodGroup ?? 'Select Your Blood Group'),
                  //     items: listOfblood
                  //         .map((e) => DropdownMenuItem(
                  //               child: Chip(label: Text(e.toString())),
                  //               value: e.toString(),
                  //             ))
                  //         .toList(),
                  //     underline: SizedBox(),
                  //     onChanged: (value) {
                  //       bloodGroup = value.toString();
                  //       print(bloodGroup);
                  //       setState(() {});
                  //     },
                  //   ),
                  // ),
                  CustomeCard(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, right: 8),
                          child: Text("P H O N E :"),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                  listMobile.length,
                                  (index) => ActionChip(
                                      backgroundColor:
                                          Colors.deepPurple.shade100,
                                      onPressed: () {
                                        _mobileController.text =
                                            listMobile[index];

                                        customeAlertDialog(
                                          context,
                                          title: 'U P D A T E',
                                          onPressed: () {
                                            listMobile.removeAt(index);
                                            Navigator.pop(context);
                                            showSnakbar(
                                                'R E M O V E D  T H E P H O N E  N O',
                                                context,
                                                color: Colors.deepPurple
                                                    .withOpacity(.3));
                                            setState(() {});
                                          },
                                          onTap: () {
                                            if (_mobileController.text
                                                    .trim()
                                                    .length <
                                                10) return;

                                            listMobile[index] =
                                                _mobileController.text.trim();
                                            Navigator.pop(context);
                                            showSnakbar('U P D A T E', context,
                                                color: Colors.deepPurple
                                                    .withOpacity(.3));
                                            setState(() {});
                                          },
                                          controller: _mobileController,
                                        );
                                        // showModalBottomSheet(
                                        //   context: context,
                                        //   builder: (context) => Padding(
                                        //     padding: const EdgeInsets.all(16),
                                        //     child: Column(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment
                                        //               .spaceBetween,
                                        //       children: [
                                        //         CustomeTextField(
                                        //           controller: _mobileController,
                                        //           hintText: "+8801722-----",
                                        //         ),
                                        //         CustomButton(
                                        //           'U P D A T E',
                                        //           onTap: () {
                                        //             listMobile[index] =
                                        //                 _mobileController.text
                                        //                     .trim();
                                        //             Navigator.pop(context);
                                        //             setState(() {});
                                        //           },
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // );
                                      },
                                      label: Text(
                                        "${index + 1}.  ${listMobile[index]}",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )))),
                        ),
                        FloatingActionButton.small(
                          elevation: 0,
                          backgroundColor: Colors.deepPurple.shade200,
                          child: Icon(Icons.add),
                          onPressed: listMobile.length < 2
                              ? () {
                                  _mobileController.clear();
                                  // listMobile.length < 2
                                  //     ? listMobile.add(_mobileController.text)
                                  //     : null;
                                  if (listMobile.length > 2) return;
                                  setState(() {
                                    customeAlertDialog(
                                      context,
                                      title: 'A D D',
                                      onTap: () {
                                        if (_mobileController.text
                                                .trim()
                                                .length <
                                            10) {
                                          Navigator.pop(context);
                                          showSnakbar('E R R O R', context,
                                              color: Colors.red);
                                          return;
                                        }

                                        listMobile
                                            .add(_mobileController.text.trim());
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      controller: _mobileController,
                                    );
                                    // showModalBottomSheet(
                                    //   context: context,
                                    //   builder: (context) => Padding(
                                    //     padding: const EdgeInsets.all(16),
                                    //     child: ,
                                    //   ),
                                    // );
                                  });
                                }
                              : null,
                        )
                      ],
                    ),
                  ),
                  // ActionChip(
                  //     backgroundColor: Colors.transparent,
                  //     padding: EdgeInsets.symmetric(horizontal: 8),
                  //     avatar: Icon(
                  //       favorite ? Icons.favorite : Icons.favorite_border,
                  //       color: Colors.blueGrey,
                  //     ),
                  //     label: Text('Save to favorites'),
                  //     side: BorderSide(color: Colors.deepPurple.shade200),
                  //     onPressed: () {
                  //       setState(() {
                  //         favorite = !favorite;
                  //       });
                  //     }),

                  CustomButton(
                    'S A V E  U S E R',
                    onTap: () async {
                      try {
                        int id = DateTime.timestamp().microsecondsSinceEpoch;
                        UserModel data = UserModel(
                            id: DateTime.timestamp().microsecondsSinceEpoch,
                            adress: _adressController.text.trim(),
                            blood: bloodGroup,
                            email: widget.email,
                            img: imgPath,
                            name: widget.name,
                            password: widget.password,
                            phone: listMobile.toList());
                        await box
                            .put(
                                DateTime.timestamp()
                                    .microsecondsSinceEpoch
                                    .toString(),
                                data)
                            .then((value) => showSnakbar(
                                "S U C C E S S F U L Y  C R E A T  U S E R",
                                context,
                                color: Colors.deepPurple.withOpacity(.3)));
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                            (route) => false);
                      } catch (e) {
                        showSnakbar('E R R O R\n ${e}', context);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _bloodGroupOption() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Wrap(
        spacing: 12,
        // runSpacing: 12,

        alignment: WrapAlignment.start,

        runAlignment: WrapAlignment.spaceAround,
        // textDirection: TextDirection.rtl,
        // crossAxisAlignment: ,
        verticalDirection: VerticalDirection.up,
        children: List.generate(
            listOfblood.length,
            (val) => ActionChip(
                  labelPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  // padding: EdgeInsets.only(bottom: 12),
                  onPressed: () {
                    setState(() {
                      bloodGroup = listOfblood[val];
                      // index = val;
                    });
                  },
                  label: Text(
                    listOfblood[val],
                    style: TextStyle(
                        color: bloodGroup == listOfblood[val]
                            ? Colors.white
                            : Colors.black),
                  ),
                  backgroundColor: bloodGroup == listOfblood[val]
                      ? Colors.deepPurple.shade200
                      : Colors.white,
                )),
      ),
    );
  }
}

Future<dynamic> customeModalBottomSheet(
    BuildContext context, TextEditingController controller, String title,
    {required VoidCallback onTap}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomeTextField(
            controller: controller,
            hintText: "+8801722-----",
          ),
          CustomButton(
            title,
            onTap: onTap,
          ),
        ],
      ),
    ),
  );
}

class CustomeCard extends StatelessWidget {
  const CustomeCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Card(
        shape: RoundedRectangleBorder(
            // side: BorderSide.none,
            borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: child,
        ),
      ),
    );
  }
}

// bool favorite = false;

Future<dynamic> customeAlertDialog(BuildContext context,
    {required String title,
    required VoidCallback onTap,
    VoidCallback? onPressed,
    required TextEditingController controller}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomeTextField(
                maxLength: 14,
                inputType: TextInputType.phone,
                controller: controller,
                hintText: "+8801722-----",
              ),
            ],
          )
        ],
      ),
      actions: [
        onPressed != null
            ? CustomButton('C L E A R', onTap: onPressed)
            : SizedBox(),
        onPressed != null ? SizedBox(height: 12) : SizedBox(),
        CustomButton(title, onTap: onTap),
      ],
    ),
  );
}
