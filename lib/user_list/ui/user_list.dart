import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_db/sign_up/background.dart';
import 'package:user_db/user_list/models/user_model.dart';
import 'package:user_db/widgets/custom_button.dart';

class UserListScreen extends StatelessWidget {
  UserListScreen({super.key});
  var box = Hive.box<UserModel>('users');
  @override
  Widget build(BuildContext context) {
    return CustomeBackground(
        body: Center(
      child: ListenableBuilder(
        listenable: box.listenable(),
        builder: (context, child) {
          if (box.values.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: box.values.toList().length,
              itemBuilder: (context, index) {
                final user = box.values.toList()[index];
                return Card(
                  child: ExpansionTile(
                    trailing: IconButton(
                      icon: Icon(Icons.abc),
                      onPressed: () {},
                    ),
                    expandedAlignment: Alignment.centerLeft,
                    // expandedCrossAxisAlignment: CrossAxisAlignment.start,

                    title: Text(box.values.toList()[index].name.toString()),
                    leading: ClipOval(
                      child: Image.asset(
                        user.img.toString(),
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // initiallyExpanded: true,
                    subtitle: Text(user.email.toString()),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      children: [Text('DO YO WANT TO DELETE?')],
                                    ),
                                    actions: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: CustomButton(
                                            'N O',
                                            onTap: () => Navigator.pop(context),
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
            ),
          );
        },
      ),
    ));
  }
}
