import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/employeeFlow/facilitiesView/view/EmpFacilitiesScreenDeatils.dart';


class EmployeeFacilitiesScreen extends StatefulWidget {
  const EmployeeFacilitiesScreen({super.key});

  @override
  State<EmployeeFacilitiesScreen> createState() =>
      _EmployeeFacilitiesScreenState();
}

class _EmployeeFacilitiesScreenState extends State<EmployeeFacilitiesScreen> {
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: Reponsive_.crosslength * 0.02,
                left: Reponsive_.crosslength * 0.015,
                right: Reponsive_.crosslength * 0.015),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(Reponsive_.crosslength * 0.02)),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Image.asset('assets/profileFlow/search.png',
                    scale: 30, alignment: Alignment.center),
                isDense: true,
                fillColor: Colors.blue,
                border: InputBorder.none,
                hintText: 'Search by Name',
                helperStyle: GoogleFonts.inter(
                    color: AppColors.hintTextGrey, fontWeight: FontWeight.w400),
                contentPadding: EdgeInsets.only(
                    top: Reponsive_.crosslength * 0.015,
                    left: Reponsive_.crosslength * 0.015),
              ),
            ),
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.015,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      left: Reponsive_.crosslength * 0.015,
                      right: Reponsive_.crosslength * 0.02),
                  color: Color(0xFFEDEDED),
                  height: 2,
                ),
              ),
              InterText(
                  text: '56 FacilitiesScreen',
                  color: AppColors.hintTextGrey,
                  fontWeight: FontWeight.w600,
                  fontSize: Reponsive_.crosslength * 0.015),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      right: Reponsive_.crosslength * 0.015,
                      left: Reponsive_.crosslength * 0.02),
                  color: Color(0xFFEDEDED),
                  height: 2,
                ),
              ),
            ],
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    toPushNavigator(
                        context: context,
                        PageName: EmpFacilitiesScreenDeatils());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Reponsive_.crosslength * 0.01,
                        vertical: Reponsive_.crosslength * 0.01),
                    margin: EdgeInsets.only(
                        top: Reponsive_.crosslength * 0.01,
                        left: Reponsive_.crosslength * 0.02,
                        right: Reponsive_.crosslength * 0.02),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Container(
                          height: Reponsive_.crosslength * 0.07,
                          width: Reponsive_.crosslength * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                    "https://www.hospitalmanagement.net/wp-content/uploads/sites/9/2019/10/Beacon-Hospital.jpg",
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: Reponsive_.crosslength * 0.008,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InterText(
                                    text: 'Jasnah Kholin',
                                    color: Color(0xff02050A),
                                    fontSize: Reponsive_.crosslength * 0.015,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        CommonBottonSheet(
                                          context: context,
                                          backGroundColor: Color.fromRGBO(255, 231, 233, 1),
                                          childView: ListView(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            children: [
                                              SizedBox(
                                                height: 15,
                                              ),
                                              MontserratText(
                                                text: "Facility Info",
                                                fontSize: Reponsive_.px12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.blue,
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height:
                                                    Reponsive_.crosslength / 50,
                                              ),
                                              MontserratText(
                                                text: 'Confirmation',
                                                fontWeight: FontWeight.w700,
                                                fontSize: Reponsive_.px30,
                                                color: AppColors.redColor,
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height:
                                                    Reponsive_.crosslength / 90,
                                              ),
                                              InterText(
                                                text:
                                                    "Do you really want to delete this Facility? You no longer receive any shifts for this Facility.",
                                                textAlign: TextAlign.center,
                                                fontSize: Reponsive_.px16,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.black,
                                                maxLines: 3,
                                              ),
                                              SizedBox(
                                                height:
                                                    Reponsive_.crosslength / 90,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: CommonButton(
                                                        text: "YES",
                                                        onTap: () {
                                                          onBack(context);
                                                        },
                                                        color:
                                                            AppColors.redColor,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: CommonButton(
                                                        text: "NO",
                                                        onTap: () {},
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                      child: Image.asset(
                                        AppAssets.delete,
                                        color: AppColors.redColor,
                                        height: 14,
                                        width: 20,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength * 0.004,
                              ),
                              InterText(
                                text: 'CNA',
                                color: Color(0xff02050A),
                                fontSize: Reponsive_.crosslength * 0.015,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength * 0.008,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InterText(
                                    text: 'info@ecnb.com',
                                    color: AppColors.blue,
                                    fontSize: Reponsive_.crosslength * 0.015,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(AppAssets.downodTimeCard,
                                          width: 14, height: 10),
                                      InterText(
                                        text: ' Download ',
                                        color: AppColors.blue,
                                        fontSize:
                                            Reponsive_.crosslength * 0.015,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
