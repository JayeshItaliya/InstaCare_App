
import 'package:instacare/Utils/appAssets.dart';

class DrawerItem{
  String name;
  String image;

  DrawerItem({required this.name,required this.image});

 static List<DrawerItem> drawerItem=[
    DrawerItem(
      name: "Dashboard",
      image: AppAssets.dashBoard,
    ),
    DrawerItem(
      name: "Schedules",
      image: AppAssets.schedules,
    ),
   DrawerItem(
     name: "My Availability",
     image: AppAssets.whosON,
   ),
   DrawerItem(
     name: "Marketplace",
     image: AppAssets.schedules,
   ),
    DrawerItem(
      name: "Who’s ON",
      image: AppAssets.whosON,
    ),
    DrawerItem(
      name: "People",
      image: AppAssets.people,
    ),
    DrawerItem(
      name: "Facilities",
      image: AppAssets.facilities,
    ),
   DrawerItem(
     name: "Payroll",
     image: AppAssets.people,
   ),
    DrawerItem(
      name: "Messaging",
      image: AppAssets.massages,
    ),
    DrawerItem(
      name: "Timecard",
      image: AppAssets.timecard,
    ),
    DrawerItem(
      name: "Total Billing",
      image: AppAssets.totalBilling,
    ),
    DrawerItem(
      name: "Support",
      image: AppAssets.support,
    ),

  ];
}