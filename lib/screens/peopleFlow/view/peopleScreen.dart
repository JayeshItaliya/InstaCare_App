import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonDrower.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/availableEmployeesFlow/view/applyFilterScreen.dart';
import 'package:instacare/screens/peopleFlow/view/applyFilterScreen.dart';



class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      key: globalKey,
      backgroundColor: AppColors.backGroundColor,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Reponsive_.crosslength * 0.02,
                left: Reponsive_.crosslength * 0.02,
                right: Reponsive_.crosslength * 0.02
            ),
            child: Row(
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
                     toPushNavigator(context: context,PageName: ApplyFilterPeopleScreen());
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: Reponsive_.crosslength*0.010,
          ),
           ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Reponsive_.crosslength * 0.01,
                    vertical: Reponsive_.crosslength * 0.02),
                margin: EdgeInsets.only(
                    top: Reponsive_.crosslength * 0.02,
                    left: Reponsive_.crosslength * 0.02,
                    right: Reponsive_.crosslength * 0.02
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration:   BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.buttonColor,
                            width: 2
                          ),
                          image: const DecorationImage(
                              image: AssetImage(
                                AppAssets.docImage,
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
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              InterText(
                                text: '    Starting in 10 min',
                                color: Color(0xff16478E),
                                fontSize: 15,
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
                              color: Color(0xff02050A),
                              fontSize: 15,
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
                                    children: [
                                      InterText(
                                        text: '5',
                                        color: AppColors.blue,
                                        fontSize: Reponsive_.crosslength * 0.015,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      Image.asset(
                                        AppAssets.star,
                                        height: Reponsive_.crosslength * 0.015,
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
        ],
      ),
      drawer: Drawer(
        width: Reponsive_.crosslength*0.35,
        child:  CommonDrawer(),
      ),
    );
  }
}
