import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/view/peopleDashBoardFlow/view/writeReviewScreen.dart';

import '../../../../../Utils/commonController.dart';
import '../Controller/ratingScreenController.dart';

Widget ReviewsScreen(BuildContext context) {
  final cx = Get.put(RatingScreenController());
  return Container(
    height: Reponsive_.crosslength * 0.9,
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength * 0.02),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Reponsive_.crosslength * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: ()=>onBack(context),
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
          text: 'Granny Reviews [4]',
          fontSize: Reponsive_.px30,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
        ),
        SizedBox(
          height: Reponsive_.crosslength * 0.025,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: cx.comments.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InterText(
                    text: cx.comments[index],
                    fontSize: Reponsive_.px16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.hintTextGrey,
                    maxLines: cx.comments[index].length,
                    height: 1.5,
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength * 0.01,
                  ),
                  InterText(
                    text: cx.names[index],
                    fontSize: Reponsive_.px16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength * 0.01,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        glowColor:AppColors.yallow,
                        ignoreGestures:true,
                        itemSize:Reponsive_.crosslength*0.018,
                        itemPadding: EdgeInsets.only(right: Reponsive_.crosslength*0.005),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      InterText(
                        text: ' 5/5',
                        fontSize: Reponsive_.px16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength * 0.025,
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: Reponsive_.crosslength * 0.01,
        ),
        CommonButton(text: 'Review', onTap: (){
          toPushNavigator(context: context,PageName: WriteReviewScreen());
        }),
        SizedBox(
          height: Reponsive_.crosslength * 0.01,
        ),
      ],
    ),
  );
}
