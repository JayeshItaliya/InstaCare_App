import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonContainer.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/peopleFlow/Controller/peopleController.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  final cx = Get.put(CommonController());
  final peopleController = Get.put(PeopleController());
  File? imageFile;
  File? setProfileImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title: MontserratText(
          text: "People",
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: AppColors.blue,
        ),
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 34,
                        decoration: BoxDecoration(
                            color: AppColors.yallow,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star_border_purple500_outlined,
                              color: AppColors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InterText(
                              text: "5/5",
                              color: AppColors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: Container(
                        width: 100,
                        height: 34,
                        decoration: BoxDecoration(
                            color: AppColors.yallow,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              color: AppColors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InterText(
                              text: "0 pts",
                              color: AppColors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        CommonBottonSheet(
                            context: context,
                            childView: Column(
                              children: [
                                InterText(
                                  text: "Attendance Points",
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 60,
                                  width: cx.width,
                                  padding: EdgeInsets.only(left: 10),
                                  margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                      bottom: cx.height / 8),
                                  decoration: BoxDecoration(
                                      color: AppColors.yallow,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        color: AppColors.blue,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InterText(
                                        text: "Total: 0 points",
                                        color: AppColors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 20),
                                  child: CommonButton(
                                    text: "+Add Custom Points",
                                    onTap: () {},
                                  ),
                                )
                              ],
                            ));
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        InterText(
                          text: "Granny Weatherwax",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                        InterText(
                          text: "LPN",
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
            width: cx.width,
            height: cx.height / 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    Row(
                                      children: [
                                        Expanded(
                                          child: AppWidget().getTextField(
                                              hintText: "Joel",
                                              label: "",
                                              filledColor:
                                                  AppColors.backGroundColor,
                                              textEditingController:
                                                  peopleController
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
                                                    peopleController
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
                                        textEditingController: peopleController
                                            .emailController.value),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    AppWidget().getTextField(
                                        hintText: "8888888888",
                                        label: "",
                                        filledColor: AppColors.backGroundColor,
                                        textEditingController: peopleController
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
            height: cx.height / 30,
          ),
          CommonContainer(
            width: cx.width,
            height: cx.height / 4,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        AppAssets.profileEdit,
                        height: 30,
                        width: 30,
                      ),
                      onTap: () {
                        CommonBottonSheet(
                            context: context,
                            childView: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: [
                                  InterText(
                                    text: "Update Document",
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CommonDropDown(
                                      context: context,
                                      list: peopleController.docTypeList,
                                      mycontrollerValue:
                                          peopleController.docValue,
                                      color: AppColors.backGroundColor),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  AppWidget().getTextField(
                                    hintText: "",
                                    filledColor: AppColors.backGroundColor,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Image.asset(AppAssets.camera)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child: Image.asset(AppAssets.gallery))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CommonButton(
                                    onTap: () {},
                                    text: "Upload & Save",
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ));
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
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
