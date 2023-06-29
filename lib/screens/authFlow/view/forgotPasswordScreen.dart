import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/interText.dart';

import '../../../Utils/appAssets.dart';
import '../../../Utils/commonButton.dart';
import '../../../Utils/commonController.dart';
import '../../../Utils/commonTextFormField.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgotPasswordScreen> {
  CommonController cx=Get.put(CommonController());
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
            height: cx.height*0.65,
            color: AppColors.backGroundColor,
            child: Image.asset(
              AppAssets.login,
              fit: BoxFit.fill,
            ),
          ),

          bottomSheet: Container(
            // height: cx.height*0.35,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(30.r) ,
                  topRight: Radius.circular(30.r) ,
                )
            ),
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                top: 15,
                right:20,
                bottom: 20,
                left: 20,

              ),
              children: [
                InterText(
                  text: "Reset Password",
                  fontSize: Reponsive_.px30,
                  fontWeight: FontWeight.w700,
                ),
                InterText(
                  text: "Enter your registered email address to get password reset link.",
                  maxLines: 2,
                  fontSize: Reponsive_.px16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.hintTextGrey,
                ),
                SizedBox(height: 10,),
                AppWidget().getTextField(
                    hintText: 'Email Address',
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Image.asset(
                        AppAssets.lock,
                        scale: 3,

                      ),

                    )
                ),
                Gap(15),
                CommonButton(
                  text: 'Continue',
                  onTap: (){

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
