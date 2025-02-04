import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/interText.dart';
import '../../../Utils/appAssets.dart';
import '../../../Utils/appColor.dart';
import '../../../Utils/pageNavigator.dart';
import 'FacilityDetailScreen.dart';

class FacilitiesScreen extends StatefulWidget {
  const FacilitiesScreen({super.key});

  @override
  State<FacilitiesScreen> createState() => _FacilitiesScreenState();
}

class _FacilitiesScreenState extends State<FacilitiesScreen> {
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        children: [
          SizedBox(
            height: Reponsive_.crosslength*0.01,
          ),
          Container(
            alignment: Alignment.center,
            height: Reponsive_.crosslength*0.04,
            padding: const EdgeInsets.only(left: 10),
            margin:   EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.02,),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: TextFormField(
              decoration:   InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search by name",
                  isDense: true,
                  suffixIcon:Image.asset("assets/profileFlow/search1.png",color: AppColors.blue,),
                  hintStyle: GoogleFonts.inter(
                      fontSize: Reponsive_.px14,
                      color: AppColors.hintTextGrey,
                      fontWeight: FontWeight.w400
                  )
              ),
            ),
          ),
          SizedBox(height: Reponsive_.crosslength*0.015,),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: Reponsive_.crosslength*0.015,right: Reponsive_.crosslength*0.02),
                  color: Color(0xFFEDEDED),
                  height: 2,
                ),
              ),
              InterText(text: '56 Facilities',color:AppColors.hintTextGrey,fontWeight: FontWeight.w600,fontSize: Reponsive_.px12 ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: Reponsive_.crosslength*0.015,left: Reponsive_.crosslength*0.02),
                  color: Color(0xFFEDEDED),
                  height: 2,
                ),
              ),
            ],
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    toPushNavigator(context: context,PageName: FacilityDetailScreen());
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
                          height: Reponsive_.crosslength*0.07,
                          width: Reponsive_.crosslength*0.07,
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
                              InterText(
                                text: 'Jasnah Kholin',
                                color: Color(0xff02050A),
                                fontSize: Reponsive_.crosslength*0.015,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength * 0.004,
                              ),
                              InterText(
                                text: 'CNA',
                                color: Color(0xff02050A),
                                fontSize: Reponsive_.crosslength*0.015,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength * 0.008,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InterText(
                                    text: 'info@ecnb.com',
                                    color: AppColors.blue,
                                    fontSize: Reponsive_.crosslength*0.015,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(AppAssets.downodTimeCard,width: 14,height: 10),
                                      InterText(
                                        text: ' Download ',
                                        color: AppColors.blue,
                                        fontSize: Reponsive_.crosslength*0.015,
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
