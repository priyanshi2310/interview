import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //  floatingActionButton: FloatingActionButton(
      // onPressed: controller.increment,
      // child: Icon(Icons.add)
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Home Screen',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}
