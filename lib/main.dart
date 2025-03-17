import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
import 'package:priyanshi_interview/home.dart';
import 'package:priyanshi_interview/sign_in_screen.dart';
import 'package:priyanshi_interview/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // home: const HomeScreen(),
      initialRoute: 'SigninScreen',
      routes: {
        'SignUpScreen': (context) => const SignUpScreen(),
        'SigninScreen': (context) => const SigninScreen(),
        'HomeScreen': (context) => const HomeScreen(),
      },
    );
  }
}
