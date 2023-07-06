import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonDropDown.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/helper/date_conveter.dart';
import 'package:instacare/screens/scheduleFlow/controller/editSchedulShiftController.dart';
import 'package:intl/intl.dart';

class EditScheduleShift extends StatefulWidget {
  const EditScheduleShift({super.key});

  @override
  State<EditScheduleShift> createState() => _EditScheduleShiftState();
}

class _EditScheduleShiftState extends State<EditScheduleShift> {
  final editSheduleController=Get.put(EditScheduleShiftController());
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        icon: IconButton(
          icon: Icon(Icons.arrow_back,color: AppColors.black),
          onPressed: (){
            onBack(context);
          },
        ),
        title: MontserratText(
          text: "Edit Shift",
          color: AppColors.blue,
          fontWeight: FontWeight.w700,
          fontSize: Reponsive_.px24,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: padding,
        children: [
          SizedBox(
            height: Reponsive_.crosslength/60,
          ),
          InterText(
            text: "      Facility",
            fontWeight: FontWeight.w600,
            fontSize: Reponsive_.px16,
            color: AppColors.black,
          ),
          SizedBox(
            height: Reponsive_.crosslength/110,
          ),
          CommonDropDown(
              context: context,
              list: editSheduleController.facilityList,
              mycontrollerValue: editSheduleController.facilityValue,
            color: AppColors.white
          ),
          SizedBox(
            height: Reponsive_.crosslength/85,
          ),
          InterText(
            text: "      Role",
            fontWeight: FontWeight.w600,
            fontSize: Reponsive_.px16,
            color: AppColors.black,
          ),
          SizedBox(
            height: Reponsive_.crosslength/110,
          ),
          CommonDropDown(
              context: context,
              list: editSheduleController.roleList,
              mycontrollerValue: editSheduleController.roleValue,
              color: AppColors.white
          ),

          SizedBox(
            height: Reponsive_.crosslength/85,
          ),
          InterText(
            text: "      Number of Positions (Open Shifts)",
            fontWeight: FontWeight.w600,
            fontSize: Reponsive_.px16,
            color: AppColors.black,
          ),
          SizedBox(
            height: Reponsive_.crosslength/110,
          ),
          CommonDropDown(
              context: context,
              list: editSheduleController.numberOfPositionList,
              mycontrollerValue: editSheduleController.numberOfPositionValue,
              color: AppColors.white
          ),
          SizedBox(
            height: Reponsive_.crosslength/85,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(
                      text: "      Start Date",
                      fontSize: Reponsive_.px16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    SizedBox(height: Reponsive_.crosslength/100,),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(left: Reponsive_.crosslength/100,right: Reponsive_.crosslength/100,),
                       decoration: BoxDecoration(
                         color: AppColors.white,
                         borderRadius: BorderRadius.circular(30)
                       ),
                        height: Reponsive_.crosslength/15,
                        width: Reponsive_.crosslength/5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                            ()=> InterText(
                                text: editSheduleController.startDate.value,
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: Reponsive_.px16,
                              ),
                            ),
                              Icon(Icons.calendar_today_outlined,color: AppColors.buttonColor),
                          ],
                        ),
                      ),
                      onTap: (){
                        DateConverter.RangeDatePicker(
                          context: context,
                          monthType: false,
                          dateRang: false,
                          dateType: true,
                        ).then((value){
                          if(value!=null){
                            editSheduleController.startDate.value=value.toString();
                          }
                        });
                      },
                    )
                  ],
                ),
              ),
              SizedBox(width:Reponsive_.crosslength/110,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(
                      text: "      End Date",
                      fontSize: Reponsive_.px16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    SizedBox(height: Reponsive_.crosslength/100,),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(left: Reponsive_.crosslength/100,right: Reponsive_.crosslength/100,),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        height: Reponsive_.crosslength/15,
                        width: Reponsive_.crosslength/5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                                ()=> InterText(
                                text: editSheduleController.endDate.value,
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: Reponsive_.px16,
                              ),
                            ),
                             Icon(Icons.calendar_today_outlined,color: AppColors.buttonColor),
                          ],
                        ),
                      ),
                      onTap: (){
                        DateConverter.RangeDatePicker(
                          context: context,
                          monthType: false,
                          dateRang: false,
                          dateType: true,
                        ).then((value){
                          if(value!=null){
                            print(DateTime.now());
                            editSheduleController.endDate.value=value.toString();
                          }
                        });
                      },
                    )
                  ],
                )
              )
            ],
          ),
          SizedBox(
            height: Reponsive_.crosslength/85,
          ),
          InterText(
            text: "      Shift Time",
            fontWeight: FontWeight.w600,
            fontSize: Reponsive_.px16,
            color: AppColors.black,
          ),
          SizedBox(
            height: Reponsive_.crosslength/85,
          ),
           ListView.builder(
              itemCount: editSheduleController.shiftTime.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Obx(
                    ()=> Row(
                    children: [
                      Checkbox(
                        shape: CircleBorder(),
                        value: editSheduleController.selectedIndex==index,
                        activeColor: AppColors.buttonColor,
                        onChanged: (bool? newValue) {
                            editSheduleController.selectedIndex.value=index;
                        },
                      ),
                      SizedBox(
                        width: Reponsive_.crosslength/110,
                      ),
                      GestureDetector(
                        child: InterText(
                          text:editSheduleController.shiftTime[index].toString(),
                          fontSize: Reponsive_.px18,
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        onTap: (){
                          editSheduleController.selectedIndex.value=index;
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          SizedBox(
            height: Reponsive_.crosslength/85,
          ),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(
                      text: "      Incentives",
                      fontWeight: FontWeight.w600,
                      fontSize: Reponsive_.px16,
                      color: AppColors.black,
                    ),
                    Row(
                      children: [
                         Radio(
                            value: Incentives.Yes,
                            groupValue: editSheduleController.incentives,
                            activeColor: AppColors.buttonColor,
                            onChanged: (Incentives? value) {
                                editSheduleController.incentives=value!;
                            },
                          ),

                        InterText(
                          text: "Yes",
                          fontSize: Reponsive_.px16,
                          fontWeight: FontWeight.normal,
                          color: AppColors.hintTextGrey,
                        ),
                         Radio(
                            value: IncentiveType.$hr,
                            groupValue: editSheduleController.incentiveType,
                            activeColor: AppColors.buttonColor,
                            onChanged: (IncentiveType? value) {

                                editSheduleController.incentiveType = value!;

                            },

                        ),
                        InterText(
                          text: "NO",
                          fontSize: Reponsive_.px16,
                          fontWeight: FontWeight.normal,
                          color: AppColors.hintTextGrey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width:Reponsive_.crosslength/110,),
              Expanded(
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(
                      text: "      Incentive By",
                      fontWeight: FontWeight.w600,
                      fontSize: Reponsive_.px16,
                      color: AppColors.black,
                    ),
                    CommonDropDown(
                        context: context,
                        list: editSheduleController.facilityList,
                        mycontrollerValue: editSheduleController.facilityValue,
                        color: AppColors.white
                    ),
                  ],
                )
                ),

            ],
          ),

          SizedBox(
            height: Reponsive_.crosslength/85,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(
                      text: "      Incentive Type",
                      fontWeight: FontWeight.w600,
                      fontSize: Reponsive_.px16,
                      color: AppColors.black,
                    ),
                    Row(
                      children: [
                        Radio(
                          value: Incentives.Yes,
                          groupValue: editSheduleController.incentives,
                          activeColor: AppColors.buttonColor,
                          onChanged: (Incentives? value) {

                              editSheduleController.incentives=value!;

                          },
                        ),

                        InterText(
                          text: "\$/hr",
                          fontSize: Reponsive_.px16,
                          fontWeight: FontWeight.normal,
                          color: AppColors.hintTextGrey,
                        ),
                        Radio(
                          value: IncentiveType.$hr,
                          groupValue: editSheduleController.incentiveType,
                          activeColor: AppColors.buttonColor,
                          onChanged: (IncentiveType? value) {

                              editSheduleController.incentiveType = value!;

                          },

                        ),
                        InterText(
                          text: "Fix.".toUpperCase(),
                          fontSize: Reponsive_.px16,
                          fontWeight: FontWeight.normal,
                          color: AppColors.hintTextGrey,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width:Reponsive_.crosslength/110,),
              Expanded(
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "      Incentive Amount",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px16,
                        color: AppColors.black,
                      ),
                      CommonDropDown(
                          context: context,
                          list: editSheduleController.facilityList,
                          mycontrollerValue: editSheduleController.facilityValue,
                          color: AppColors.white
                      ),
                    ],
                  )
              ),

            ],
          ),


          SizedBox(
            height: Reponsive_.crosslength/85,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(
                      text: "      Floor Number",
                      fontWeight: FontWeight.w600,
                      fontSize: Reponsive_.px16,
                      color: AppColors.black,
                    ),
                    CommonDropDown(
                        context: context,
                        list: editSheduleController.facilityList,
                        mycontrollerValue: editSheduleController.facilityValue,
                      color: AppColors.white
                    ),
                  ],
                ),
              ),
              SizedBox(width:Reponsive_.crosslength/110,),
              Expanded(
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "      Supervisor",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px16,
                        color: AppColors.black,
                      ),
                      CommonDropDown(
                          context: context,
                          list: editSheduleController.facilityList,
                          mycontrollerValue: editSheduleController.facilityValue,
                          color: AppColors.white
                      ),
                    ],
                  )
              ),

            ],
          ),

          SizedBox(
            height: Reponsive_.crosslength/85,
          ),
          InterText(
            text: "      Notes",
            fontWeight: FontWeight.w600,
            fontSize: Reponsive_.px16,
            color: AppColors.black,
          ),
          SizedBox(
            height: Reponsive_.crosslength/85,
          ),
          AppWidget().getTextField(
            filledColor: AppColors.white,
            maxLine: 5
          ),
          SizedBox(
            height: Reponsive_.crosslength/50,
          ),
          Padding(
            padding:   EdgeInsets.only(left: Reponsive_.crosslength/110,right: Reponsive_.crosslength/110),
            child: Row(
              children: [
                Expanded(
                    child: CommonButton(
                      text: "Update".toUpperCase(),
                      onTap: (){},
                    )
                ),
                SizedBox(width: Reponsive_.crosslength/110),
                Expanded(
                    child: CommonButton(
                      text: "Assign".toUpperCase(),
                      onTap: (){},
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
