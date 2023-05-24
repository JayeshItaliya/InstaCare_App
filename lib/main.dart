import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/screens/authFlow/splashScreen.dart';

import 'package:instacare/screens/profileFlow/profileScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InstaCare App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:ProfileScreen(),
      home:const SplashScreen(),
    );
  }
}
