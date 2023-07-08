import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonTextFormField.dart';

import '../../../../../Utils/Responsive.dart';
import '../../../../../Utils/appColor.dart';
import '../../../../../Utils/montserratText.dart';
import '../../../../../Utils/pageNavigator.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Reponsive_.crosslength * 0.02),
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
              text: 'Write Review',
              fontSize: Reponsive_.px30,
              fontWeight: FontWeight.w700,
              color: AppColors.black,
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.005,
            ),
            MontserratText(
              text: 'Granny Weatherwax',
              fontSize: Reponsive_.px30,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  glowColor: AppColors.yallow,
                  itemSize: Reponsive_.crosslength * 0.04,
                  wrapAlignment: WrapAlignment.spaceBetween,
                  itemPadding:
                      EdgeInsets.only(right: Reponsive_.crosslength * 0.035),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.02,
            ),
            Expanded(
              child: AppWidget().getTextField(
                hintText: 'Write Your Review',
                maxLine: 10,
                inputTextStyle: GoogleFonts.inter(
                    color: AppColors.black,
                    fontSize: Reponsive_.px16,
                    fontWeight: FontWeight.w400),
                hintStyle: GoogleFonts.inter(
                  color: AppColors.hintTextGrey,
                  fontSize: Reponsive_.px16,
                  fontWeight: FontWeight.w400)
              ),
            ),
            
            Row(
              children: [
                Expanded(child: CommonButton(text: 'SUBMIT', onTap: (){})),
                SizedBox(width: Reponsive_.crosslength*0.01,),
                Expanded(child: CommonButton(text: 'CANCEL', onTap: (){},color: AppColors.allGray,)),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
