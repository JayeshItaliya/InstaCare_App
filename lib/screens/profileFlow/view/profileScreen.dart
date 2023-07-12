import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonContainer.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/loader.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/profileFlow/controller/profileController.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.put(ProfileController());
  final cx = Get.put(CommonController());
  File? setProfileImage;
  final globalKey = GlobalKey<ScaffoldState>();
  File? imageFile;
  List<String> status_arr = [
    "",
    "Available",
    "Away",
    "Busy",
    "DND",
    "Offline",
  ];

  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      key: globalKey,
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title: MontserratText(
          text: "Profile",
          fontWeight: FontWeight.w700,
          color: AppColors.blue,
        ),
        icon: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            onBack(context);
            profileController.get_profile_data();
          },
        ),
        trailingIcon: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              AppAssets.bell,
              width: Reponsive_.px30,
              height: Reponsive_.px30,
            ),
          ),
        ],
      ),
      body: Obx(
        () => profileController.loading.value
            ? Center(child: CircularProgressIndicator(backgroundColor: AppColors.buttonColor,))
            : ListView(
                padding:   EdgeInsets.only(
                  left: Reponsive_.crosslength*0.01,
                  right: Reponsive_.crosslength*0.01,
                  bottom: 20,
                ),
                children: [
                  Container(
                    width: cx.width,
                    margin: EdgeInsets.symmetric(
                        horizontal: Reponsive_.crosslength * 0.015),
                    decoration: const BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                InterText(
                                  text: "Emp. ID",
                                  fontSize: Reponsive_.px12,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.buttonColor,
                                ),
                                InterText(
                                  text: profileController.id.value.toString(),
                                  fontSize: Reponsive_.px18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.buttonColor,
                                )
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    top: Reponsive_.crosslength * 0.01,
                                    left: Reponsive_.crosslength * 0.005,
                                    right: Reponsive_.crosslength * 0.005,
                                    bottom: Reponsive_.crosslength * 0.005,
                                  ),
                                  decoration: const BoxDecoration(
                                      color: AppColors.yallow,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(50),
                                          bottomRight: Radius.circular(50))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 9, right: 6, left: 6),
                                    child: setProfileImage == null
                                        ? Container(
                                            height:
                                                Reponsive_.crosslength * 0.1,
                                            width: Reponsive_.crosslength * 0.1,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(AppAssets.doctorPhoto),
                                                    fit: BoxFit.cover)),
                                          )
                                        : Container(
                                            height:
                                                Reponsive_.crosslength * 0.1,
                                            width: Reponsive_.crosslength * 0.1,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        File(imageFile!.path)),
                                                    fit: BoxFit.cover)),
                                          ),
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: Reponsive_.crosslength / 100,
                                    child: edit_btn())
                              ],
                            ),
                            Column(
                              children: [
                                InterText(
                                  text: "Status",
                                  fontSize: Reponsive_.px12,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.buttonColor,
                                ),
                                InterText(
                                  text: status_arr[int.parse(profileController
                                      .status.value
                                      .toString())],
                                  fontSize: Reponsive_.px18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.buttonColor,
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: cx.height / 21,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                InterText(
                                  text: profileController.fullNameController.value.text,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                                InterText(
                                  text: profileController.role.value,
                                  fontSize: Reponsive_.px12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.buttonColor,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: Reponsive_.crosslength * 0.015,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: cx.height / Reponsive_.px30,
                  ),
                  CommonContainer(
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InterText(
                              text: "Account Information",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blue,
                            ),
                            InkWell(
                              child: Image.asset(
                                AppAssets.profileEdit,
                                height: Reponsive_.px30,
                                width: Reponsive_.px30,
                              ),
                              onTap: () {
                                CommonBottonSheet(
                                    context: context,
                                    childView: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          InterText(
                                            text: "Account Information",
                                            fontWeight: FontWeight.w700,
                                            fontSize: Reponsive_.px30,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          AbsorbPointer(
                                            absorbing: true,
                                            child: AppWidget().getTextField(
                                                hintText: "Enter full name",
                                                label: "",
                                                filledColor:
                                                    AppColors.backGroundColor,
                                                textEditingController:
                                                    profileController
                                                        .fullNameController
                                                        .value
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: AppWidget().getTextField(
                                                    hintText:
                                                        'Enter first name',
                                                    label: "",
                                                    filledColor: AppColors
                                                        .backGroundColor,
                                                    textEditingController:
                                                        profileController
                                                            .firstNameController
                                                            .value),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                  child: AppWidget().getTextField(
                                                      hintText:
                                                          "Enter last name",
                                                      label: "",
                                                      filledColor: AppColors
                                                          .backGroundColor,
                                                      textEditingController:
                                                          profileController
                                                              .lastNameController
                                                              .value)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          AppWidget().getTextField(
                                              hintText: "Enter email",
                                              label: "",
                                              filledColor:
                                                  AppColors.backGroundColor,
                                              textEditingController:
                                                  profileController
                                                      .emailController.value),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          AppWidget().getTextField(
                                              hintText: "Enter phone no.",
                                              label: "",
                                              filledColor:
                                                  AppColors.backGroundColor,
                                              textEditingController:
                                                  profileController
                                                      .mobileNumberController
                                                      .value),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CommonButton(
                                            text: "Save & Close",
                                            onTap: () async {
                                              print('update--');
                                              await profileController.update_profile(context, file: imageFile);
                                              setState(() {});
                                            },
                                          )
                                        ],
                                      ),
                                    ));
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Screen Name",
                              fontSize: Reponsive_.px12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterText(
                              text: profileController.fullNameController.value.text.toString(),
                              fontSize: Reponsive_.px18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InterText(
                                    text: "First Name",
                                    fontSize: Reponsive_.px12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                  InterText(
                                    text: profileController
                                        .firstNameController.value.text
                                        .toString(),
                                    fontSize: Reponsive_.px18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InterText(
                                    text: "Last Name",
                                    fontSize: Reponsive_.px12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                  InterText(
                                    text: profileController
                                        .lastNameController.value.text
                                        .toString(),
                                    fontSize: Reponsive_.px18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Email",
                              fontSize: Reponsive_.px12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterText(
                              text: profileController.emailController.value.text
                                  .toString(),
                              fontSize: Reponsive_.px18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Phone",
                              fontSize: Reponsive_.px12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterText(
                              text: profileController
                                  .mobileNumberController.value.text
                                  .toString(),
                              fontSize: Reponsive_.px18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength*0.001,
                  ),
                  CommonContainer(
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InterText(
                              text: "Address",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blue,
                            ),
                            InkWell(
                              child: Image.asset(
                                AppAssets.profileEdit,
                                height: Reponsive_.px30,
                                width: Reponsive_.px30,
                              ),
                              onTap: () {
                                CommonBottonSheet(
                                    context: context,
                                    childView: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InterText(
                                            text: "Address",
                                            fontWeight: FontWeight.w700,
                                            fontSize: Reponsive_.px30,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          CommonDropDown(
                                              context: context,
                                              mycontrollerValue:
                                                  profileController
                                                      .countryController,
                                              list: profileController.list,
                                              color: AppColors.backGroundColor),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: AppWidget().getTextField(
                                                    hintText: "Joel",
                                                    label: "",
                                                    filledColor: AppColors
                                                        .backGroundColor,
                                                    textEditingController:
                                                        profileController
                                                            .cityNameController
                                                            .value),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                  child: AppWidget().getTextField(
                                                      hintText: "Newman",
                                                      label: "",
                                                      filledColor: AppColors
                                                          .backGroundColor,
                                                      textEditingController:
                                                          profileController
                                                              .stateController
                                                              .value)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          AppWidget().getTextField(
                                              hintText: "joelnewman@gmail.com",
                                              label: "",
                                              filledColor:
                                                  AppColors.backGroundColor,
                                              textEditingController:
                                                  profileController
                                                      .zipController.value),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CommonButton(
                                            text: "Save & Close",
                                            onTap: () {
                                              profileController.update_profile(context, file: imageFile);
                                              setState(() {});
                                            },
                                          )
                                        ],
                                      ),
                                    ));
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Screen Name",
                              fontSize: Reponsive_.px12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterText(
                              text: profileController
                                  .fullNameController.value.text
                                  .toString(),
                              fontSize: Reponsive_.px18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InterText(
                                    text: "Country",
                                    fontSize: Reponsive_.px12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                  InterText(
                                    text: profileController
                                        .countryController.value
                                        .toString(),
                                    fontSize: Reponsive_.px18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InterText(
                                    text: "City",
                                    fontSize: Reponsive_.px12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                  InterText(
                                    text: profileController
                                        .cityNameController.value.text
                                        .toString(),
                                    fontSize: Reponsive_.px18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InterText(
                                    text: "State",
                                    fontSize: Reponsive_.px12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                  InterText(
                                    text: profileController
                                        .stateController.value.text
                                        .toString(),
                                    fontSize: Reponsive_.px18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InterText(
                                    text: "Zip",
                                    fontSize: Reponsive_.px12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                    textAlign: TextAlign.start,
                                  ),
                                  InterText(
                                    text: profileController
                                        .zipController.value.text
                                        .toString(),
                                    fontSize: Reponsive_.px18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength*0.001,
                  ),
                  CommonContainer(
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InterText(
                              text: "General",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blue,
                            ),
                            InkWell(
                              child: Image.asset(
                                AppAssets.profileEdit,
                                height: Reponsive_.px30,
                                width: Reponsive_.px30,
                              ),
                              onTap: () {
                                CommonBottonSheet(
                                    context: context,
                                    childView: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InterText(
                                            text: "General",
                                            fontWeight: FontWeight.w700,
                                            fontSize: Reponsive_.px30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CommonDropDown(
                                              context: context,
                                              list: profileController.timeZone,
                                              mycontrollerValue:
                                                  profileController
                                                      .timeZoneController,
                                              color: AppColors.backGroundColor),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CommonDropDown(
                                              context: context,
                                              list: profileController
                                                  .timeLanguage,
                                              mycontrollerValue:
                                                  profileController
                                                      .languageController,
                                              color: AppColors.backGroundColor),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CommonButton(
                                            text: "Save & Close",
                                            onTap: () {
                                              profileController.update_profile(context, file: imageFile);
                                              setState(() {});
                                            },
                                          )
                                        ],
                                      ),
                                    ));
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Time Zone",
                              fontSize: Reponsive_.px12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterText(
                              text: profileController.timeZoneController.value,
                              fontSize: Reponsive_.px18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Language",
                              fontSize: Reponsive_.px12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterText(
                              text: profileController.languageController.value,
                              fontSize: Reponsive_.px18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength*0.001,
                  ),
                  InkWell(
                    child: CommonContainer(
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InterText(
                                text: "Security",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blue,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InterText(
                                text: "Change Password",
                                fontSize: Reponsive_.px12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.blue,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      CommonBottonSheet(
                          context: context,
                          childView: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InterText(
                                  text: "   Reset Password",
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                AppWidget().getTextField(
                                    hintText: "Current Password",
                                    validationFunction: (val) {
                                      if (val.toString().isEmpty) {
                                        return "current password not null";
                                      }
                                    },
                                    textEditingController: profileController
                                        .currentPassword.value),
                                SizedBox(
                                  height: 18.h,
                                ),
                                AppWidget().getTextField(
                                    hintText: "New Password",
                                    validationFunction: (val) {
                                      if (val.toString().isEmpty) {
                                        return "current password not null";
                                      }
                                    },
                                    textEditingController:
                                        profileController.newPassword.value),
                                SizedBox(
                                  height: 18.h,
                                ),
                                AppWidget().getTextField(
                                    hintText: "Confirm Password",
                                    validationFunction: (val) {
                                      if (val.toString().isEmpty) {
                                        return "current password not null";
                                      }
                                    },
                                    textEditingController: profileController
                                        .confirmPassword.value),
                                SizedBox(
                                  height: 18.h,
                                ),
                                CommonButton(
                                    text: "Update & Close",
                                    onTap: () {
                                      if (profileController.currentPassword
                                              .value.text.isEmpty ||
                                          profileController.currentPassword
                                                  .value.text.length <
                                              8) {
                                        showErrorDialog(
                                            'Invalid Current password');
                                      } else if (profileController
                                              .newPassword.value.text.isEmpty ||
                                          profileController.currentPassword
                                                  .value.text.length <
                                              8) {
                                        showErrorDialog(
                                            'New password is not 8 character long !!');
                                      } else if (profileController
                                              .confirmPassword
                                              .value
                                              .text
                                              .isEmpty ||
                                          profileController.currentPassword
                                                  .value.text.length <
                                              8) {
                                        showErrorDialog(
                                            'Confirm password is not 8 character long !!');
                                      } else if (profileController
                                              .newPassword.value.text
                                              .toString() !=
                                          profileController
                                              .confirmPassword.value.text
                                              .toString()) {
                                        showErrorDialog(
                                            'New Password and Confirm Password not matched');
                                      } else {
                                        profileController.change_pwd(context);
                                      }
                                    })
                              ],
                            ),
                          ));
                    },
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength*0.001,
                  ),
                  CommonContainer(
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InterText(
                              text: "Notifications",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blue,
                            ),
                          ],
                        ),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: profileController.switchValues.length,
                            itemBuilder: (context, index) {
                              return Obx(() => GestureDetector(
                                    onTap: () {
                                      profileController.toggleSwitch(
                                          index,
                                          profileController
                                              .switchValues[index].value);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InterText(
                                            text: profileController
                                                .switchName[index],
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.black,
                                          ),
                                          FlutterSwitch(
                                            activeText: "",
                                            inactiveText: "",
                                            width: 50.0,
                                            height: 30.0,
                                            activeColor: AppColors.deepGreen,
                                            inactiveColor: Color.fromRGBO(
                                                217, 217, 217, 1),
                                            toggleSize: 20.0,
                                            value: profileController
                                                .switchValues[index].value,
                                            borderRadius: 50.0,
                                            showOnOff: true,
                                            onToggle: (val) async {
                                              profileController.toggleSwitch(
                                                  index, !val);
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                            })
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Future<File?> getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1000,
    );
    if (pickedFile != null) {
      setState(() {
        print("test ");
        imageFile = File(pickedFile.path);
      });
    }
    return imageFile;
  }

  /// Get from Camera
  Future<File?> getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1000,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
    return imageFile;
  }

  Widget edit_btn() {
    return InkWell(
      child: Image.asset(
        AppAssets.profileEdit,
        height: Reponsive_.crosslength * 0.03,
        width: Reponsive_.crosslength * 0.03,
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          backgroundColor: AppColors.backGroundColor,
          isDismissible: true,
          isScrollControlled: true,
          enableDrag: true,
          builder: (BuildContext context) {
            return BottomSheet(
              onClosing: () {},
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (BuildContext context, setState) {
                    setState(() {});
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Container(
                                width: 100,
                                height: 5,
                                color: AppColors.yallow,
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: Reponsive_.crosslength * 0.015,
                        ),
                        MontserratText(
                            text: '  Update Profile Photo',
                            fontWeight: FontWeight.w700,
                            fontSize: Reponsive_.px30,
                            color: AppColors.black,
                            textAlign: TextAlign.start
                        ),
                        SizedBox(
                          height: Reponsive_.crosslength * 0.015,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(Reponsive_.crosslength * 0.015),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: imageFile == null
                                        ? Container(
                                            height:
                                                Reponsive_.crosslength * 0.2,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.green,
                                                image: const DecorationImage(
                                                    image: NetworkImage(
                                                        "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                                                    fit: BoxFit.cover)),
                                          )
                                        : Container(
                                            height: 180,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        File(imageFile!.path)),
                                                    fit: BoxFit.cover)),
                                          ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        InkWell(
                                          child: Image.asset(AppAssets.gallery),
                                          onTap: () async {
                                            getFromGallery().then((value) {
                                              setState(() {
                                                setProfileImage = value;
                                                print(setProfileImage);
                                              });
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height:
                                              Reponsive_.crosslength * 0.008,
                                        ),
                                        InkWell(
                                          child: Image.asset(AppAssets.camera),
                                          onTap: () async {
                                            getFromCamera().then((value) {
                                              setState(() {
                                                setProfileImage = value;
                                              });
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height:
                                              Reponsive_.crosslength * 0.005,
                                        ),
                                        InterText(
                                          text: "Maximum size: 10MB",
                                          fontSize:
                                              Reponsive_.crosslength * 0.013,
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.center,
                                          color: AppColors.hintTextGrey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CommonButton(
                                  text: "Upload & Save",
                                  onTap: () {
                                    profileController.update_profile(context);
                                    onBack(context);
                                  })
                            ],
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
