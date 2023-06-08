import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonContainer.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/availableEmployeesFlow/view/applyFilterScreen.dart';
import 'package:get/get.dart';
class AvailableEmployeesScreen extends StatefulWidget {
  const AvailableEmployeesScreen({Key? key}) : super(key: key);

  @override
  State<AvailableEmployeesScreen> createState() => _AvailableEmployeesScreenState();
}

class _AvailableEmployeesScreenState extends State<AvailableEmployeesScreen> {
  final cx=Get.put(CommonController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title:  MontserratText(
          text: "Apply Filter",
          color: AppColors.blue,
          fontSize: 24,
          fontWeight: FontWeight.w600,
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
                  height: 50,
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextFormField(
                    decoration:   InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search by name",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 14,
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
                  width: 40,
                  height: 40,
                ),
                onTap: (){
                  toPushNavigator(context: context,PageName: const ApplyFilterScreen());
                },
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(top: 11),
                child: CommonContainer(
                  child:Row(
                    children: [
                      Expanded(
                        flex:0,
                        child: Container(
                          height: 70,
                          width: 70,
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
                                  fontSize: 12,
                                  color: AppColors.blue,
                                ),
                                Row(
                                  children: [
                                    Image.asset(AppAssets.mail,width: 20,height: 16),
                                    const SizedBox(width: 10,),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(255, 175, 50, 0.2),
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                          width: 2,
                                          color: AppColors.yallow
                                        )
                                      ),
                                      child: InterText(
                                        text: "CAN",
                                        fontSize: 12,
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
                              fontSize: 22,
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
                                      fontSize: 14,
                                    )
                                  ],
                                ),
                                InterText(
                                  text: "Night-11:00PM-7:00AM",
                                  fontSize: 14,
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
                ),
              );
            }
          )
        ],
      ),
    );
  }
}
