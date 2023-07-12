import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/commonDrower.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/view/DashBoardScreen.dart';
import 'package:instacare/screens/employeeFlow/PayrollFlow/view/payrollAccess.dart';
import 'package:instacare/screens/employeeFlow/employeeDashBoardFlow/view/employeeDashBoardScreen.dart';
import 'package:instacare/screens/employeeFlow/facilitiesView/view/employeeFacilitiesScreen.dart';
import 'package:instacare/screens/employeeFlow/marketPlaceFlow/view/MarketPlaceScreen.dart';
import 'package:instacare/screens/employeeFlow/myAvailabilityFlow/screens/MyAvailability.dart';
import 'package:instacare/screens/employeeFlow/timeCardFlow/view/employeeTimeCard.dart';
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


  int selected_index=0;
  final globalKey = GlobalKey<ScaffoldState>();
  final cx = Get.put(CommonController());
@override
  void initState() {
  if(cx.instacareLoginValue.toString().contains("instacare")){
    cx.screens=instaWidget;
    cx.title=instaTitle;
    cx.image=instaImage;
    cx.drowerTitle=instaDrowerTitle;
  }
  else if(cx.instacareLoginValue.toString().contains("faculty")){
    cx.screens=instaFaculty;
    cx.title=instaFacultyTitle;
    cx.image=facultyImage;
    cx.drowerTitle=facultyDrowerTitle;
  }
  else if(cx.instacareLoginValue.toString().contains("employee")){
      cx.screens=instaEmployee;
      cx.title=instaEmployeeTitle;
      cx.image=employeeImage;
      cx.drowerTitle=employeeDrowerTitle;
  }
  super.initState();
}
  @override
  Widget build(BuildContext context) {

    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      key: globalKey,
      appBar: CommonAppBar(
        title:selected_index==0?Image.asset(cx.title[0],height: 27,):
        MontserratText(
            text: cx.title[selected_index],
          fontSize: Reponsive_.px24,
          fontWeight: FontWeight.w700,
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
      body: cx.screens[selected_index],
      drawer: Drawer(
        width:  Reponsive_.crosslength*0.35,
        backgroundColor: Colors.transparent,
        child: CommonDrawer(onItemClick: (index){
          setState(() {
            selected_index=index;
          });
        }),
      ),
    );
  }
  List<Widget> instaWidget=[
    Dashboard(),
    ScheduleScreen(),
    WhoIsOnScreen(),
    PeopleScreen(),
    FacilitiesScreen(),
    MessagesScreen(),
    TimeCardScreen(),
    TotalBillingScreen(),
    SupportScreen(),
  ];

List<String> instaTitle=[
  AppAssets.app,
  "Schedule",
  "Who's ON",
  "People",
  "Facilities",
  "Messaging",
  "TimeCard",
  "Total Billing",
  "Support",
];

  List<Widget> instaFaculty=[
    Dashboard(),
    ScheduleScreen(),
    WhoIsOnScreen(),
    PeopleScreen(),
    MessagesScreen(),
    TimeCardScreen(),
    TotalBillingScreen(),
    SupportScreen(),
  ];

  List<String> instaFacultyTitle=[
    AppAssets.app,
    "Schedule",
    "Who's ON",
    "People",
    "Messaging",
    "TimeCard",
    "Total Billing",
    "Support",
  ];

  List<Widget> instaEmployee=[
    EmployeeDashBoardScreen(),
    MyAvailability(showAppBar: false),
    MarketPlaceScreen(showAppApr: false),
    EmployeeTimeCard(),
    MessagesScreen(),
    EmployeeFacilitiesScreen(),
    PayrollAccessScreen(),
    SupportScreen(),
  ];

  List<String> instaEmployeeTitle=[
    AppAssets.dashbard,
    "My Availability",
    "Marketplace",
    "TimeCards",
    "Messaging",
    "Facilities",
    "Payroll",
    "Support",
  ];
  List<String> instaImage=[
    AppAssets.dashBoard,
    AppAssets.schedules,
    AppAssets.whosON,
    AppAssets.people,
    AppAssets.facilities,
    AppAssets.massages,
    AppAssets.timecard,
    AppAssets.totalBilling,
    AppAssets.support,
  ];
  List<String> facultyImage=[
    AppAssets.dashBoard,
    AppAssets.schedules,
    AppAssets.whosON,
    AppAssets.people,
    AppAssets.facilities,
    AppAssets.timecard,
    AppAssets.totalBilling,
    AppAssets.support,
  ];
  List<String> employeeImage=[
    AppAssets.dashBoard,
    AppAssets.whosON,
    AppAssets.schedules,
    AppAssets.timecard,
    AppAssets.massages,
    AppAssets.facilities,
    AppAssets.people,
    AppAssets.support,
    AppAssets.massages,
  ];

  List<String> instaDrowerTitle=[
    "Dashboard",
    "Schedule",
    "Who's ON",
    "People",
    "Facilities",
    "Messaging",
    "TimeCard",
    "Total Billing",
    "Support",
  ];
  List<String> facultyDrowerTitle=[
    "Dashboard",
    "Schedule",
    "Who's ON",
    "People",
    "Messaging",
    "TimeCard",
    "Total Billing",
    "Support",
  ];
  List<String> employeeDrowerTitle=[
    "Dashboard",
    "My Availability",
    "Marketplace",
    "TimeCards",
    "Messaging",
    "Facilities",
    "Payroll",
    "Support",
  ];
}
