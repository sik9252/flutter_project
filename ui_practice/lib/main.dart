import 'package:flutter/material.dart';
import 'package:ui_practice/common/common.dart';
import 'package:ui_practice/screens/home/s_home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello flutter!',
      home: Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          backgroundColor: AppColors.black,
          toolbarHeight: 68,
          actions: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hey, Selena",
                  style:
                      TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Text(
                  'Welcome back',
                  style: TextStyle(color: AppColors.white, fontSize: 16),
                ),
              ],
            ),
            width20
          ],
        ),
        body: const Home(),
      ),
    );
  }
}
