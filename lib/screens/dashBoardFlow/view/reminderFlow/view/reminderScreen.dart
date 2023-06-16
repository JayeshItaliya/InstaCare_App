import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/view/createReminderFlow/view/createReminderScreen.dart';


class ReminderScreen extends StatefulWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  final cx=Get.put(CommonController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title: MontserratText(
          text: "Reminders",
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: AppColors.blue,
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          padding: padding,
          itemCount: item.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(left: 16, top: 15, right: 16, bottom: 8),
              margin: EdgeInsets.only(top: 10),
              width: cx.width,
              height: cx.height / 6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(width: 2, color: AppColors.yallow)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterText(
                        text: item[index].time,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blue,
                      ),
                      Icon(
                        Icons.notifications_active,
                        color: AppColors.yallow,
                      )
                    ],
                  ),
                  Gap(10.h),
                  InterText(
                    text: item[index].messages,
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  )
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.yallow,
        onPressed: (){
          toPushNavigator(context: context,PageName: const CreateReminderScreen());
        },
        child:Icon(Icons.add,color: AppColors.white) ,
      ),
    );
  }

  List<Remander> item = [
    Remander(
        time: "Today 11:45AM",
        messages:
            "Team meeting, brainstorming for the new application scheduling process."),
    Remander(
        time: "19 March 2023   12:00PM",
        messages: "Have to post message to the group."),
  ];
}

class Remander {
  String? time;
  String? messages;
  Remander({this.time, this.messages});
}
