import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/view/peopleDashBoardFlow/view/peopleScreenDetial.dart';
import 'package:instacare/screens/peopleFlow/view/peopleScreen.dart';
import '../../../Utils/appAssets.dart';
import '../../../Utils/interText.dart';
import 'MemberFilterScreen.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({super.key});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: Reponsive_.crosslength*0.01,left: Reponsive_.crosslength*0.015,right: Reponsive_.crosslength*0.015),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Reponsive_.crosslength*0.025)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,fillColor: Colors.blue,
                      border: InputBorder.none,
                      hintText: 'Search by Name',
                      helperStyle: GoogleFonts.inter(color:AppColors.hintTextGrey,fontWeight: FontWeight.w400 ),
                      contentPadding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.015,vertical: Reponsive_.crosslength*0.013),
                    ),

                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  toPushNavigator(
                      context: context, PageName: MemberFilterScreen());
                },
                child: Padding(
                  padding:EdgeInsets.only(top: Reponsive_.crosslength*0.01,right: Reponsive_.crosslength*0.015),
                  child: Image.asset(AppAssets.filtetr,alignment: Alignment.center,),
                ),
              )
            ],
          ),
          SizedBox(height: Reponsive_.crosslength * 0.01,),
          Flexible(
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    toPushNavigator(context: context,PageName: PeopleScreenDetil());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Reponsive_.crosslength * 0.01,
                        vertical: Reponsive_.crosslength * 0.01),
                    margin: EdgeInsets.only(
                        bottom: Reponsive_.crosslength * 0.005,
                        left: Reponsive_.crosslength * 0.02,
                        right: Reponsive_.crosslength * 0.02),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Container(
                          height: Reponsive_.crosslength*0.055,
                          width: Reponsive_.crosslength*0.055,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.image_border,width: 3),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    "https://i.pinimg.com/originals/90/e5/4c/90e54c7266401804899b6c0a233d0c83.png",
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InterText(
                                    text: 'Jasnah Kholin',
                                    color: AppColors.black,
                                    fontSize: Reponsive_.crosslength*0.017,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Row(
                                    children: [
                                      InterText(
                                        text: 'Active ',
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
                                ],
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength * 0.007,
                              ),
                              Row(
                                children: [
                                  InterText(
                                    text: 'LPN',
                                    color: AppColors.black,
                                    fontSize: Reponsive_.crosslength*0.015,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  InterText(
                                    text: '    Worker',
                                    color: AppColors.blue,
                                    fontSize: Reponsive_.crosslength*0.015,
                                    fontWeight: FontWeight.w400,
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
