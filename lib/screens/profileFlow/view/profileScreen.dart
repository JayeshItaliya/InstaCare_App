import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonContainer.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/commonDrower.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/Utils/interText.dart';
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
  final GlobalKey<PopupMenuButtonState> popUpKey1 = GlobalKey();
  final GlobalKey<PopupMenuButtonState> popUpKey2 = GlobalKey();
  final GlobalKey<PopupMenuButtonState> popUpKey3 = GlobalKey();
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title: MontserratText(
          text: "Profile",
          fontWeight: FontWeight.bold,
          color: AppColors.blue,
        ),
        icon: InkWell(
          child: Builder(builder: (context) {
            return Image.asset(
              AppAssets.menu,
              width: 20,
              height: 20,
            );
          }),
          onTap: () {
            globalKey.currentState!.openDrawer();
          },
        ),
        trailingIcon: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              AppAssets.bell,
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 20,
        ),
        children: [
          Container(
            width: cx.width,
            height: cx.height / 3,
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
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: AppColors.buttonColor,
                        ),
                        InterText(
                          text: "511",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.buttonColor,
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          height: cx.height / 7,
                          width: cx.width / 4.1,
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
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                                            fit: BoxFit.cover)),
                                  )
                                : Container(
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
                          top: 60,
                          left: 60,
                          child: InkWell(
                            child: Image.asset(
                              AppAssets.profileEdit,
                              height: 30,
                              width: 30,
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
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                        builder:
                                            (BuildContext context, setState) {
                                          setState(() {});
                                          return ListView(
                                            shrinkWrap: true,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    child: Container(
                                                      width: 100,
                                                      height: 5,
                                                      color: AppColors.yallow,
                                                    ),
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              imageFile == null
                                                                  ? Container(
                                                                      height:
                                                                          180,
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              20),
                                                                          color: Colors
                                                                              .green,
                                                                          image: const DecorationImage(
                                                                              image: NetworkImage("https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                                                                              fit: BoxFit.cover)),
                                                                    )
                                                                  : Container(
                                                                      height:
                                                                          180,
                                                                      width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              20),
                                                                          image: DecorationImage(
                                                                              image: FileImage(File(imageFile!.path)),
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
                                                                child: Image.asset(
                                                                    AppAssets
                                                                        .gallery),
                                                                onTap:
                                                                    () async {
                                                                  getFromGallery()
                                                                      .then(
                                                                          (value) {
                                                                    setState(
                                                                        () {
                                                                      setProfileImage =
                                                                          value;
                                                                      print(
                                                                          setProfileImage);
                                                                    });
                                                                  });
                                                                },
                                                              ),
                                                              const SizedBox(
                                                                height: 8,
                                                              ),
                                                              InkWell(
                                                                child: Image.asset(
                                                                    AppAssets
                                                                        .camera),
                                                                onTap:
                                                                    () async {
                                                                  getFromCamera()
                                                                      .then(
                                                                          (value) {
                                                                    setState(
                                                                        () {
                                                                      setProfileImage =
                                                                          value;
                                                                    });
                                                                  });
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    InterText(
                                                      text:
                                                          "Maximum size: 10MB",
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 20.h,
                                                    ),
                                                    CommonButton(
                                                        text: "Upload & Save",
                                                        onTap: () {
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
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InterText(
                          text: "Status",
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: AppColors.buttonColor,
                        ),
                        InterText(
                          text: "Available",
                          fontSize: 18,
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
                          text: "Joel Newman",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                        InterText(
                          text: "Instacare Staff",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.buttonColor,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: cx.height / 30,
          ),
          CommonContainer(
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Expanded(
                  child: Row(
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
                          height: 30,
                          width: 30,
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
                                      fontSize: 30,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    AppWidget().getTextField(
                                        hintText: "Joel Newman",
                                        label: "",
                                        filledColor: AppColors.backGroundColor,
                                        textEditingController: profileController
                                            .fullNameController.value),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: AppWidget().getTextField(
                                              hintText: "Joel",
                                              label: "",
                                              filledColor:
                                                  AppColors.backGroundColor,
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
                                                hintText: "Newman",
                                                label: "",
                                                filledColor:
                                                    AppColors.backGroundColor,
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
                                        hintText: "joelnewman@gmail.com",
                                        label: "",
                                        filledColor: AppColors.backGroundColor,
                                        textEditingController: profileController
                                            .emailController.value),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    AppWidget().getTextField(
                                        hintText: "8888888888",
                                        label: "",
                                        filledColor: AppColors.backGroundColor,
                                        textEditingController: profileController
                                            .mobileNumberController.value),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CommonButton(
                                      text: "Save & Close",
                                      onTap: () {
                                        print('hiiii');
                                      },
                                    )
                                  ],
                                ),
                              ));
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Screen Name",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "Joel Newman",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "First Name",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterText(
                              text: "Joel",
                              fontSize: 18,
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
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterText(
                              text: "Newman ",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Email",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "joelnewman@gmail.com ",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Phone",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "8888888888",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CommonContainer(
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Expanded(
                  child: Row(
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
                          height: 30,
                          width: 30,
                        ),
                        onTap: () {
                          CommonBottonSheet(
                              context: context,
                              childView: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InterText(
                                      text: "Address",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 30,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CommonDropDown(
                                        context: context,
                                        mycontrollerValue:
                                            profileController.countryController,
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
                                              filledColor:
                                                  AppColors.backGroundColor,
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
                                                filledColor:
                                                    AppColors.backGroundColor,
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
                                        filledColor: AppColors.backGroundColor,
                                        textEditingController: profileController
                                            .zipController.value),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CommonButton(
                                      text: "Save & Close",
                                      onTap: () {
                                        print('hiiii');
                                      },
                                    )
                                  ],
                                ),
                              ));
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Screen Name",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "Joel Newman",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Country",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterText(
                              text: "United States",
                              fontSize: 18,
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
                              text: "City",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterText(
                              text: "Skokie",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "State",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterText(
                              text: "illinois",
                              fontSize: 18,
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
                              text: "Zip",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterText(
                              text: "60077",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CommonContainer(
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Expanded(
                  child: Row(
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
                          height: 30,
                          width: 30,
                        ),
                        onTap: () {
                          CommonBottonSheet(
                              context: context,
                              childView: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InterText(
                                      text: "General",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 30,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CommonDropDown(
                                        context: context,
                                        list: profileController.timeZone,
                                        mycontrollerValue: profileController
                                            .timeZoneController,
                                        color: AppColors.backGroundColor),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CommonDropDown(
                                        context: context,
                                        list: profileController.timeLanguage,
                                        mycontrollerValue: profileController
                                            .languageController,
                                        color: AppColors.backGroundColor),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CommonButton(
                                      text: "Save & Close",
                                      onTap: () {
                                        print('hiiii');
                                      },
                                    )
                                  ],
                                ),
                              ));
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Time Zone",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "Central Time (US/Can) (GMT-6:00)",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterText(
                        text: "Language",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "English",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: CommonContainer(
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Expanded(
                    child: Row(
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InterText(
                          text: "Change Password",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.blue,
                        ),
                      ],
                    ),
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
                      children: [
                        InterText(
                          text: "Reset Password",
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blue,
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        AppWidget().getTextField(
                            hintText: "Current Password",
                            textEditingController:
                                profileController.currentPassword.value),
                        SizedBox(
                          height: 18.h,
                        ),
                        AppWidget().getTextField(
                            hintText: "New Password",
                            textEditingController:
                                profileController.newPassword.value),
                        SizedBox(
                          height: 18.h,
                        ),
                        CommonButton(
                            text: "Update & Close",
                            onTap: () {
                              onBack(context);
                            })
                      ],
                    ),
                  ));
            },
          ),
          SizedBox(
            height: 10,
          ),
          CommonContainer(
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Expanded(
                  flex: 0,
                  child: Row(
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
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: profileController.switchValues.length,
                    itemBuilder: (context, index) {
                      return Obx(() => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InterText(
                                  text: profileController.switchName[index],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                                FlutterSwitch(
                                  activeText: "",
                                  inactiveText: "",
                                  width: 50.0,
                                  height: 30.0,
                                  activeColor: AppColors.buttonColor,
                                  inactiveColor:
                                      Color.fromRGBO(217, 217, 217, 1),
                                  toggleSize: 20.0,
                                  value: profileController
                                      .switchValues[index].value,
                                  borderRadius: 50.0,
                                  showOnOff: true,
                                  onToggle: (val) async {
                                    profileController.toggleSwitch(index, val);
                                  },
                                )
                              ],
                            ),
                          ));
                    })
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        width: 300,
        child: CommonDrawer(),
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
}
