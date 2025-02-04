import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonContainer.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/commonDrower.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:get/get.dart';
import 'package:instacare/screens/dashBoardFlow/view/availableEmployeesFlow/view/applyFilterScreen.dart';
class AvailableEmployeesScreen extends StatefulWidget {
  const AvailableEmployeesScreen({Key? key}) : super(key: key);

  @override
  State<AvailableEmployeesScreen> createState() => _AvailableEmployeesScreenState();
}

class _AvailableEmployeesScreenState extends State<AvailableEmployeesScreen> {
  final cx=Get.put(CommonController());
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      key: globalKey,
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title:  MontserratText(
          text: "Available Employees",
          color: AppColors.blue,
          fontSize: Reponsive_.px24,
          fontWeight: FontWeight.w700,
        ),
        icon: IconButton(
          icon: const Icon(Icons.arrow_back,color: AppColors.black),
          onPressed: (){
            onBack(context);
          },
        ),
      ),
      body: ListView(
        padding: padding,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: Reponsive_.crosslength*0.05,
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextFormField(
                    decoration:   InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search by name",
                        isDense: true,
                        hintStyle: GoogleFonts.inter(
                            fontSize: Reponsive_.px14,
                            color: AppColors.hintTextGrey,
                            fontWeight: FontWeight.w400
                        )
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              GestureDetector(
                child: Image.asset(
                  AppAssets.filtetr,
                  scale: 1.2,
                ),
                onTap: (){
                  toPushNavigator(context: context,PageName: const ApplyFilterScreen());
                },
              )
            ],
          ),

          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return CommonContainer(
                child:Row(
                  children: [
                    Expanded(
                      flex:0,
                      child: Container(
                        height: Reponsive_.crosslength*0.055,
                        width: Reponsive_.crosslength*0.055,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.buttonColor,
                            width: 3,
                          ),
                          image: const DecorationImage(
                            image: NetworkImage("https://icon2.cleanpng.com/20180404/ofw/kisspng-physician-nursing-health-care-hospital-the-doctor-5ac54ae57953b0.863345251522879205497.jpg"),
                            fit: BoxFit.fitHeight
                          )
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InterText(
                                text: "12 March 2023",
                                fontWeight: FontWeight.w600,
                                fontSize: Reponsive_.px12,
                                color: AppColors.blue,
                              ),
                              Row(
                                children: [
                                  Image.asset(AppAssets.mail, scale: 1.2,),
                                  const SizedBox(width: 10,),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.015,vertical: Reponsive_.crosslength*0.005),
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(255, 175, 50, 0.2),
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.yallow
                                      )
                                    ),
                                    child: InterText(
                                      text: "CAN",
                                      fontSize: Reponsive_.px12,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.yallow,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          InterText(
                            text: "Jasnah Kholin",
                            fontWeight: FontWeight.w600,
                            fontSize: Reponsive_.px18,
                            color: AppColors.black,
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      color: AppColors.deepGreen,
                                       shape: BoxShape.circle
                                    ),
                                  ),
                                  const SizedBox(width: 8,),
                                  InterText(
                                    text: "Available",
                                    color: const Color.fromRGBO(2, 5, 10, 0.5),
                                    fontWeight: FontWeight.w400,
                                    fontSize: Reponsive_.px14,
                                  )
                                ],
                              ),
                              InterText(
                                text: "Night-11:00PM-7:00AM",
                                fontSize: Reponsive_.px14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.blue,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ) ,
              );
            }
          )
        ],
      ),
    );
  }
}
