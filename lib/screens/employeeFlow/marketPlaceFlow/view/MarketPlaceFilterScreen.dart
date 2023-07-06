import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import '../controllers/MarketPlaceFilterController.dart';

class MarketPlaceFilterScreen extends StatefulWidget {
  const MarketPlaceFilterScreen({super.key});

  @override
  State<MarketPlaceFilterScreen> createState() =>
      _MarketPlaceFilterScreenState();
}

class _MarketPlaceFilterScreenState extends State<MarketPlaceFilterScreen> {
  TextEditingController _date_controller = TextEditingController();
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    final MarketPlaceFilterController c =
        Get.put(MarketPlaceFilterController());
    Reponsive_.init(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: Reponsive_.crosslength * 0.05,
          left: Reponsive_.crosslength * 0.02,
          right: Reponsive_.crosslength * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MontserratText(
                  text: 'Apply Filter',
                  color: Colors.black,
                  fontSize: Reponsive_.crosslength * 0.025,
                  fontWeight: FontWeight.w700,
                ),
                InkWell(
                    onTap: () {
                      onBack(context);
                    },
                    child: Icon(Icons.close_outlined)),
              ],
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.025,
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(),
                decoration: BoxDecoration(
                    // color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(50)),
                height: Reponsive_.crosslength * 0.055,
                child: CommonDropDown(
                    context: context,
                    list: c.amount_range_arr,
                    mycontrollerValue: c.selected_amount_range,
                    color: AppColors.white)),
            SizedBox(
              height: Reponsive_.crosslength * 0.025,
            ),
            InterText(
              text: 'Distance',
              color: Colors.black,
              fontSize: Reponsive_.crosslength * 0.02,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: InterText(
                  text: 'Show shifts within a certain distance',
                  color: AppColors.hintTextGrey,
                  fontSize: Reponsive_.crosslength * 0.015,
                  fontWeight: FontWeight.w400,
                  maxLines: 2,
                )),
                InterText(
                  text: '${_currentSliderValue.toInt()} miles',
                  color: AppColors.hintTextGrey,
                  fontSize: Reponsive_.crosslength * 0.017,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            Slider(
              value: _currentSliderValue,
              max: 100,
              activeColor: AppColors.buttonColor,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.02,
            ),
            InterText(
              text: 'Shift Time',
              color: Colors.black,
              fontSize: Reponsive_.crosslength * 0.02,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: Reponsive_.crosslength*0.01,
            ),
            InterText(
              text: 'Only show shifts for the selected time frame',
              color: AppColors.hintTextGrey,
              fontSize: Reponsive_.crosslength * 0.015,
              fontWeight: FontWeight.w400,
              maxLines: 2,
            ),
            SizedBox(
              height: Reponsive_.crosslength*0.01,
            ),
            GridView.builder(
              itemCount: selectTimeShift.length,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Reponsive_.crosslength*0.01,
                mainAxisExtent: Reponsive_.crosslength*0.065
              ),
              itemBuilder: (context, index) {
                TimeShift timeShift=selectTimeShift[index];
                return Wrap(
                  children: [
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: Reponsive_.crosslength * 0.01,
                          horizontal: Reponsive_.crosslength * 0.01,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Reponsive_.crosslength * 0.015),
                            color:timeShift.tapValue==true?AppColors.buttonColor:AppColors.white,
                          border:timeShift.tapValue==true?null:Border.all(width: 1.2, color: AppColors.buttonColor)
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              timeShift.icon.toString(),
                              height: Reponsive_.crosslength * 0.025,
                              width: Reponsive_.crosslength * 0.025,
                              color:timeShift.tapValue==true? Colors.white:AppColors.buttonColor,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InterText(
                                  text: '  ${timeShift.shift}',
                                  color:timeShift.tapValue==true? Colors.white:AppColors.buttonColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Reponsive_.crosslength * 0.013,
                                ),
                                SizedBox(
                                  height: Reponsive_.crosslength * 0.005,
                                ),
                                InterText(
                                  text: '  ${timeShift.time}',
                                  color:timeShift.tapValue==true? Colors.white:AppColors.buttonColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Reponsive_.crosslength * 0.013,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        setState(() {
                          timeShift.tapValue=!timeShift.tapValue;
                          print("timeShift==>${timeShift.shift}");
                        });
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: Reponsive_.crosslength*0.06,
        margin: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.02,vertical: Reponsive_.crosslength*0.02),
        child: Row(
          children: [
            Expanded(
              child: CommonButton(
                text: "APPLY",
                onTap: (){
                  onBack(context);
                },
              ),
            ),
            SizedBox(width: 8,),
            Expanded(
              child: CommonButton(
                text: "RESET",
                onTap: (){

                },
                color: AppColors.allGray,
              ),

            ),
          ],
        ),
      )
    );
  }
  List<TimeShift> selectTimeShift=[
    TimeShift(
      icon: AppAssets.sun,
      time: "7:00AM - 3:00PM",
      shift: "Morning Shifts",
      tapValue: false,
    ),
    TimeShift(
      icon: AppAssets.sun,
      time: "3:00PM - 11:00PM",
      shift: "Afternoon Shifts",
      tapValue: false,
    ),
    TimeShift(
      icon: AppAssets.night,
      time: "11:00PM - 7:00AM",
      shift: "Night Shifts",
      tapValue: false,
    )
  ];
}

class TimeShift{
  String? icon;
  String? time;
  String? shift;
  bool tapValue;

  TimeShift({this.time,this.tapValue=false,this.icon,this.shift});
}
