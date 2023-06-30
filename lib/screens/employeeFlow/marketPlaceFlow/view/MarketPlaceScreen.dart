import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonContainer.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/helper/date_conveter.dart';
import 'package:instacare/screens/employeeFlow/marketPlaceFlow/view/shiftDeatilsScreen.dart';
import 'MarketPlaceFilterScreen.dart';

class MarketPlaceScreen extends StatefulWidget {
  bool showAppApr;
    MarketPlaceScreen({super.key,required this.showAppApr});

  @override
  State<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen>  with SingleTickerProviderStateMixin{
  PageController _controller = PageController(
    initialPage: 0,
  );
  final globalKey = GlobalKey<ScaffoldState>();
  final cx = Get.put(CommonController());
  int selectedIndex=0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        key: globalKey,
        appBar:widget.showAppApr==true? CommonAppBar(
          icon: IconButton(
            icon: Icon(Icons.arrow_back,color: AppColors.black),
            onPressed: (){},
          ),
          title: MontserratText(
            text: "Marketplace",
            fontSize: Reponsive_.px24,
            fontWeight: FontWeight.w600,
            color: AppColors.blue,
          ),
        ):null,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Colors.white,
              child: TabBar(
                controller:_tabController ,

                indicatorColor: Colors.white,
                onTap: (index){
                  setState(() {
                    selectedIndex=index;
                    _controller.animateToPage(selectedIndex, duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
                  });
                },
                tabs: [
                  Container(

                    height: Reponsive_.crosslength*0.055,
                    decoration: BoxDecoration(
                        color: Colors.white,
                      border: Border(bottom: BorderSide(color: selectedIndex==0?AppColors.blue:AppColors.white,width: 3))
                    ),
                    alignment: Alignment.center,
                    child: InterText(
                      text: 'All Shifts',
                      color:selectedIndex==0?AppColors.blue: AppColors.hintTextGrey,
                      fontSize: Reponsive_.crosslength*0.018,
                      fontWeight: FontWeight.w600,
                    ),
                  ),Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(bottom: BorderSide(color: selectedIndex==1?AppColors.blue:AppColors.white,width: 3))
                    ),
                    height: Reponsive_.crosslength*0.055,
                    alignment: Alignment.center,
                    child: InterText(
                      text: 'Preferred Shifts',
                      color: selectedIndex==1?AppColors.blue: AppColors.hintTextGrey,
                      fontSize: Reponsive_.crosslength*0.018,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: Reponsive_.crosslength*0.005,left: Reponsive_.crosslength*0.015,right: Reponsive_.crosslength*0.008),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Reponsive_.crosslength*0.025)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        isDense: true,fillColor: Colors.blue,
                        border: InputBorder.none,
                        hintText: '23/4/2023 - 29/4/2023',
                        suffixIcon: GestureDetector(
                            child: Image.asset('assets/x/calendar.png',scale: 3,alignment: Alignment.centerLeft),
                          onTap: (){
                              DateConverter.RangeDatePicker(
                                  context: context,
                                  monthType: false,
                                  dateRang: false
                              );
                          },
                        ),
                        helperStyle: GoogleFonts.inter(color:AppColors.hintTextGrey,fontWeight: FontWeight.w400 ),
                        contentPadding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.02,vertical: Reponsive_.crosslength*0.015),
                      ),

                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    toPushNavigator(
                        context: context, PageName: MarketPlaceFilterScreen());
                  },
                  child: Padding(
                    padding:EdgeInsets.only(top: Reponsive_.crosslength*0.005,right: Reponsive_.crosslength*0.015),
                    child: Image.asset(AppAssets.filtetr,alignment: Alignment.center,),
                  ),
                )
              ],
            ),
            SizedBox(height: Reponsive_.crosslength*0.005,),
            Flexible(
              child: PageView(
                controller: _controller,
                onPageChanged: (i){
                  setState(() {
                    selectedIndex=i;
                  });
                },
                children: const [
                  Page(),
                  Page(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page>{


  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              CommonBottonSheet(
                  context: context,
                  childView: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(
                        height: Reponsive_.crosslength/60,
                      ),
                      MontserratText(
                        text: "Shift Details".toUpperCase(),
                        fontWeight: FontWeight.w400,
                        color: AppColors.blue,
                        fontSize: Reponsive_.px12,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/40,
                      ),
                      MontserratText(
                        text: "7:00AM - 3:00PM",
                        fontWeight: FontWeight.w700,
                        color: AppColors.blue,
                        fontSize: Reponsive_.px30,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/70,
                      ),
                      MontserratText(
                        text: "Saturday, March 11 2023",
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue,
                        fontSize: Reponsive_.px18,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/70,
                      ),
                      InterText(
                        text: "Elevate Care North Branch",
                        fontWeight: FontWeight.w400,
                        color: AppColors.blue,
                        fontSize: Reponsive_.px14,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAssets.location),
                          SizedBox(
                            width: Reponsive_.crosslength/110,
                          ),
                          InterText(
                            text: "Seattle Grace - 135 Ridgewood Ave.",
                            fontWeight: FontWeight.w400,
                            color: AppColors.blue,
                            fontSize: Reponsive_.px14,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ) ,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonContainer(
                            bgcolor: AppColors.light_yallow,
                            borderRadius: Reponsive_.crosslength*0.007,
                            padding: Reponsive_.crosslength*0.008,
                            marginleft: 2,
                            marginright: 0.01,
                            child: Row(
                              children: [
                                Image.asset('assets/x/direction.png',scale: 4,),
                                InterText(text: ' 5.2 mi',fontSize: Reponsive_.crosslength*0.015,color:AppColors.yallow ,),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: Reponsive_.crosslength/110,
                          ),
                          CommonContainer(
                            bgcolor: AppColors.yallow,
                            borderRadius: Reponsive_.crosslength*0.007,
                            padding: Reponsive_.crosslength*0.008,
                            marginleft: 2,
                            marginright: 0.01,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InterText(text: 'Incentive +\$5/hr',fontSize: Reponsive_.crosslength*0.015,color:AppColors.black ,),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/90,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.verified_user,color: AppColors.deepGreen,),
                          InterText(
                            text: "Cancellation Guarantee",
                            fontWeight: FontWeight.w300,
                            color: AppColors.black,
                            fontSize: Reponsive_.px12,
                          )
                        ],
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/40,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: Reponsive_.crosslength/80,right: Reponsive_.crosslength/80),
                        child: Row(
                          children: [
                            Expanded(
                              child:CommonButton(
                                  text: "Accept",
                                  onTap: (){
                                    toPushNavigator(context: context,PageName: ShiftsDeatilsScreen());
                                  }
                              ),
                            ),
                            SizedBox(
                              width: Reponsive_.crosslength/80,
                            ),
                            Expanded(
                              child:CommonButton(
                                  text: "Close",
                                  onTap: (){
                                    onBack(context);
                                  },
                                color: AppColors.allGray,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/80,
                      ),
                    ],
                  ),
              );
            },
            child: CommonContainer(
              marginbottom: Reponsive_.crosslength*0.01,
              marginleft: Reponsive_.crosslength*0.015,
              marginright: Reponsive_.crosslength*0.015,
              margintop: 0.01,

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      InterText(
                        text: '10',
                        color: AppColors.blue,
                        fontSize: Reponsive_.crosslength * 0.03,
                        fontWeight: FontWeight.w700,
                      ),
                      InterText(
                        text: 'MARCH',
                        color: AppColors.hintTextGrey,
                        fontSize: Reponsive_.crosslength * 0.01,
                        fontWeight: FontWeight.w400,
                      ),

                      CommonContainer(
                        bgcolor: AppColors.yallow,
                        borderRadius: Reponsive_.crosslength*0.007,
                        padding: Reponsive_.crosslength*0.008,
                        child: InterText(text: '+\$5/hr',fontSize: Reponsive_.crosslength*0.015),
                      )
                    ],
                  ),

                  SizedBox(
                    width: Reponsive_.crosslength * 0.0002,
                  ),
                  Container(
                    height: Reponsive_.crosslength * 0.06,
                    width: 0.2,
                    color: AppColors.hintTextGrey,
                  ),
                  SizedBox(
                    width: Reponsive_.crosslength * 0.008,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InterText(
                                textOverflow: TextOverflow.ellipsis,
                                text: 'Blue Door Nursing & Rehab',
                                color: Color(0xff02050A),
                                fontSize: Reponsive_.crosslength * 0.017,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Image.asset('assets/x/flag.png',height: Reponsive_.crosslength*0.02,width: Reponsive_.crosslength*0.02,)
                          ],
                        ),
                        SizedBox(
                          height: Reponsive_.crosslength * 0.006,
                        ),
                        Row(
                          children: [
                            Image.asset('assets/x/secure.png',height: Reponsive_.crosslength*0.02,width: Reponsive_.crosslength*0.02,),
                            InterText(
                              text: '  Cancellation Guarantee',
                              maxLines: 2,
                              color: AppColors.black,
                              fontSize: Reponsive_.crosslength * 0.015,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            CommonContainer(
                              bgcolor: AppColors.light_purple,
                              borderRadius: Reponsive_.crosslength*0.007,
                              padding: Reponsive_.crosslength*0.008,
                              marginright: 0.1,
                              child: Row(
                                children: [
                                  Image.asset('assets/x/sun.png',scale: 2.8,),
                                  InterText(text: ' 7:00AM - 3:00PM',fontSize: Reponsive_.crosslength*0.015,color:AppColors.dark_purple ,),
                                ],
                              ),
                            ),
                            CommonContainer(
                              bgcolor: AppColors.light_yallow,
                              borderRadius: Reponsive_.crosslength*0.007,
                              padding: Reponsive_.crosslength*0.008,
                              marginleft: 2,
                              marginright: 0.01,
                              child: Row(
                                children: [
                                  Image.asset('assets/x/direction.png',scale: 4,),
                                  InterText(text: ' 5.2 mi',fontSize: Reponsive_.crosslength*0.015,color:AppColors.yallow ,),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
