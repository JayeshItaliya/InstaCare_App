import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/authFlow/view/forgotPasswordScreen.dart';
import 'package:instacare/screens/dashBoardFlow/view/dashBoardMainScreen.dart';

import '../../../Utils/appAssets.dart';
import '../../../Utils/commonButton.dart';
import '../../../Utils/commonController.dart';
import '../../../Utils/commonTextFormField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                top: 35,
                right:20,
                bottom: 20,
                left: 20,
              ),
              children: [
                AppWidget().getTextField(
                    hintText: 'User Name',
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Image.asset(
                        AppAssets.user,
                        scale: 3,
                      ),
                    )
                ),
                Gap(10),
                AppWidget().getTextField(
                    hintText: 'Password',
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
                  text: 'LOGIN',
                  onTap: (){
                    toPushNavigator(context: context,PageName: DashBoardScreen());
                  },
                ),
                Gap(30),
                InkWell(
                  onTap: (){
                    toPushNavigator(context:context,PageName: ForgotPasswordScreen());
                  },
                  child: InterText(
                      text: 'Forgot Password?',
                      fontWeight: FontWeight.w500,
                      color: AppColors.blue,
                      fontSize: 16,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
