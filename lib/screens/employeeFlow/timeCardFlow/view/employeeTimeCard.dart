import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/employeeFlow/timeCardFlow/controller/employeeTimeController.dart';
import 'package:instacare/screens/employeeFlow/timeCardFlow/view/employeeFilterTimerScreen.dart';
import 'package:intl/intl.dart';

class EmployeeTimeCard extends StatefulWidget {
  const EmployeeTimeCard({super.key});

  @override
  State<EmployeeTimeCard> createState() => _EmployeeTimeCardState();
}

class _EmployeeTimeCardState extends State<EmployeeTimeCard> {
  DateTime currentDate = DateTime.now();
  final employeeTimeCardController=Get.put(EmployeeTimeController());
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      body: Obx(()=>
        ListView(
          key: Key(employeeTimeCardController.selectedTile.toString()),
          padding: EdgeInsets.symmetric(
              horizontal: Reponsive_.crosslength / 50,
              vertical: Reponsive_.crosslength / 25),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(""),
                MontserratText(
                  text: DateFormat('d, MMMM').format(currentDate),
                  fontWeight: FontWeight.w400,
                  color: AppColors.allGray,
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                    child: Image.asset(AppAssets.filtetr),
                  onTap: (){
                      toPushNavigator(context: context,PageName:  const EmployeeFilterTimerScreen());
                  },
                )
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context,index){
                return Padding(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.zero,
                    child:  ExpansionTile(
                      key: Key(index.toString()),
                      initiallyExpanded:index== employeeTimeCardController.selectedTile.value,
                      onExpansionChanged: (value) {
                        if(value){
                          employeeTimeCardController.selectedTile.value = index;
                        }
                        else{
                          employeeTimeCardController.selectedTile.value = -1;
                        }
                      },
                      tilePadding: EdgeInsets.zero,
                      trailing: Icon(Icons.access_time_filled,color: Colors.transparent),
                      title:Row(
                        children: [
                          Expanded(
                            flex:1,
                            child: Container(
                              width: Reponsive_.w/12,
                              height: Reponsive_.h/9,
                              decoration: ShapeDecoration(
                                image: const DecorationImage(
                                  image: NetworkImage("https://cdn.assistedlivingcenter.com/wp-content/uploads/2020/11/elevate-care-riverwoods-il.jpg"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: Reponsive_.crosslength/100,),
                          Expanded(
                            flex:3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InterText(
                                  text: "Elevate Care North Branch",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColors.black,
                                ),
                                SizedBox(height: Reponsive_.crosslength/200,),
                                InterText(
                                  text: "Tuesday, 21 March 2023",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.hintTextGrey,
                                ),
                                SizedBox(height: Reponsive_.crosslength/200,),
                                Row(
                                  children: [
                                    const Icon(Icons.access_time_filled_rounded,color: AppColors.buttonColor,),
                                    SizedBox(width: Reponsive_.crosslength/200,),
                                    InterText(
                                      text: "Clock In at 7:00AM",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppColors.buttonColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      children: [
                        SizedBox(
                          height: Reponsive_.crosslength/25,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(AppAssets.clockIn),
                                    SizedBox(width: 8),
                                    InterText(
                                      text: "Clock-In",
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    )
                                  ],
                                ),
                                InterText(
                                  text: "Saturday, 18 March",
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(2, 5, 10, 1),
                                ),
                                InterText(
                                  text: "7:00 AM",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blue,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(AppAssets.clockOut),
                                    SizedBox(width: 8),
                                    InterText(
                                      text: "Clock-In",
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    )
                                  ],
                                ),
                                InterText(
                                  text: "Saturday, 18 March",
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromRGBO(2, 5, 10, 1),
                                ),
                                InterText(
                                  text: "3:25 PM",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blue,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/50,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(AppAssets.downodTimeCard),
                                      SizedBox(width: 8,),
                                      InterText(
                                        text: "Download Timecard",
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blue,
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    child: InterText(
                                      text: "Report an Issue",
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blue,
                                    ),
                                    onTap: (){
                                      CommonBottonSheet(
                                          context: context,
                                          childView: ListView(
                                            shrinkWrap: true,
                                            children: [
                                              MontserratText(
                                                text: "Confirmation",
                                                textAlign: TextAlign.center,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.black,
                                                fontSize: 30,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text.rich(
                                                textAlign: TextAlign.center,
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Do you want to “',
                                                      style: GoogleFonts.inter(
                                                        fontSize: 18,
                                                        color: AppColors.allGray,
                                                        fontWeight: FontWeight.w500
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'Report" ',
                                                      style: GoogleFonts.inter(
                                                          fontSize: 18,
                                                          color: AppColors.black,
                                                          fontWeight: FontWeight.w500
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: 'all the selected shifts timecards?',
                                                      style: GoogleFonts.inter(
                                                          fontSize: 18,
                                                          color: AppColors.allGray,
                                                          fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ]
                                                )
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding:EdgeInsets.only(right: 8,left: 8),
                                                child: CommonDropDown(
                                                    context:context ,
                                                    list:employeeTimeCardController.selectReasonList,
                                                    mycontrollerValue: employeeTimeCardController.selectReasonValue,
                                                  color: AppColors.backGroundColor
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding:EdgeInsets.only(right: 8,left: 8),
                                                child: AppWidget().getTextField(
                                                  hintText: "Add Notes",
                                                  filledColor: AppColors.backGroundColor,
                                                  maxLine: 5,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding:   EdgeInsets.only(bottom: 10,right: 8,left: 8),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: CommonButton(
                                                        text: "Submit",
                                                        onTap: (){},
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Expanded(
                                                      child: CommonButton(
                                                        text: "Submit",
                                                        onTap: (){
                                                          onBack(context);
                                                        },
                                                        color: AppColors.allGray,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/50,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
            )

          ],
        ),
      ),
    );
  }
}
