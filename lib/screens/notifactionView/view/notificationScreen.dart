import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:get/get.dart';
import '../../../Utils/appAssets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> with TickerProviderStateMixin  {
  late TabController controller;
  int selectedIndex = 0;
  final cx=Get.put(CommonController());
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2 , vsync: this);
    controller.addListener(() {
      setState(() {
        selectedIndex = controller.index;
      });
      print("Selected Index: " + controller.index.toString());
    });
  }
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MontserratText(
              text: "Notification",
              fontSize: Reponsive_.crosslength*0.040,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
          ),
          leadingWidth: cx.width / 1,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.clear,
                  color: AppColors.hintTextGrey,
                ))
          ],
          bottom: TabBar(
            controller: controller,
             onTap: (index){
              selectedIndex=index;
             },
             labelPadding: const EdgeInsets.only(bottom: 17),
            tabs: [
              InterText(
                  text: "Crucial",
                color:selectedIndex==0?AppColors.blue:AppColors.hintTextGrey,
                fontSize: Reponsive_.crosslength*0.025,
                fontWeight: FontWeight.w600,
              ),
              InterText(
                text: "Non-Crucial",
                color:selectedIndex==1?AppColors.blue:AppColors.hintTextGrey,
                fontSize: Reponsive_.crosslength*0.025,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            Crucial(),
            NonCrucial()
          ],
        ),
      ),
    );
  }

  Widget Crucial(){
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Container(
              alignment: Alignment.center,
              width: Reponsive_.crosslength*0.060,
              height: Reponsive_.crosslength*0.060,
              decoration: BoxDecoration(
                color: AppColors.redColor,
                shape: BoxShape.circle
              ),
              child:Image.asset(AppAssets.messages),
            ),
            title: InterText(
              text: "Albert Mariao has called off for the shift 15 min before.",
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: Reponsive_.crosslength*0.017,
              maxLines: 2,
            ),
             subtitle: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 InterText(
                   text: "Care Health Center",
                     color: AppColors.blue,
                   fontSize: Reponsive_.crosslength*0.015,
                   fontWeight: FontWeight.w600,
                 ),
                 InterText(
                   text: "Just now",
                   fontWeight:FontWeight.w600,
                   fontSize: Reponsive_.crosslength*0.017,
                   color: AppColors.redColor,
                 )
               ],
             ),
          ),
        );
      }
    );
  }

  Widget NonCrucial(){
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Container(
                alignment: Alignment.center,
                height: Reponsive_.crosslength*0.060,
                width: 60.w,
                decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    shape: BoxShape.circle
                ),
                child:Image.asset(AppAssets.messages),
              ),
              title: InterText(
                text: "Albert Mariao has called off for the shift 15 min before.",
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.crosslength*0.017,
                maxLines: 2,
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InterText(
                    text: "Care Health Center",
                    color: AppColors.blue,
                    fontSize: Reponsive_.crosslength*0.013,
                    fontWeight: FontWeight.w600,
                  ),
                  InterText(
                    text: "Just now",
                    fontWeight:FontWeight.w600,
                    fontSize: Reponsive_.crosslength*0.016,
                    color: AppColors.blue,
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
