import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:instacare/screens/authFlow/splashScreen.dart';
import 'package:instacare/screens/profileFlow/view/profileScreen.dart';



void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    print("djkfjd");
    if (kDebugMode) {
      print("1556565656");
    }
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'InstaCare App',
           //home:ProfileScreen(),
           home:const SplashScreen(),
        );
      },

    );
  }
}
