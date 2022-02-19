
import 'package:flutter/material.dart';
import 'package:krisha/colors/colors.dart';
import 'package:krisha/pages/home.dart';
import 'package:krisha/pages/sidescreen.dart';
import 'package:krisha/pages/userpost.dart';
import 'package:krisha/services/admin_log.dart';
import 'package:krisha/signup/login.dart';
import 'package:krisha/utils/sharedpreference_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


late SharedPreferences localStorage;

Future<void> main() async {
  // await PreferenceUtils.init();
  WidgetsFlutterBinding.ensureInitialized();
  localStorage = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paw Finder',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: LoginPage(),
        );
  }
}

