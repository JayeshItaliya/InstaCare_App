import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/authFlow/controller/forgetPassword.dart';
import 'package:instacare/screens/authFlow/view/forgotPasswordMessage.dart';

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
  final forgetPasswordController=Get.put(ForgetPasswordController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Form(
      key: formKey,
      child: Container(
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
                  right:20,
                  bottom: 25,
                  left: 20,

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
                  SizedBox(height: Reponsive_.crosslength*0.03,),
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
                      textEditingController: forgetPasswordController.emailController.value,
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Image.asset(
                          AppAssets.mail,
                          scale: 1,
                          color: AppColors.buttonColor,
                        ),
                      ),
                      validationFunction:(val){
                        if (val.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      }
                  ),
                  Gap(15),
                  CommonButton(
                    text: 'CONTINUE',
                    onTap: (){
                      if(formKey.currentState!.validate()){
                        forgetPasswordController.forgetPassword(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
