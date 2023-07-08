

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonController.dart';

import '../../../Utils/interText.dart';


class WhoIsOnScreen extends StatefulWidget {
  const WhoIsOnScreen({super.key});

  @override
  State<WhoIsOnScreen> createState() => _WhoIsOnScreenState();
}

class _WhoIsOnScreenState extends State<WhoIsOnScreen>  with SingleTickerProviderStateMixin{
  final _controller = PageController(
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
            SizedBox(height: Reponsive_.crosslength*0.01,),
            Container(
              color: Colors.white,
              child: TabBar(
                controller:_tabController ,
                indicatorColor: Colors.white,
                onTap: (index){
                  setState(() {
                    selectedIndex=index;
                    _controller.animateToPage(selectedIndex,
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
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
                      text: 'Scheduled',
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
                      text: 'Clocked In',
                      color: selectedIndex==1?AppColors.blue: AppColors.hintTextGrey,
                      fontSize: Reponsive_.crosslength*0.018,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(height: Reponsive_.crosslength*0.007,),
            Flexible(
              child: PageView(
                controller: _controller,
                onPageChanged: (i){
                  setState(() {
                    selectedIndex=i;
                  });
                },
                children: [
                  Page(count: 5,),
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
  int count;
  Page({this.count=10,super.key});

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
        itemCount: widget.count,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: Reponsive_.crosslength * 0.01,
                vertical: Reponsive_.crosslength * 0.013),
            margin: EdgeInsets.only(
                top: Reponsive_.crosslength * 0.005,
                left: Reponsive_.crosslength * 0.015,
                right: Reponsive_.crosslength * 0.015),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white),
            child: Row(
              children: [
                Container(
                  height: Reponsive_.crosslength*0.055,
                  width: Reponsive_.crosslength*0.055,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.image_border,width: 2),
                      image: DecorationImage(
                          image: AssetImage(
                            AppAssets.completed,
                          ),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: Reponsive_.crosslength * 0.01,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: 'Jasnah Kholin',
                        color: Color(0xff02050A),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.006,
                      ),
                      Row(
                        children: [
                          InterText(
                            text: 'CNA',
                            color: Color(0xff02050A),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          InterText(
                            text: '    Starting in 10 min',
                            color: Color(0xff16478E),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        InterText(
                          text: 'Available ',
                          color: AppColors.hintTextGrey,
                          fontSize: Reponsive_.crosslength*0.015,
                          fontWeight: FontWeight.w400,
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.deepGreen,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength * 0.008,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Reponsive_.crosslength * 0.01,
                                  vertical: Reponsive_.crosslength * 0.003),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Reponsive_.crosslength * 0.02),
                                  color: AppColors.yallow),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InterText(
                                    text: '5',
                                    color: AppColors.blue,
                                    fontSize: Reponsive_.crosslength * 0.015,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  Image.asset(
                                    AppAssets.star,
                                    height: Reponsive_.crosslength * 0.013,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: Reponsive_.crosslength * 0.008,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Reponsive_.crosslength * 0.01,
                                  vertical: Reponsive_.crosslength * 0.003),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Reponsive_.crosslength * 0.02),
                                  color: AppColors.yallow),
                              child: InterText(
                                text: '0 pts',
                                color: AppColors.blue,
                                fontSize: Reponsive_.crosslength * 0.015,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
