import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/authFlow/view/loginScreen.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final cx = Get.put(CommonController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    cx.instacareLoginValue = "instacare";
                    print(cx.instacareLoginValue);
                    toPushNavigator(context: context,PageName: LoginScreen());
                  },
                  child: Text("Instacare")),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    cx.instacareLoginValue = "faculty";
                    print(cx.instacareLoginValue);
                    toPushNavigator(context: context,PageName: LoginScreen());
                  },
                  child: Text("Faculty")),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    cx.instacareLoginValue = "employee";
                    print(cx.instacareLoginValue);
                    toPushNavigator(context: context,PageName: LoginScreen());
                  },
                  child: Text("Employee"))
            ],
          ),
        ),
      ),
    );
  }
}
