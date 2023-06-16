import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';

class TimeCardDetailScreen extends StatefulWidget {
  const TimeCardDetailScreen({super.key});

  @override
  State<TimeCardDetailScreen> createState() => _TimeCardDetailScreenState();
}

class _TimeCardDetailScreenState extends State<TimeCardDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title: MontserratText(
          text:"Timecard Detail" ,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.blue,
        ),
      ),
      body: ListView(
        padding: padding,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterText(
                text: "Status",
                color: AppColors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.yallow,
                      shape: BoxShape.circle
                    ),
                    child: Image.asset(AppAssets.loader1),
                  ),
                  SizedBox(width:Reponsive_.crosslength/80 ,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     InterText(
                       text: "Process",
                       color: AppColors.yallow,
                       fontSize: 12,
                        fontWeight: FontWeight.bold,
                     ),
                      InterText(
                        text: "--",
                        color: AppColors.hintTextGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
