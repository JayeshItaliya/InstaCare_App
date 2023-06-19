import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
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
                child: CommonDropDown(
                    context: context,
                    list: c.amount_range_arr,
                    mycontrollerValue: c.selected_amount_range,
                    color: AppColors.backGroundColor),
                height: Reponsive_.crosslength * 0.055),
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
            InterText(
              text: 'Only show shifts for the selected time frame',
              color: AppColors.hintTextGrey,
              fontSize: Reponsive_.crosslength * 0.015,
              fontWeight: FontWeight.w400,
              maxLines: 2,
            ),
            GridView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Reponsive_.crosslength*0.01,
                mainAxisExtent: Reponsive_.crosslength*0.065
              ),
              itemBuilder: (context, index) {
                return Wrap(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: Reponsive_.crosslength * 0.01,
                        horizontal: Reponsive_.crosslength * 0.01,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              Reponsive_.crosslength * 0.02),
                          color: AppColors.buttonColor),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/x/sun.png',
                            height: Reponsive_.crosslength * 0.025,
                            width: Reponsive_.crosslength * 0.025,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InterText(
                                text: '  Morning Shifts',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: Reponsive_.crosslength * 0.013,
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength * 0.005,
                              ),
                              InterText(
                                text: '  7:00AM - 3:00PM',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: Reponsive_.crosslength * 0.013,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Expanded(child: SizedBox()),
            SizedBox(
              height: Reponsive_.crosslength * 0.02,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onBack(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: Reponsive_.crosslength * 0.015),
                      decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: InterText(
                        text: "APPLY",
                        color: Colors.white,
                        fontSize: Reponsive_.crosslength * 0.02,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Reponsive_.crosslength * 0.01,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onBack(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: Reponsive_.crosslength * 0.015),
                      decoration: BoxDecoration(
                          color: AppColors.allGray,
                          borderRadius: BorderRadius.circular(50)),
                      child: InterText(
                        text: "RESET",
                        color: Colors.white,
                        fontSize: Reponsive_.crosslength * 0.02,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
