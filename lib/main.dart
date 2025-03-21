import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
import 'package:priyanshi_interview/edit_screen.dart';
import 'package:priyanshi_interview/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      home: const HomeScreen(),
      initialRoute: 'HomeScreen',
      routes: {
        'HomeScreen': (context) => const HomeScreen(),
        'EditScreen': (context) => EditScreen(onSave: (p0, p1, p2) {}),
      },
    );
  }
}
