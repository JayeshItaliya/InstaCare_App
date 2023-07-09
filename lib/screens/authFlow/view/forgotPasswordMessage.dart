import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/authFlow/view/loginScreen.dart';

import '../../../Utils/appAssets.dart';
import '../../../Utils/commonButton.dart';
import '../../../Utils/commonController.dart';

class ForgotPasswordMessage extends StatefulWidget {
  const ForgotPasswordMessage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordMessage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgotPasswordMessage> {
  CommonController cx = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Container(
      color: AppColors.backGroundColor,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: Container(
            width: cx.width,
            height: cx.height * 0.65,
            color: AppColors.backGroundColor,
            child: Image.asset(
              AppAssets.login,
              fit: BoxFit.fill,
            ),
          ),
          bottomSheet: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                )),
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                right: 10,
                bottom: 20,
                left: 10,
              ),
              children: [
                InkWell(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.13),
                    height: 4,
                    color: AppColors.yallow,
                  ),
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                ),

                SizedBox(
                  height: Reponsive_.crosslength * 0.05,
                ),
                InterText(
                  text: "Reset Password",
                  fontSize: Reponsive_.px30,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Reponsive_.crosslength * 0.03,
                ),
                InterText(
                  text:
                      "We have sent verification link to your registered email address. Please check your email inbox.",
                  maxLines: 2,
                  fontSize: Reponsive_.px16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.hintTextGrey,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Reponsive_.crosslength * 0.05,
                ),
                CommonButton(
                  text: 'GO TO LOGIN',
                  onTap: () {
                    toPushNavigator(context: context,PageName: LoginScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
