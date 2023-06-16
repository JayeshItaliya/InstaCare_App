import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import '../../../Utils/appAssets.dart';
import '../../../Utils/commonContainer.dart';
import '../../../Utils/commonController.dart';
import '../../../Utils/interText.dart';
import '../../../Utils/pageNavigator.dart';
import 'MarketPlaceFilterScreen.dart';

class MarketPlaceScreen extends StatefulWidget {
  const MarketPlaceScreen({super.key});

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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 10,),
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
                      border: Border(bottom: BorderSide(color: selectedIndex==0?AppColors.blue:AppColors.white,width: 2))
                    ),
                    alignment: Alignment.center,
                    child: InterText(
                      text: 'All Shifts',
                      color:selectedIndex==0?AppColors.blue: Color(0xff02050A),
                      fontSize: Reponsive_.crosslength*0.02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(bottom: BorderSide(color: selectedIndex==1?AppColors.blue:AppColors.white,width: 2))
                    ),
                    height: Reponsive_.crosslength*0.055,
                    alignment: Alignment.center,
                    child: InterText(
                      text: 'Preferred Shifts',
                      color: selectedIndex==1?AppColors.blue: Color(0xff02050A),
                      fontSize: Reponsive_.crosslength*0.02,
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
                    margin: EdgeInsets.only(top: Reponsive_.crosslength*0.02,left: Reponsive_.crosslength*0.015,right: Reponsive_.crosslength*0.008),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Reponsive_.crosslength*0.025)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        isDense: true,fillColor: Colors.blue,
                        border: InputBorder.none,
                        hintText: 'Search by Name',
                        suffixIcon: Image.asset('assets/x/calendar.png',scale: 3,alignment: Alignment.centerLeft),
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
                    padding:EdgeInsets.only(top: Reponsive_.crosslength*0.02,right: Reponsive_.crosslength*0.015),
                    child: Image.asset(AppAssets.filtetr,alignment: Alignment.center,),
                  ),
                )
              ],
            ),
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
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              // toPushNavigator(context: context,PageName: SolloInvoiceScreen());
            },
            child: CommonContainer(
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
                        padding: Reponsive_.crosslength*0.01,
                        child: InterText(text: '+\$5/hr',fontSize: Reponsive_.crosslength*0.012),
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
                              color: AppColors.hintTextGrey,
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
                              padding: Reponsive_.crosslength*0.01,
                              marginright: 0.1,
                              child: InterText(text: '7:00AM - 3:00PM',fontSize: Reponsive_.crosslength*0.012,color:AppColors.dark_purple ,),
                            ),
                            CommonContainer(
                              bgcolor: AppColors.yallow,
                              borderRadius: Reponsive_.crosslength*0.007,
                              padding: Reponsive_.crosslength*0.01,
                              marginleft: 10,
                              child: InterText(text: '5.2 mi',fontSize: Reponsive_.crosslength*0.012),
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
