import 'package:flutter/material.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/Utils/storeToken.dart';
import 'package:instacare/screens/authFlow/view/loginScreen.dart';
import 'package:instacare/screens/dashBoardFlow/view/dashBoardMainScreen.dart';
import 'package:instacare/test.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToScreen();
  }
  // getToken(){
  //   FirebaseMessaging.instance.getToken().then((value) {
  //     String? token = value;
  //     print("deviceToken====>$token");
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image:DecorationImage(
                image: AssetImage(
                  AppAssets.splashPage,
                ),
                fit: BoxFit.cover
            )
        ),

      ),
    );
  }
  navigateToScreen() async {
    await Future.delayed(Duration(seconds: 2), (){
      StorageUtil.getData(StorageUtil.loginValue).then((value){
        print("loginValue===>${value}");
        if(value==true){
          offNavigator(context: context,PageName: DashBoardScreen());
        }
        else{
          offNavigator(context: context,PageName: LoginScreen());
        }
      });
    });
  }
}


