import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonContainer.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/Utils/documentsRow.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/profileFlow/controller/profileController.dart';

import 'Controller/peopleController.dart';

class PeopleScreenDetil extends StatefulWidget {
  const PeopleScreenDetil({Key? key}) : super(key: key);

  @override
  State<PeopleScreenDetil> createState() => _PeopleScreenDetilState();
}

class _PeopleScreenDetilState extends State<PeopleScreenDetil> {
  final cx = Get.put(CommonController());
  final peopleController = Get.put(PeopleController());
  final profileController = Get.put(ProfileController());
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
      body: Column(
        children: [
          Expanded(
            flex: 13,
            child: Container(
              width: cx.width,
              height: cx.height / 3,
              margin: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 20,
              ),
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
                                                                imageFile ==
                                                                        null
                                                                    ? Container(
                                                                        height:
                                                                            180,
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            color: Colors.green,
                                                                            image: const DecorationImage(image: NetworkImage("https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"), fit: BoxFit.cover)),
                                                                      )
                                                                    : Container(
                                                                        height:
                                                                            180,
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            image: DecorationImage(image: FileImage(File(imageFile!.path)), fit: BoxFit.cover)),
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
                                        borderRadius:
                                            BorderRadius.circular(30)),
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
                                      onTap: () {
                                        onBack(context);
                                        CommonBottonSheet(
                                            context: context,
                                            childView: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InterText(
                                                    text: "Attendance Points",
                                                    color: AppColors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 30,
                                                  ),
                                                  Obx(
                                                    () => Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 60,
                                                              decoration: BoxDecoration(
                                                                  color: AppColors
                                                                      .buttonColor,
                                                                  shape: BoxShape
                                                                      .circle),
                                                              child: Icon(
                                                                  Icons.remove,
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                  size: 30),
                                                            ),
                                                            onTap: () {
                                                              if (peopleController
                                                                      .pointValue
                                                                      .value >
                                                                  0) {
                                                                peopleController
                                                                    .pointValue
                                                                    .value--;
                                                                print(peopleController
                                                                    .pointValue
                                                                    .value);
                                                              } else {
                                                                print("hii");
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 60,
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .backGroundColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30)),
                                                            child: InterText(
                                                              text: peopleController
                                                                  .pointValue
                                                                  .value
                                                                  .toString(),
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .black,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child:
                                                              GestureDetector(
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 60,
                                                              decoration: BoxDecoration(
                                                                  color: AppColors
                                                                      .buttonColor,
                                                                  shape: BoxShape
                                                                      .circle),
                                                              child: Icon(
                                                                  Icons.add,
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                  size: 30),
                                                            ),
                                                            onTap: () {
                                                              peopleController
                                                                  .pointValue
                                                                  .value++;
                                                              print(
                                                                  peopleController
                                                                      .pointValue
                                                                      .value);
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Obx(() => Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 0,
                                                            child: Row(
                                                              children: [
                                                                Transform.scale(
                                                                  scale: 1.5,
                                                                  child:
                                                                      Checkbox(
                                                                    shape:
                                                                        CircleBorder(),
                                                                    value: peopleController
                                                                        .dateValue
                                                                        .value,
                                                                    activeColor:
                                                                        AppColors
                                                                            .buttonColor,
                                                                    onChanged:
                                                                        (bool?
                                                                            newValue) {
                                                                      peopleController
                                                                          .dateValue
                                                                          .value = newValue!;
                                                                    },
                                                                  ),
                                                                ),
                                                                InterText(
                                                                  text: "Date",
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child:
                                                                  Container()),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child:
                                                                Transform.scale(
                                                              scale: 1.5,
                                                              child: Row(
                                                                children: [
                                                                  Checkbox(
                                                                    shape:
                                                                        CircleBorder(),
                                                                    value: peopleController
                                                                        .shiftValue
                                                                        .value,
                                                                    activeColor:
                                                                        AppColors
                                                                            .buttonColor,
                                                                    onChanged:
                                                                        (bool?
                                                                            newValue) {
                                                                      peopleController
                                                                          .shiftValue
                                                                          .value = newValue!;
                                                                    },
                                                                  ),
                                                                  InterText(
                                                                    text:
                                                                        "Shift",
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: AppColors
                                                                        .black,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: AppWidget()
                                                            .getTextField(
                                                          hintText:
                                                              "Select Date",
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: CommonDropDown(
                                                            context: context,
                                                            list:
                                                                peopleController
                                                                    .shiftList,
                                                            mycontrollerValue:
                                                                peopleController
                                                                    .shiftListValue),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  CommonDropDown(
                                                      context: context,
                                                      list: peopleController
                                                          .selectReasion,
                                                      mycontrollerValue:
                                                          peopleController
                                                              .selectReasionValue),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  AppWidget().getTextField(
                                                      hintText: "Note",
                                                      maxLine: 5),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  CommonButton(
                                                    text: "+Add Custom Points",
                                                    onTap: () {
                                                      onBack(context);
                                                    },
                                                  )
                                                ],
                                              ),
                                            ));
                                      },
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
          ),
          Expanded(
            flex: 20,
            child: ListView(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 20,
              ),
              children: [
                CommonContainer(
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
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
                            SizedBox(
                              height: 8,
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
                                                    filledColor: AppColors
                                                        .backGroundColor,
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
                                                      filledColor: AppColors
                                                          .backGroundColor,
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
                                              filledColor:
                                                  AppColors.backGroundColor,
                                              textEditingController:
                                                  peopleController
                                                      .emailController.value),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          AppWidget().getTextField(
                                              hintText: "8888888888",
                                              label: "",
                                              filledColor:
                                                  AppColors.backGroundColor,
                                              textEditingController:
                                                  peopleController
                                                      .mobileNumberController
                                                      .value),
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
                        height: 8,
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
                        height: 8,
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
                        height: 8,
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
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(
                            text: "Documents",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue,
                          ),
                          GestureDetector(
                            child: Image.asset(
                              AppAssets.addDoc,
                              height: 30,
                              width: 30,
                            ),
                            onTap: () {
                              // peopleController.documentList.clear();
                              CommonBottonSheet(
                                  context: context,
                                  childView: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Column(
                                      children: [
                                        InterText(
                                          text: "Update Document",
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.black,
                                        ),
                                        const SizedBox(
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
                                          hintText: "Expiration Date",
                                          filledColor:
                                              AppColors.backGroundColor,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Obx(
                                          () => peopleController
                                                  .documentList.isEmpty
                                              ? Row(
                                                  children: [
                                                    Expanded(
                                                        child: GestureDetector(
                                                      child: Image.asset(
                                                          AppAssets.camera),
                                                      onTap: () async {
                                                        PickedFile? pickedFile =
                                                            await ImagePicker()
                                                                .getImage(
                                                          source: ImageSource
                                                              .camera,
                                                          maxWidth: 1800,
                                                          maxHeight: 1000,
                                                        );
                                                        if (pickedFile !=
                                                            null) {
                                                          setState(() {
                                                            imageFile = File(
                                                                pickedFile
                                                                    .path);
                                                            peopleController
                                                                .documentList
                                                                .add(
                                                                    imageFile!);
                                                            print(peopleController
                                                                .documentList);
                                                          });
                                                        }
                                                      },
                                                    )),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                        child: GestureDetector(
                                                      child: Image.asset(
                                                          AppAssets.gallery),
                                                      onTap: () async {
                                                        PickedFile? pickedFile =
                                                            await ImagePicker()
                                                                .getImage(
                                                          source: ImageSource
                                                              .gallery,
                                                          maxWidth: 1800,
                                                          maxHeight: 1000,
                                                        );
                                                        if (pickedFile !=
                                                            null) {
                                                          setState(() {
                                                            imageFile = File(
                                                                pickedFile
                                                                    .path);
                                                            peopleController
                                                                .documentList
                                                                .add(
                                                                    imageFile!);
                                                            print(peopleController
                                                                .documentList);
                                                          });
                                                        }
                                                      },
                                                    ))
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    Expanded(
                                                      child: imageFile == null
                                                          ? Container(
                                                              height: 180,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: AppColors
                                                                    .blue,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                            )
                                                          : Container(
                                                              height: 180,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  image: DecorationImage(
                                                                      image: FileImage(File(
                                                                          imageFile!
                                                                              .path)),
                                                                      fit: BoxFit
                                                                          .cover)),
                                                            ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          GestureDetector(
                                                            child: Image.asset(
                                                                AppAssets
                                                                    .camera),
                                                            onTap: () async {
                                                              PickedFile?
                                                                  pickedFile =
                                                                  await ImagePicker()
                                                                      .getImage(
                                                                source:
                                                                    ImageSource
                                                                        .camera,
                                                                maxWidth: 1800,
                                                                maxHeight: 1000,
                                                              );
                                                              if (pickedFile !=
                                                                  null) {
                                                                setState(() {
                                                                  imageFile = File(
                                                                      pickedFile
                                                                          .path);
                                                                  peopleController
                                                                      .documentList
                                                                      .add(
                                                                          imageFile!);
                                                                  print(peopleController
                                                                      .documentList);
                                                                });
                                                              }
                                                            },
                                                          ),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          GestureDetector(
                                                            child: Image.asset(
                                                                AppAssets
                                                                    .gallery),
                                                            onTap: () async {
                                                              PickedFile?
                                                                  pickedFile =
                                                                  await ImagePicker()
                                                                      .getImage(
                                                                source:
                                                                    ImageSource
                                                                        .gallery,
                                                                maxWidth: 1800,
                                                                maxHeight: 1000,
                                                              );
                                                              if (pickedFile !=
                                                                  null) {
                                                                setState(() {
                                                                  imageFile = File(
                                                                      pickedFile
                                                                          .path);
                                                                  peopleController
                                                                      .documentList
                                                                      .add(
                                                                          imageFile!);
                                                                  print(peopleController
                                                                      .documentList);
                                                                });
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        CommonButton(
                                          onTap: () {
                                            onBack(context);
                                          },
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
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: cx.width,
                        height: 100,
                        child: peopleController.documentList.isEmpty
                            ? Container()
                            : ListView.builder(
                                itemCount: peopleController.documentList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    alignment: Alignment.bottomCenter,
                                    width: 130,
                                    margin: EdgeInsets.only(
                                      left: 8,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: FileImage(File(
                                                peopleController
                                                    .documentList[index].path)),
                                            fit: BoxFit.cover)),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: cx.width,
                                      height: 23,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(2, 5, 10, 0.3),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                      ),
                                      child: InterText(
                                        text: "certificate",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  );
                                }),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: cx.height / 30,
                ),
                CommonContainer(
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
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
                            SizedBox(
                              height: 8,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                        height: 8,
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
                        height: 8,
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
                        height: 8,
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
                              text: "General",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blue,
                            ),
                            SizedBox(
                              height: 8,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                        height: 8,
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
                            SizedBox(
                              height: 8,
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
                        height: 8,
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
                            SizedBox(
                              height: 8,
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
                  height: cx.height / 30,
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
                          itemCount: peopleController.switchValues.length,
                          itemBuilder: (context, index) {
                            return Obx(() => Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InterText(
                                        text:
                                            peopleController.switchName[index],
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
                                        inactiveColor:
                                            Color.fromRGBO(217, 217, 217, 1),
                                        toggleSize: 20.0,
                                        value: peopleController
                                            .switchValues[index].value,
                                        borderRadius: 50.0,
                                        showOnOff: true,
                                        onToggle: (val) async {
                                          peopleController.toggleSwitch(
                                              index, val);
                                        },
                                      )
                                    ],
                                  ),
                                ));
                          })
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(
                            text: "Basic Information",
                            color: AppColors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
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
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InterText(
                                          text: "Basic Information",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 30,
                                          color: AppColors.black,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        AppWidget().getTextField(
                                            hintText: "Driver License Number"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        AppWidget().getTextField(
                                            hintText: "Driver License Status"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        AppWidget().getTextField(
                                            hintText: "SSN/TaxID"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CommonDropDown(
                                            context: context,
                                            list:
                                                profileController.timeLanguage,
                                            mycontrollerValue: profileController
                                                .languageController,
                                            color: AppColors.backGroundColor),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CommonButton(
                                          text: "Save & Close",
                                          onTap: () {
                                            onBack(context);
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
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
                      InterText(
                        text: "Effective Start Date",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "February 01, 2023",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "Driver License Number",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "--",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "Driver License State",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "--",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "SSN/TaxID",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "••••••••••••••••",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "Uniform Size",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "XXL",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(
                            text: "Completed Drug Screening",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                          Obx(() => FlutterSwitch(
                                activeText: "",
                                inactiveText: "",
                                width: 50.0,
                                height: 30.0,
                                activeColor: AppColors.deepGreen,
                                inactiveColor: Color.fromRGBO(217, 217, 217, 1),
                                toggleSize: 20.0,
                                value: profileController.switchValues[0].value,
                                borderRadius: 50.0,
                                showOnOff: true,
                                onToggle: (val) async {
                                  profileController.toggleSwitch(0, val);
                                },
                              ))
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(
                            text: "Emergency Contact Information",
                            color: AppColors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
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
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InterText(
                                          text: "Emergency Contact",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 30,
                                          color: AppColors.black,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        AppWidget().getTextField(
                                            hintText: "Bred Weatherwax"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        AppWidget().getTextField(
                                            hintText: "8888888888"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CommonDropDown(
                                            context: context,
                                            list:
                                                profileController.timeLanguage,
                                            mycontrollerValue: profileController
                                                .languageController,
                                            color: AppColors.backGroundColor),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CommonDropDown(
                                            context: context,
                                            list:
                                                profileController.timeLanguage,
                                            mycontrollerValue: profileController
                                                .languageController,
                                            color: AppColors.backGroundColor),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        AppWidget().getTextField(
                                            hintText:
                                                "RN/LPN/CNA License Number"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CommonButton(
                                          text: "Save & Close",
                                          onTap: () {
                                            onBack(context);
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
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
                      InterText(
                        text: "Effective Start Date",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "Bred Weatherwax",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "Emergency Contact Number",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "8888888888",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "Emergency Contact Relationship",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "Spouse",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "How many miles you willing to travel to work?",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "25miles",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "RN/LPN/CNA License Number",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "--",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(
                            text: "Documents",
                            color: AppColors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.deepGreen,
                        documentText: "IL W-4 (Withholding / Exemptions)",
                        documentButtonText: "Uploaded",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.deepGreen,
                        documentText: "Employment Verification)",
                        documentButtonText: "Uploaded",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.buttonColor,
                        documentText: "Background Check Authentication",
                        documentButtonText: "Add",
                        addButton: true,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.deepGreen,
                        documentText: "Direct Deposit Form",
                        documentButtonText: "Uploaded",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.deepGreen,
                        documentText: "Health Insurance  Form",
                        documentButtonText: "Uploaded",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.buttonColor,
                        documentText: "8850",
                        documentButtonText: "Add",
                        addButton: true,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.buttonColor,
                        documentText: "CPR Certification",
                        documentButtonText: "Add",
                        addButton: true,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.buttonColor,
                        documentText: "Employee Handbook",
                        documentButtonText: "Add",
                        addButton: true,
                        onTap: () {},
                      ),
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
                      InterText(
                        text: "Immunization",
                        color: AppColors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(
                            text: "Verify TB Test Results (Annual)",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                          Obx(() => FlutterSwitch(
                                activeText: "",
                                inactiveText: "",
                                width: 50.0,
                                height: 30.0,
                                activeColor: AppColors.deepGreen,
                                inactiveColor: Color.fromRGBO(217, 217, 217, 1),
                                toggleSize: 20.0,
                                value: profileController.switchValues[0].value,
                                borderRadius: 50.0,
                                showOnOff: true,
                                onToggle: (val) async {
                                  profileController.toggleSwitch(0, val);
                                },
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "Start TB Test Date",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "February 01, 2023",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "Last TB Test Date",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "February 01, 2023",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "COVID-19 Immunization Date",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InterText(
                        text: "June 18, 2022",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: InterText(
                              text:
                                  "Employee Influenza Vaccine Consent-Declination Form",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                              maxLines: 2,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Obx(() => FlutterSwitch(
                                  activeText: "",
                                  inactiveText: "",
                                  width: 50.0,
                                  height: 30.0,
                                  activeColor: AppColors.deepGreen,
                                  inactiveColor:
                                      Color.fromRGBO(217, 217, 217, 1),
                                  toggleSize: 20.0,
                                  value:
                                      profileController.switchValues[0].value,
                                  borderRadius: 50.0,
                                  showOnOff: true,
                                  onToggle: (val) async {
                                    profileController.toggleSwitch(0, val);
                                  },
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: InterText(
                              text:
                                  "Religious Exemption Form - Employee Influenza",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                              maxLines: 2,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Obx(() => FlutterSwitch(
                                  activeText: "",
                                  inactiveText: "",
                                  width: 50.0,
                                  height: 30.0,
                                  activeColor: AppColors.deepGreen,
                                  inactiveColor:
                                      Color.fromRGBO(217, 217, 217, 1),
                                  toggleSize: 20.0,
                                  value:
                                      profileController.switchValues[0].value,
                                  borderRadius: 50.0,
                                  showOnOff: true,
                                  onToggle: (val) async {
                                    profileController.toggleSwitch(0, val);
                                  },
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: InterText(
                              text:
                                  "Medical Exemption Form - Employee Influenza",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                              maxLines: 2,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Obx(() => FlutterSwitch(
                                  activeText: "",
                                  inactiveText: "",
                                  width: 50.0,
                                  height: 30.0,
                                  activeColor: AppColors.deepGreen,
                                  inactiveColor:
                                      Color.fromRGBO(217, 217, 217, 1),
                                  toggleSize: 20.0,
                                  value:
                                      profileController.switchValues[0].value,
                                  borderRadius: 50.0,
                                  showOnOff: true,
                                  onToggle: (val) async {
                                    profileController.toggleSwitch(0, val);
                                  },
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: cx.height / 5,
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.yallow,
        onPressed: () {},
        child: const Icon(Icons.mail_outline, color: AppColors.white),
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
