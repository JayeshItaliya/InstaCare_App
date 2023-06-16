import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:get/get.dart';
import 'package:instacare/helper/date_conveter.dart';
import 'package:instacare/screens/dashBoardFlow/view/createReminderFlow/controller/createReminderController.dart';
class CreateReminderScreen extends StatefulWidget {
  const CreateReminderScreen({Key? key}) : super(key: key);

  @override
  State<CreateReminderScreen> createState() => _CreateReminderScreenState();
}

class _CreateReminderScreenState extends State<CreateReminderScreen> {

  final cx=Get.put(CommonController());
  final createReminderController=Get.put(CreateReminderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title: MontserratText(
          text: "Create Reminder",
          color: AppColors.blue,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: padding,
        children: [
          Obx(() =>
              InkWell(
            child: Container(
              width: cx.width,
              height: cx.height/10,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InterText(
                    text:createReminderController.selectedDate.value,
                    color:createReminderController.selectedDate.isEmpty? AppColors.hintTextGrey:AppColors.black,
                    fontWeight:createReminderController.selectedDate.isEmpty? FontWeight.w400:FontWeight.w600,
                    fontSize: 16,
                  ),
                  IconButton(
                      onPressed: (){
                        DateConverter.RangeDatePicker(
                          context: context,
                          dateRang: false,
                          monthType: false,
                          dateType: true
                        ).then((value){
                            createReminderController.selectedDate.value=value.toString();
                        });
                      },
                      icon: const Icon(Icons.calendar_today_outlined,color: AppColors.buttonColor,)
                  )
                ],
              ),
            ),
            onTap: (){
              DateConverter.RangeDatePicker(
                context: context,
                dateRang: false,
                monthType: false,
              ).then((value){
                  createReminderController.selectedDate.value=value.toString();
              });
            },
          )
          ),
          SizedBox(height: 15,),
          Obx(() => InkWell(
            child: Container(
              width: cx.width,
              height: cx.height/10,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InterText(
                    text:createReminderController.currentTime.value,
                    color:createReminderController.currentTime.isEmpty? AppColors.hintTextGrey:AppColors.black,
                    fontWeight:createReminderController.currentTime.isEmpty? FontWeight.w400:FontWeight.w600,
                    fontSize: 16,
                  ),
                  IconButton(
                      onPressed: (){
                        // displayTimePicker(context);
                        DateConverter.displayTimeDialog(context).then((value){
                          createReminderController.currentTime.value=value.toString();
                          print("currentTime==>$value");
                        });
                      },
                      icon: Image.asset(AppAssets.clock,height: 24,width: 24,)
                  )
                ],
              ),
            ),
            onTap: (){
              DateConverter.displayTimeDialog(context).then((value){
                createReminderController.currentTime.value=value.toString();
                print("currentTime==>$value");
              });
            },
          ),),
          SizedBox(height: 15,),
         CommonDropDown(
              context: context,
              list: createReminderController.items,
              mycontrollerValue: createReminderController.selectedValue,
            color: AppColors.white,
          ),
          SizedBox(height: 15,),
          CommonDropDown(
            context: context,
            list: createReminderController.items1,
            mycontrollerValue: createReminderController.selectedValue1,
            color: AppColors.white,
          ),
          SizedBox(height: 15,),
          Container(
            width: cx.width,

            margin: EdgeInsets.only(left: 12),
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30)),
            child: TextFormField(
              maxLines: 8,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintText: "Notes",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 25,),

          Row(
            children: [
              Expanded(
                child: CommonButton(
                  onTap: (){},
                  text: "Create",
                  color: AppColors.buttonColor,
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: CommonButton(
                  onTap: (){},
                  text: "Cancel",
                  color: AppColors.allGray,
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
  
}
