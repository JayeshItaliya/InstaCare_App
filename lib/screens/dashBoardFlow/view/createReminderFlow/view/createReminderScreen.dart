import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/pageNavigator.dart';
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
  void initState() {
    // TODO: implement initState
  createReminderController.selectedValue.value="Select Staff type";
  createReminderController.selectedValue1.value="Reminder for";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title: MontserratText(
          text: "Create Reminder",
          color: AppColors.blue,
          fontSize: Reponsive_.px24,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: ListView(
        padding: padding,
        children: [
          Obx(() =>
              InkWell(
            child: Container(
              width: cx.width,
              height:Reponsive_.crosslength*0.06,
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
                    fontSize: Reponsive_.px16,
                  ),
                  IconButton(
                      onPressed: (){
                        DateConverter.RangeDatePicker(
                          context: context,
                          dateRang: true,
                          monthType: false,
                          dateType: false,
                        ).then((value){
                            createReminderController.selectedDate.value=value.toString();
                            print(createReminderController.selectedDate.value);
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
          SizedBox(height: Reponsive_.crosslength*0.01,),
          Obx(() => InkWell(
            child: Container(
              width: cx.width,
              height:Reponsive_.crosslength*0.06,
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
                    fontSize: Reponsive_.px16,
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
          SizedBox(height: Reponsive_.crosslength*0.01,),
         CommonDropDown(
              context: context,
              list: createReminderController.items,
              mycontrollerValue: createReminderController.selectedValue,
            color: AppColors.white,
           hint: "Select Staff type"
          ),
          SizedBox(height: Reponsive_.crosslength*0.01,),
          CommonDropDown(
            context: context,
            list: createReminderController.items1,
            mycontrollerValue: createReminderController.selectedValue1,
            color: AppColors.white,
            hint: "Reminder for"
          ),
          SizedBox(height: Reponsive_.crosslength*0.01,),
          AppWidget().getTextField(
            hintText: "Notes",
            filledColor: AppColors.white,
            maxLine: 7
          ),
          SizedBox(height: 25,),

          Row(
            children: [
              Expanded(
                child: CommonButton(
                  onTap: (){
                    onBack(context);
                  },
                  text: "CREATE",
                  color: AppColors.buttonColor,
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: CommonButton(
                  onTap: (){
                    onBack(context);
                  },
                  text: "CANCEL",
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
