import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_db/home/ui/home_screen.dart';
import 'package:user_db/sign_up/background.dart';
import 'package:user_db/sign_up/ui/sign_up_screen.dart';
import 'package:user_db/sign_up/ui/steper/steper_one.dart';
import 'package:user_db/user_list/models/user_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  var box = await Hive.openBox<UserModel>('users');
  // await box.clear();
  // await box.add(UserModel(name: 'Goutom'));
  print(box.values.toList());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple.withOpacity(.6),
            brightness: Brightness.light),
        // useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
