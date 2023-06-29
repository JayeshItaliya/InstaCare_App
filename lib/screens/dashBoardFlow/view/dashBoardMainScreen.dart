import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonDrower.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/view/DashboardScreen.dart';
import 'package:instacare/screens/employeeFlow/PayrollFlow/view/payrollAccess.dart';
import 'package:instacare/screens/employeeFlow/employeeDashBoardFlow/view/employeeDashboardScreen.dart';
import 'package:instacare/screens/employeeFlow/facilitiesView/view/employeeFacilitiesScreen.dart';
import 'package:instacare/screens/employeeFlow/marketPlaceFlow/view/MarketPlaceScreen.dart';
import 'package:instacare/screens/employeeFlow/myAvailabilityFlow/screens/MyAvailability.dart';
import 'package:instacare/screens/facilitiesFlow/view/Facilities.dart';
import 'package:instacare/screens/messagesFlow/view/MessagesScreen.dart';
import 'package:instacare/screens/notifactionFlow/view/notificationScreen.dart';
import 'package:instacare/screens/peopleFlow/view/peopleScreen.dart';
import 'package:instacare/screens/scheduleFlow/view/scheduleScreen.dart';
import 'package:instacare/screens/supportFlow/view/supportScreen.dart';
import 'package:instacare/screens/timeCardFlow/view/timeCardScreen.dart';
import 'package:instacare/screens/totalbillingFlow/view/TotalBillingScreen.dart';
import 'package:instacare/screens/whoIsOnFlow/view/Who_Is_On_Screen.dart';


class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<Widget> screens = [
    //Dashboard(),
    EmployeeDashBoardScreen(),
    ScheduleScreen(),
    MyAvailability(),
    MarketPlaceScreen(showAppApr: false),
    WhoIsOnScreen(),
    PeopleScreen(),
    //EmployeeFacilitiesScreen(),`
    FacilitiesScreen(),
    PayrollAccessScreen(),
    MessagesScreen(),
    TimeCardScreen(),
    TotalBillingScreen(),
    SupportScreen(),
  ];
  List<dynamic> title = [
    AppAssets.app,
    "Schedule",
    "My Availability",
    "Marketplace",
    "Who's ON",
    "People",
    "Facilities",
    "Payroll",
    "Messaging",
    "TimeCards",
    "Total Billing",
    "Support",
  ];
  int selected_index=0;
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      key: globalKey,
      appBar: CommonAppBar(
        title:selected_index==0?Image.asset(title[0],height: 27,):
        MontserratText(
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
                toPushNavigator(context: context,PageName:  NotificationScreen());
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
        width:  Reponsive_.crosslength*0.38,
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

