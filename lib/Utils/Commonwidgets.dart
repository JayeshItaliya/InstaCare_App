import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'appColor.dart';

class Commonwidgets {
  static TextField text_field(
      TextInputType type, String hint, TextEditingController controller,{Widget? suffix,Function? ontap,bool readOnly=false,Color hint_color=AppColors.hintTextGrey,FontWeight weight=FontWeight.w400}) {
    return TextField(
      controller: controller,
      onTap: (){
        if (ontap!=null) {
          ontap();
        }
      },
      readOnly: readOnly,
      keyboardType: type,
      style: GoogleFonts.inter(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: Reponsive_.crosslength * 0.018),
      decoration: InputDecoration(
        fillColor: AppColors.backGroundColor,
        filled: true,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
            vertical: Reponsive_.crosslength * 0.015,
            horizontal: Reponsive_.crosslength * 0.015),
        hintText: hint,
        suffixIcon: RotatedBox(
            quarterTurns: 3,
            child: suffix),
        hintStyle: GoogleFonts.inter(
            color: hint_color,
            fontWeight: weight,
            fontSize: Reponsive_.crosslength * 0.018),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.backGroundColor, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.backGroundColor, width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.backGroundColor, width: 0),
        ),
      ),
    );
  }

  static Widget radio_btn(String label,bool selected,Function ontap) {
    return InkWell(
      onTap: (){
        ontap();
      },
      child: Row(
        children: [
          Container(
            height: Reponsive_.crosslength*0.025,
            width: Reponsive_.crosslength*0.025,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                  border: Border.all(color: AppColors.buttonColor,width: 2)),
              child: selected?Container(
                height: Reponsive_.crosslength*0.015,
                width: Reponsive_.crosslength*0.015,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  color: AppColors.buttonColor,
                ),

              ):SizedBox()),
          InterText(text: '  $label',color: AppColors.hintTextGrey,fontSize: Reponsive_.crosslength*0.018,fontWeight: FontWeight.w400,)
        ],
      ),
    );
  }

  static Widget time_layout(String text,{FontWeight weight=FontWeight.w600}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength * 0.02),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 0.5,
              color: AppColors.hintTextGrey,
            ),
          ),
          SizedBox(
            width: Reponsive_.crosslength * 0.025,
          ),
          InterText(
              text: text,
              fontWeight: weight,
              fontSize: Reponsive_.px12,
              color: AppColors.hintTextGrey),
          SizedBox(
            width: Reponsive_.crosslength * 0.025,
          ),
          Expanded(
            child: Container(
              height: 0.5,
              color: AppColors.hintTextGrey,
            ),
          ),
        ],
      ),
    );
  }


  static void confirmationDialog(BuildContext context,Function yesClick){
    CommonBottonSheet(
      context: context,
      childView: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: Reponsive_.crosslength * 0.02,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MontserratText(
                text: "Shift Detail".toUpperCase(),
                fontWeight: FontWeight.w400,
                color: AppColors.blue,
                fontSize: Reponsive_.px12,
              ),
              SizedBox(
                height: Reponsive_.crosslength * 0.025,
              ),
              MontserratText(
                text: "Confirmation",
                fontWeight: FontWeight.w700,
                color: AppColors.deepGreen,
                fontSize: Reponsive_.px30,
              ),
              SizedBox(
                height: Reponsive_.crosslength * 0.015,
              ),
              InterText(
                text:
                "Great, would you like to post these shifts?",
                fontSize: Reponsive_.px16,
                fontWeight: FontWeight.normal,
                color: AppColors.black,
              ),
              SizedBox(
                height: Reponsive_.crosslength * 0.1,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Reponsive_.crosslength * 0.02,
                  right: Reponsive_.crosslength * 0.02,
                  bottom: Reponsive_.crosslength * 0.01,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CommonButton(
                        text: "YES",
                        onTap: () {
                          yesClick();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CommonButton(
                        text: "NO",
                        onTap: () {
                          Navigator.of(context,
                              rootNavigator: true)
                              .pop();
                        },
                        color: AppColors.allGray,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


