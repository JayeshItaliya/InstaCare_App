import 'package:flutter/material.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonDrower.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/notifactionView/view/notificationScreen.dart';
import 'package:instacare/screens/peopleFlow/view/peopleScreen.dart';
import 'package:instacare/screens/scheduleFlow/scheduleScreen.dart';
import 'package:instacare/screens/timeCardFlow/view/timeCardScreen.dart';
import 'package:instacare/screens/whoIsOnScreen/view/Who_Is_On_Screen.dart';
import 'Dashboard.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<Widget> screens = [
    Dashboard(),
    ScheduleScreen(),
    Who_Is_On_Screen(),
    PeopleScreen(),
    Text("Facilities"),
    Text("Messing"),
    TimeCardScreen()
  ];
  List<dynamic> title = [
    AppAssets.app,
    "Schedule",
    "Who's ON",
    "People",
    "Facilities",
    "Messing",
    "TimeCards",
  ];
  int selected_index=0;
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      key: globalKey,
      appBar: CommonAppBar(
        title:selected_index==0?Image.asset(title[0]): MontserratText(
            text: title[selected_index],
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.blue,
        ),
        icon: InkWell(
          child: Builder(
              builder: (context) {
                return Image.asset(
                  AppAssets.menu,
                  width: 20,
                  height: 20,
                );
              }
          ),
          onTap: (){
            globalKey.currentState!.openDrawer();
          },
        ),
        trailingIcon: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: (){
                toPushNavigator(context: context,PageName: const NotificationScreen());
              },
              child: Image.asset(
                AppAssets.bell,
                width: 30,
                height: 30,
              ),
            ),
          ),
        ],
      ),
      body: screens[selected_index],
      drawer: Drawer(
        width:  300,
        backgroundColor: Colors.transparent,
        child: CommonDrawer(onItemClick: (index){
          setState(() {
            selected_index=index;
          });
        }),
      ),
    );
  }




}
class Remander{
  String? time;
  String? messages;
  Remander({this.time,this.messages});
}
