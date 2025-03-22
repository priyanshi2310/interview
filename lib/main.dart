import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
// import 'package:priyanshi_interview/calculator.dart';

import 'package:priyanshi_interview/to_do_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      home: ToDoList(),
      // initialRoute: 'HomeScreen',
      // routes: {
      //   'HomeScreen': (context) => const HomeScreen(),
      //   'EditScreen': (context) => EditScreen(onSave: (p0, p1, p2) {}),
      // },
    );
  }
}
