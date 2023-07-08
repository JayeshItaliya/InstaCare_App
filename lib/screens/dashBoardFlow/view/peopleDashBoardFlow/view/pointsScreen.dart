import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instacare/Utils/interText.dart';

import '../../../../../Utils/Responsive.dart';
import '../../../../../Utils/appColor.dart';
import '../../../../../Utils/montserratText.dart';
import '../../../../../Utils/pageNavigator.dart';

class PointsScreen extends StatefulWidget {
  const PointsScreen({super.key});

  @override
  State<PointsScreen> createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen> {
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Reponsive_.crosslength * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Reponsive_.crosslength * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => onBack(context),
                  child: MontserratText(
                    text: 'x',
                    fontSize: Reponsive_.px30,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            MontserratText(
              text: 'Granny Points',
              fontSize: Reponsive_.px30,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
              height: 1,
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.02,
            ),
            Flexible(child: ListView.builder(
              itemCount: 5,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(text: 'March 22, 2023',fontWeight: FontWeight.w400,fontSize: Reponsive_.px16,color: AppColors.black,height: 1.5,),
                    InterText(text: 'Care Center',fontWeight: FontWeight.w600,fontSize: Reponsive_.px18,color: AppColors.blue,height: 1.5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: InterText(text: 'Late',fontWeight: FontWeight.w400,fontSize: Reponsive_.px24,color: AppColors.black,)),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Reponsive_.crosslength * 0.0055,
                              horizontal: Reponsive_.crosslength * 0.005),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.yallow,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                color: AppColors.blue,
                                size: Reponsive_.crosslength * 0.02,
                              ),
                              InterText(
                                text: "   0 pts",
                                color: AppColors.blue,
                                fontSize: Reponsive_.px16,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength * 0.012,
                                width: 10,
                              )
                            ],
                          ),
                        )
                      ],
                    ),

                    Container(height: 0.25,width: double.infinity,color: AppColors.hintTextGrey,margin: EdgeInsets.only(top: Reponsive_.crosslength*0.02,bottom: Reponsive_.crosslength*0.02),)
                  ],
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
