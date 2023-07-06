import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/Responsive.dart';
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
import 'package:instacare/screens/dashBoardFlow/view/peopleDashBoardFlow/Controller/peopleController.dart';
import 'package:instacare/screens/profileFlow/controller/profileController.dart';


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
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title: MontserratText(
          text: "People",
          fontSize: Reponsive_.crosslength * 0.025,
          fontWeight: FontWeight.w700,
          color: AppColors.blue,
        ),
      ),
      body: Column(
        children: [
          Container(
            width: cx.width,
            margin: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength * 0.015),
            decoration: const BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: Reponsive_.crosslength * 0.02,
                          ),
                          InterText(
                            text: "Emp. ID",
                            fontSize: Reponsive_.px12,
                            fontWeight: FontWeight.normal,
                            color: AppColors.buttonColor,
                          ),
                          InterText(
                            text: "511",
                            fontSize: Reponsive_.crosslength * 0.018,
                            fontWeight: FontWeight.bold,
                            color: AppColors.buttonColor,
                          ),
                          SizedBox(
                            height: Reponsive_.px18,
                          ),
                          cx.instacareLoginValue.toString().contains("instacare")?
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength * 0.025),
                              padding: EdgeInsets.symmetric(vertical: Reponsive_.crosslength * 0.0055, horizontal: Reponsive_.crosslength * 0.005),
                              alignment: Alignment.center,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.yallow,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.star_border_purple500_outlined,
                                    color: AppColors.blue,
                                    size: Reponsive_.crosslength * 0.02,
                                  ),
                                  InterText(
                                    text: "5/5",
                                    color: AppColors.blue,
                                    fontSize: Reponsive_.px16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    height: Reponsive_.crosslength * 0.012,
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                            onTap: () {},
                          ):Container(),
                          cx.instacareLoginValue.toString().contains("faculty")?
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength * 0.025),
                              padding: EdgeInsets.symmetric(vertical: Reponsive_.crosslength * 0.0055, horizontal: Reponsive_.crosslength * 0.005),
                              alignment: Alignment.center,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.yallow,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.star_border_purple500_outlined,
                                    color: AppColors.blue,
                                    size: Reponsive_.crosslength * 0.02,
                                  ),
                                  InterText(
                                    text: "5/5",
                                    color: AppColors.blue,
                                    fontSize: Reponsive_.px16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    height: Reponsive_.crosslength * 0.012,
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                            onTap: () {},
                          ):Container(),
                          SizedBox(
                            height: Reponsive_.crosslength * 0.02,
                          ),
                        ],
                      ),
                    ),
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
                      child: Stack(
                        children: [
                          setProfileImage == null
                              ? Container(
                                  height: Reponsive_.crosslength * 0.1,
                                  width: Reponsive_.crosslength * 0.1,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                                          fit: BoxFit.cover)),
                                )
                              : Container(
                                  height: Reponsive_.crosslength * 0.1,
                                  width: Reponsive_.crosslength * 0.1,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image:
                                              FileImage(File(imageFile!.path)),
                                          fit: BoxFit.cover)),
                                ),
                          Positioned(bottom: 0, right: 0, child: edit_btn())
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: Reponsive_.crosslength * 0.02,
                          ),
                          InterText(
                            text: "Status",
                            fontSize: Reponsive_.px12,
                            fontWeight: FontWeight.normal,
                            color: AppColors.buttonColor,
                          ),
                          InterText(
                            text: "Available",
                            fontSize: Reponsive_.px18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.buttonColor,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength * 0.018,
                          ),
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: Reponsive_.crosslength * 0.025),
                              padding: EdgeInsets.symmetric(
                                  vertical: Reponsive_.crosslength * 0.0055,
                                  horizontal: Reponsive_.crosslength * 0.005),
                              alignment: Alignment.center,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.yallow,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.access_time_rounded,
                                    color: AppColors.blue,
                                    size: Reponsive_.crosslength * 0.02,
                                  ),
                                  InterText(
                                    text: "0 pts",
                                    color: AppColors.blue,
                                    fontSize: Reponsive_.px16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    height: Reponsive_.crosslength * 0.012,
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              CommonBottonSheet(
                                  context: context,
                                  childView: Padding(
                                    padding: EdgeInsets.only(top:Reponsive_.crosslength*0.02,left:Reponsive_.crosslength*0.015,right:Reponsive_.crosslength*0.015,bottom:Reponsive_.crosslength*0.015,),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        MontserratText(
                                          text: "Attendance Points",
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: Reponsive_.px30,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: Reponsive_.crosslength*0.02,
                                        ),
                                        Container(
                                          width: cx.width,
                                          padding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.01,vertical: Reponsive_.crosslength*0.015,),

                                          decoration: BoxDecoration(
                                              color: AppColors.yallow,
                                              borderRadius:
                                              BorderRadius.circular(30)),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.access_time_rounded,
                                                color: AppColors.blue,
                                                size: Reponsive_.crosslength*0.03,
                                              ),
                                              InterText(
                                                text: "   Total: 0 points",
                                                color: AppColors.blue,
                                                fontWeight: FontWeight.w600,
                                                fontSize: Reponsive_.px24,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: Reponsive_.crosslength*0.1,),
                                        CommonButton(
                                          text: "+ADD CUSTOM POINTS",
                                          onTap: () {
                                            onBack(context);
                                            CommonBottonSheet(
                                                context: context,
                                                childView: Padding(
                                                  padding:
                                                  EdgeInsets.only(top:Reponsive_.crosslength*0.025,left:Reponsive_.crosslength*0.025,right:Reponsive_.crosslength*0.025,),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      MontserratText(
                                                        text: "Attendance Points",
                                                        color: AppColors.black,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: Reponsive_.px30,
                                                      ),
                                                      SizedBox(height: Reponsive_.crosslength*0.02,),
                                                      Obx(
                                                            () => Row(
                                                          children: [
                                                            GestureDetector(
                                                              child: Container(
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                                height: Reponsive_.crosslength*0.054,
                                                                width: Reponsive_.crosslength*0.054,
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
                                                                    size: Reponsive_.crosslength*0.027),
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
                                                            SizedBox(width: Reponsive_.crosslength*0.01,),
                                                            Expanded(
                                                              child: Container(
                                                                alignment: Alignment
                                                                    .center,
                                                                padding: EdgeInsets.symmetric(vertical: Reponsive_.crosslength*0.018),
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
                                                                  fontSize: Reponsive_.px18,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                                  color: AppColors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(width: Reponsive_.crosslength*0.01,),
                                                            GestureDetector(
                                                              child: Container(
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                                height: Reponsive_.crosslength*0.054,
                                                                width: Reponsive_.crosslength*0.054,
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
                                                                    size: Reponsive_.crosslength*0.027),
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
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: Reponsive_.crosslength*0.015,
                                                      ),
                                                      Obx(() => Row(
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              children: [
                                                                Transform.scale(
                                                                  scale: 1.2,
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
                                                                  fontSize: Reponsive_.px16,
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
                                                            Container(
                                                              alignment: Alignment.centerLeft,
                                                              child: Transform.scale(
                                                                scale: 1.2,
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
                                                                      Reponsive_.px16,
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
                                                            width: Reponsive_.crosslength*0.01,
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: CommonDropDown(
                                                                context: context,hint: 'Select Shift',
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
                                                        height: Reponsive_.crosslength*0.01,
                                                      ),
                                                      CommonDropDown(
                                                          context: context,
                                                          hint: 'Select Reason',
                                                          list: peopleController
                                                              .selectReasion,
                                                          mycontrollerValue:
                                                          peopleController
                                                              .selectReasionValue),
                                                      SizedBox(
                                                        height: Reponsive_.crosslength*0.01,
                                                      ),
                                                      AppWidget().getTextField(
                                                          hintText: "Note",
                                                          maxLine: 5),
                                                      SizedBox(
                                                        height: Reponsive_.crosslength*0.01,
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
                                        )
                                      ],
                                    ),
                                  ));
                            },
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength * 0.02,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                InterText(
                  text: "Granny Weatherwax",
                  fontSize: Reponsive_.px24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
                SizedBox(
                  height: Reponsive_.crosslength * 0.005,
                ),
                InterText(
                  text: "LPN",
                  fontSize: Reponsive_.crosslength * 0.016,
                  fontWeight: FontWeight.bold,
                  color: AppColors.buttonColor,
                ),
                SizedBox(
                  height: Reponsive_.crosslength * 0.015,
                ),
              ],
            ),
          ),

          Expanded(
            flex: 20,
            child: ListView(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              children: [
                CommonContainer(
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(
                            text: "Account Information",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength * 0.012,
                          ),
                          InkWell(
                            child: Image.asset(
                              AppAssets.profileEdit,
                              height: Reponsive_.crosslength * 0.03,
                              width: Reponsive_.crosslength * 0.03,
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
                                        Row(
                                          children: [
                                            Expanded(
                                              child: AppWidget().getTextField(
                                                  hintText: "First Name",
                                                  label: "",inputTextStyle: GoogleFonts.inter(fontSize: Reponsive_.px18,fontWeight: FontWeight.w400),
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
                                                    hintText: "Last Name",
                                                    label: "",
                                                    inputTextStyle: GoogleFonts.inter(fontSize: Reponsive_.px18,fontWeight: FontWeight.w400),
                                                    filledColor: AppColors
                                                        .backGroundColor,
                                                    textEditingController:
                                                    peopleController
                                                        .lastNameController
                                                        .value)),
                                          ],
                                        ),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                        AppWidget().getTextField(
                                            hintText: "Email",
                                            label: "",
                                            inputTextStyle: GoogleFonts.inter(fontSize: Reponsive_.px18,fontWeight: FontWeight.w400),
                                            filledColor:
                                            AppColors.backGroundColor,
                                            textEditingController:
                                            peopleController
                                                .emailController.value),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                        AppWidget().getTextField(
                                            hintText: "Phone",
                                            label: "",
                                            inputTextStyle: GoogleFonts.inter(fontSize: Reponsive_.px18,fontWeight: FontWeight.w400),
                                            filledColor:
                                            AppColors.backGroundColor,
                                            textEditingController:
                                            peopleController
                                                .mobileNumberController
                                                .value),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
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
                      SizedBox(
                        height: Reponsive_.crosslength * 0.01,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
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
                                  text: "Joel",
                                  height: 1.5,
                                  fontSize: Reponsive_.px18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InterText(
                                  text: "Last Name",
                                  fontSize: Reponsive_.px12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                                InterText(
                                  text: "Newman",
                                  height: 1.5,
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
                        height: Reponsive_.crosslength * 0.012,
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
                            text: "joelnewman@gmail.com ",
                            fontSize: Reponsive_.px18,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: AppColors.black,
                          )
                        ],
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
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
                            text: "8888888888",
                            fontSize: Reponsive_.px18,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: AppColors.black,
                          )
                        ],
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.01,
                      ),
                    ],
                  ),
                ),
                CommonContainer(
                  margintop: Reponsive_.crosslength * 0.01,
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(
                            text: "Documents",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue,
                          ),
                          GestureDetector(
                            child: Image.asset(
                              AppAssets.addDoc,
                              height: Reponsive_.crosslength * 0.03,
                              width: Reponsive_.crosslength * 0.03,
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
                                          fontSize:
                                          Reponsive_.crosslength * 0.03,
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
                                                      height: Reponsive_
                                                          .crosslength *
                                                          0.012,
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
                        height: Reponsive_.crosslength * 0.012,
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
                CommonContainer(
                  margintop: Reponsive_.crosslength * 0.01,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(
                            text: "Address",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength * 0.012,
                          ),
                          InkWell(
                            child: Image.asset(
                              AppAssets.profileEdit,
                              height: Reponsive_.crosslength * 0.03,
                              width: Reponsive_.crosslength * 0.03,
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
                                          fontSize:
                                          Reponsive_.crosslength * 0.03,
                                        ),
                                        SizedBox(height: Reponsive_.crosslength*0.015,),
                                        CommonDropDown(
                                            context: context,
                                            hint: 'Select Country',
                                            mycontrollerValue:
                                            profileController
                                                .countryController,
                                            list: profileController.list,
                                            color: AppColors.backGroundColor
                                        ),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: AppWidget().getTextField(
                                                  hintText: "City",
                                                  label: "",
                                                  inputTextStyle: GoogleFonts.inter(fontSize: Reponsive_.px18,fontWeight: FontWeight.w400),
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
                                                    hintText: "State",
                                                    label: "",
                                                    inputTextStyle: GoogleFonts.inter(fontSize: Reponsive_.px18,fontWeight: FontWeight.w400),
                                                    filledColor: AppColors
                                                        .backGroundColor,
                                                    textEditingController:
                                                    profileController
                                                        .stateController
                                                        .value)),
                                          ],
                                        ),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                        AppWidget().getTextField(
                                            hintText: "Zip",
                                            label: "",
                                            inputTextStyle: GoogleFonts.inter(fontSize: Reponsive_.px18,fontWeight: FontWeight.w400),
                                            filledColor:
                                            AppColors.backGroundColor,
                                            textEditingController:
                                            profileController
                                                .zipController.value),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
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
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
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
                            text: "Joel Newman",
                            fontSize: Reponsive_.px18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          )
                        ],
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
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
                                  text: "United States",
                                  fontSize: Reponsive_.px18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
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
                                  text: "Skokie",
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
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
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
                                  text: "illinois",
                                  fontSize: Reponsive_.px18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InterText(
                                  text: "Zip",
                                  fontSize: Reponsive_.px12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                                InterText(
                                  text: "60077",
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
                CommonContainer(
                  margintop: Reponsive_.crosslength * 0.01,
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(
                            text: "General",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength * 0.012,
                          ),
                          InkWell(
                            child: Image.asset(
                              AppAssets.profileEdit,
                              height: Reponsive_.crosslength * 0.03,
                              width: Reponsive_.crosslength * 0.03,
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
                                          fontSize:
                                          Reponsive_.crosslength * 0.03,
                                        ),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                        CommonDropDown(
                                            context: context,
                                            hint: 'Select Time Zone',
                                            list: profileController.timeZone,
                                            mycontrollerValue:
                                            profileController
                                                .timeZoneController,
                                            color: AppColors.backGroundColor),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                        CommonDropDown(
                                            context: context,hint: 'Select Language',
                                            list: profileController
                                                .timeLanguage,
                                            mycontrollerValue:
                                            profileController
                                                .languageController,
                                            color: AppColors.backGroundColor),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
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
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
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
                            text: "Central Time (US/Can) (GMT-6:00)",
                            fontSize: Reponsive_.px18,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          )
                        ],
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
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
                            text: "English",
                            fontSize: Reponsive_.px18,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: AppColors.black,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                CommonContainer(
                  margintop: Reponsive_.crosslength * 0.01,
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(
                            text: "Notifications",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue,
                          ),
                        ],
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: peopleController.switchValues.length,
                          itemBuilder: (context, index) {
                            return Obx(() => GestureDetector(
                              onTap: () {
                                peopleController.toggleSwitch(
                                    index,
                                    peopleController
                                        .switchValues[index].value);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: Reponsive_.crosslength * 0.01),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    InterText(
                                      text: peopleController
                                          .switchName[index],
                                      fontSize: Reponsive_.px14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.black,
                                    ),
                                    FlutterSwitch(
                                      activeText: "",
                                      inactiveText: "",
                                      width: Reponsive_.crosslength * 0.05,
                                      height:
                                      Reponsive_.crosslength * 0.025,
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
                              ),
                            ));
                          })
                    ],
                  ),
                ),
                CommonContainer(
                  margintop: Reponsive_.crosslength * 0.01,
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
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                          ),
                          GestureDetector(
                            child: Image.asset(
                              AppAssets.profileEdit,
                              height: Reponsive_.crosslength * 0.03,
                              width: Reponsive_.crosslength * 0.03,
                            ),
                            onTap: () {
                              CommonBottonSheet(
                                  context: context,
                                  childView: Padding(
                                    padding: EdgeInsets.all(Reponsive_.crosslength*0.015),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        InterText(
                                          text: "Basic Information",
                                          fontWeight: FontWeight.w700,
                                          fontSize:
                                          Reponsive_.crosslength * 0.03,
                                          color: AppColors.black,
                                        ),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.015,
                                        ),
                                        AppWidget().getTextField(
                                          hintText: "Driver License Number",inputTextStyle: GoogleFonts.inter(fontSize: Reponsive_.px18,fontWeight: FontWeight.w400),),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                        AppWidget().getTextField(
                                          hintText: "Driver License Status",inputTextStyle: GoogleFonts.inter(fontSize: Reponsive_.px18,fontWeight: FontWeight.w400),),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                        AppWidget().getTextField(
                                          hintText: "SSN/TaxID",inputTextStyle: GoogleFonts.inter(fontSize: Reponsive_.px18,fontWeight: FontWeight.w400),),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                        CommonDropDown(
                                            context: context,hint: 'Select Uniform Size',
                                            list: profileController.uniformSizeArr,
                                            mycontrollerValue: profileController
                                                .selectedSize,
                                            color: AppColors.backGroundColor),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                        CommonButton(
                                          text: "Save & Close",
                                          onTap: () {
                                            onBack(context);
                                          },
                                        ),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                      ],
                                    ),
                                  ));
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.01,
                      ),
                      InterText(
                        text: "Effective Start Date",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "February 01, 2023",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      InterText(
                        text: "Driver License Number",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "--",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      InterText(
                        text: "Driver License State",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      InterText(
                        text: "--",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      InterText(
                        text: "SSN/TaxID",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "••••••••••••••••",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      InterText(
                        text: "Uniform Size",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "XXL",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      GestureDetector(
                        onTap: () {
                          profileController.toggleSwitch(
                              0, profileController.switchValues[0].value);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InterText(
                              text: "Completed Drug Screening",
                              fontSize: Reponsive_.px12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            Obx(() => FlutterSwitch(
                              activeText: "",
                              inactiveText: "",
                              width: Reponsive_.crosslength * 0.05,
                              height: Reponsive_.crosslength * 0.025,
                              activeColor: AppColors.deepGreen,
                              inactiveColor:
                              Color.fromRGBO(217, 217, 217, 1),
                              toggleSize: 20.0,
                              value:
                              profileController.switchValues[0].value,
                              borderRadius: 50.0,
                              showOnOff: true,
                              onToggle: (val) async {
                                profileController.toggleSwitch(0, !val);
                              },
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                CommonContainer(
                  margintop: Reponsive_.crosslength * 0.01,
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
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength * 0.01,
                          ),
                          GestureDetector(
                            child: Image.asset(
                              AppAssets.profileEdit,
                              height: Reponsive_.crosslength * 0.03,
                              width: Reponsive_.crosslength * 0.03,
                            ),
                            onTap: () {
                              CommonBottonSheet(
                                  context: context,
                                  childView: Padding(
                                    padding: EdgeInsets.all(Reponsive_.crosslength*0.015),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        InterText(
                                          text: "Emergency Contact",
                                          fontWeight: FontWeight.w700,
                                          fontSize:
                                          Reponsive_.crosslength * 0.03,
                                          color: AppColors.black,
                                        ),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.015,
                                        ),
                                        AppWidget().getTextField(
                                          hintText: "Contact Name",inputTextStyle: GoogleFonts.inter(fontSize: Reponsive_.px18,fontWeight: FontWeight.w400),),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                        AppWidget().getTextField(
                                          hintText: "Phone",
                                          inputTextStyle: GoogleFonts.inter(fontSize: Reponsive_.px18,fontWeight: FontWeight.w400),),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                        CommonDropDown(
                                            context: context,
                                            list:
                                            profileController.timeLanguage,
                                            mycontrollerValue: profileController
                                                .languageController,
                                            color: AppColors.backGroundColor),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                        CommonDropDown(
                                            context: context,
                                            list:
                                            profileController.timeLanguage,
                                            mycontrollerValue: profileController
                                                .languageController,
                                            color: AppColors.backGroundColor),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                        AppWidget().getTextField(
                                            hintText:
                                            "RN/LPN/CNA License Number"),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                        CommonButton(
                                          text: "Save & Close",
                                          onTap: () {
                                            onBack(context);
                                          },
                                        ),
                                        SizedBox(
                                          height:
                                          Reponsive_.crosslength * 0.012,
                                        ),
                                      ],
                                    ),
                                  ));
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      InterText(
                        text: "Emergency Contact Name",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "Bred Weatherwax",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      InterText(
                        text: "Emergency Contact Number",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "8888888888",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      InterText(
                        text: "Emergency Contact Relationship",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "Spouse",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      InterText(
                        text: "How many miles you willing to travel to work?",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "25miles",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      InterText(
                        text: "RN/LPN/CNA License Number",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "--",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                    ],
                  ),
                ),
                ///Profile Flow
                cx.instacareLoginValue.toString().contains("instacare")?
                CommonContainer(
                  margintop: Reponsive_.crosslength * 0.01,
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
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.deepGreen,
                        documentText: "IL W-4 (Withholding / Exemptions)",
                        documentButtonText: "Uploaded",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.deepGreen,
                        documentText: "Employment Verification)",
                        documentButtonText: "Uploaded",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.buttonColor,
                        documentText: "Background Check Authentication",
                        documentButtonText: "Add",
                        addButton: true,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.deepGreen,
                        documentText: "Direct Deposit Form",
                        documentButtonText: "Uploaded",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.deepGreen,
                        documentText: "Health Insurance  Form",
                        documentButtonText: "Uploaded",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.buttonColor,
                        documentText: "8850",
                        documentButtonText: "Add",
                        addButton: true,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.buttonColor,
                        documentText: "CPR Certification",
                        documentButtonText: "Add",
                        addButton: true,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
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
                )
                    :Container(),
                cx.instacareLoginValue.toString().contains("instacare")?
                CommonContainer(
                  margintop: Reponsive_.crosslength * 0.01,
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      InterText(
                        text: "Immunization",
                        color: AppColors.blue,
                        fontSize: Reponsive_.px16,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      GestureDetector(
                        onTap: () {
                          profileController.toggleSwitch(
                              0, profileController.switchValues[0].value);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InterText(
                              text: "Verify TB Test Results (Annual)",
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            Obx(() => FlutterSwitch(
                              activeText: "",
                              inactiveText: "",
                              width: Reponsive_.crosslength * 0.05,
                              height: Reponsive_.crosslength * 0.025,
                              activeColor: AppColors.deepGreen,
                              inactiveColor:
                              Color.fromRGBO(217, 217, 217, 1),
                              toggleSize: 20.0,
                              value:
                              profileController.switchValues[0].value,
                              borderRadius: 50.0,
                              showOnOff: true,
                              onToggle: (val) async {
                                profileController.toggleSwitch(0, !val);
                              },
                            ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      InterText(
                        text: "Start TB Test Date",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "February 01, 2023",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      InterText(
                        text: "Last TB Test Date",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "February 01, 2023",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      InterText(
                        text: "COVID-19 Immunization Date",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "June 18, 2022",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      GestureDetector(
                        onTap: () {
                          profileController.toggleSwitch(
                              0, profileController.switchValues[0].value);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: InterText(
                                text:
                                "Employee Influenza Vaccine Consent-Declination Form",
                                fontSize: Reponsive_.px14,
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
                                width: Reponsive_.crosslength * 0.05,
                                height: Reponsive_.crosslength * 0.025,
                                activeColor: AppColors.deepGreen,
                                inactiveColor:
                                Color.fromRGBO(217, 217, 217, 1),
                                toggleSize: 20.0,
                                value:
                                profileController.switchValues[0].value,
                                borderRadius: 50.0,
                                showOnOff: true,
                                onToggle: (val) async {
                                  profileController.toggleSwitch(0, !val);
                                },
                              )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      GestureDetector(
                        onTap: () {
                          profileController.toggleSwitch(
                              1, profileController.switchValues[1].value);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: InterText(
                                text:
                                "Religious Exemption Form - Employee Influenza",
                                fontSize: Reponsive_.px14,
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
                                width: Reponsive_.crosslength * 0.05,
                                height: Reponsive_.crosslength * 0.025,
                                activeColor: AppColors.deepGreen,
                                inactiveColor:
                                Color.fromRGBO(217, 217, 217, 1),
                                toggleSize: 20.0,
                                value:
                                profileController.switchValues[1].value,
                                borderRadius: 50.0,
                                showOnOff: true,
                                onToggle: (val) async {
                                  profileController.toggleSwitch(1, !val);
                                },
                              )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      GestureDetector(
                        onTap: () {
                          profileController.toggleSwitch(
                              2, profileController.switchValues[2].value);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: InterText(
                                text:
                                "Medical Exemption Form - Employee Influenza",
                                fontSize: Reponsive_.px14,
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
                                width: Reponsive_.crosslength * 0.05,
                                height: Reponsive_.crosslength * 0.025,
                                activeColor: AppColors.deepGreen,
                                inactiveColor:
                                Color.fromRGBO(217, 217, 217, 1),
                                toggleSize: 20.0,
                                value:
                                profileController.switchValues[2].value,
                                borderRadius: 50.0,
                                showOnOff: true,
                                onToggle: (val) async {
                                  profileController.toggleSwitch(2, !val);
                                },
                              )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                    :Container(),
                ///Faculty Flow
                cx.instacareLoginValue.toString().contains("faculty")?
                CommonContainer(
                  margintop: Reponsive_.crosslength * 0.01,
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
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.deepGreen,
                        documentText: "IL W-4 (Withholding / Exemptions)",
                        documentButtonText: "Uploaded",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.deepGreen,
                        documentText: "Employment Verification)",
                        documentButtonText: "Uploaded",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.buttonColor,
                        documentText: "Background Check Authentication",
                        documentButtonText: "Add",
                        addButton: true,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.deepGreen,
                        documentText: "Direct Deposit Form",
                        documentButtonText: "Uploaded",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.deepGreen,
                        documentText: "Health Insurance  Form",
                        documentButtonText: "Uploaded",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.buttonColor,
                        documentText: "8850",
                        documentButtonText: "Add",
                        addButton: true,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      DocumentsRow(
                        buttonColor: AppColors.buttonColor,
                        documentText: "CPR Certification",
                        documentButtonText: "Add",
                        addButton: true,
                        onTap: () {},
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
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
                )
                    :Container(),
                cx.instacareLoginValue.toString().contains("faculty")?
                CommonContainer(
                  margintop: Reponsive_.crosslength * 0.01,
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      InterText(
                        text: "Immunization",
                        color: AppColors.blue,
                        fontSize: Reponsive_.px16,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      GestureDetector(
                        onTap: () {
                          profileController.toggleSwitch(
                              0, profileController.switchValues[0].value);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InterText(
                              text: "Verify TB Test Results (Annual)",
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            Obx(() => FlutterSwitch(
                              activeText: "",
                              inactiveText: "",
                              width: Reponsive_.crosslength * 0.05,
                              height: Reponsive_.crosslength * 0.025,
                              activeColor: AppColors.deepGreen,
                              inactiveColor:
                              Color.fromRGBO(217, 217, 217, 1),
                              toggleSize: 20.0,
                              value:
                              profileController.switchValues[0].value,
                              borderRadius: 50.0,
                              showOnOff: true,
                              onToggle: (val) async {
                                profileController.toggleSwitch(0, !val);
                              },
                            ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      InterText(
                        text: "Start TB Test Date",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "February 01, 2023",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      InterText(
                        text: "Last TB Test Date",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "February 01, 2023",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      InterText(
                        text: "COVID-19 Immunization Date",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterText(
                        text: "June 18, 2022",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px18,
                        color: AppColors.black,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      GestureDetector(
                        onTap: () {
                          profileController.toggleSwitch(
                              0, profileController.switchValues[0].value);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: InterText(
                                text:
                                "Employee Influenza Vaccine Consent-Declination Form",
                                fontSize: Reponsive_.px14,
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
                                width: Reponsive_.crosslength * 0.05,
                                height: Reponsive_.crosslength * 0.025,
                                activeColor: AppColors.deepGreen,
                                inactiveColor:
                                Color.fromRGBO(217, 217, 217, 1),
                                toggleSize: 20.0,
                                value:
                                profileController.switchValues[0].value,
                                borderRadius: 50.0,
                                showOnOff: true,
                                onToggle: (val) async {
                                  profileController.toggleSwitch(0, !val);
                                },
                              )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      GestureDetector(
                        onTap: () {
                          profileController.toggleSwitch(
                              1, profileController.switchValues[1].value);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: InterText(
                                text:
                                "Religious Exemption Form - Employee Influenza",
                                fontSize: Reponsive_.px14,
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
                                width: Reponsive_.crosslength * 0.05,
                                height: Reponsive_.crosslength * 0.025,
                                activeColor: AppColors.deepGreen,
                                inactiveColor:
                                Color.fromRGBO(217, 217, 217, 1),
                                toggleSize: 20.0,
                                value:
                                profileController.switchValues[1].value,
                                borderRadius: 50.0,
                                showOnOff: true,
                                onToggle: (val) async {
                                  profileController.toggleSwitch(1, !val);
                                },
                              )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.012,
                      ),
                      GestureDetector(
                        onTap: () {
                          profileController.toggleSwitch(
                              2, profileController.switchValues[2].value);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: InterText(
                                text:
                                "Medical Exemption Form - Employee Influenza",
                                fontSize: Reponsive_.px14,
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
                                width: Reponsive_.crosslength * 0.05,
                                height: Reponsive_.crosslength * 0.025,
                                activeColor: AppColors.deepGreen,
                                inactiveColor:
                                Color.fromRGBO(217, 217, 217, 1),
                                toggleSize: 20.0,
                                value:
                                profileController.switchValues[2].value,
                                borderRadius: 50.0,
                                showOnOff: true,
                                onToggle: (val) async {
                                  profileController.toggleSwitch(2, !val);
                                },
                              )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                    :Container(),
                cx.instacareLoginValue.toString().contains("employee")?
                CommonContainer(
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      InterText(
                        text: "Employee Checklist",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px16,
                        color: AppColors.blue,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/80,
                      ),
                      checkListEmployee(
                          leadingText: "IL W-4 (Withholding / Exemptions)",
                          buttonText: "Yes"
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/90,
                      ),
                      checkListEmployee(
                          leadingText: "Employment Verification",
                          buttonText: "Yes"
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/90,
                      ),
                      checkListEmployee(
                          leadingText: "Background Check Authentication Form",
                          buttonText: "Yes"
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/90,
                      ),
                      checkListEmployee(
                          leadingText: "Direct Deposit Form",
                          buttonText: "Yes"
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/90,
                      ),
                      checkListEmployee(
                          leadingText: "Health Insurance Acknowledgement Form",
                          buttonText: "Yes"
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/90,
                      ),
                      checkListEmployee(
                          leadingText: "8850",
                          buttonText: "No",
                          backGroundColor: AppColors.redColor
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/90,
                      ),
                      checkListEmployee(
                          leadingText: "CPR Certification",
                          buttonText: "No",
                          backGroundColor: AppColors.redColor
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/90,
                      ),
                      checkListEmployee(
                          leadingText: "Employee Handbook",
                          buttonText: "No",
                          backGroundColor: AppColors.redColor
                      ),
                    ],
                  ),
                )
                    :Container(),
                cx.instacareLoginValue.toString().contains("employee")?
                CommonContainer(
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      InterText(
                        text: "Immunization",
                        fontWeight: FontWeight.w600,
                        fontSize: Reponsive_.px16,
                        color: AppColors.blue,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/80,
                      ),
                      checkListEmployee(
                          leadingText: "Verify TB Test Results (Annual)",
                          buttonText: "Yes"
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/100,
                      ),
                      InterText(
                        text: "Start TB Test Date",
                        color: AppColors.black,
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                      ),
                      InterText(
                        text: "February 01, 2023",
                        color: AppColors.black,
                        fontSize: Reponsive_.px18,
                        fontWeight: FontWeight.w600,
                      ),

                      SizedBox(
                        height: Reponsive_.crosslength/100,
                      ),
                      InterText(
                        text: "Last TB Test Date",
                        color: AppColors.black,
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                      ),
                      InterText(
                        text: "February 01, 2023",
                        color: AppColors.black,
                        fontSize: Reponsive_.px18,
                        fontWeight: FontWeight.w600,
                      ),


                      SizedBox(
                        height: Reponsive_.crosslength/100,
                      ),
                      InterText(
                        text: "COVID-19 Immunization Date",
                        color: AppColors.black,
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                      ),
                      InterText(
                        text: "June 18, 2022",
                        color: AppColors.black,
                        fontSize: Reponsive_.px18,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/100,
                      ),
                      checkListEmployee(
                          leadingText: "Employee Influenza Vaccine Consent\nDeclination Form",
                          buttonText: "No",
                          backGroundColor: AppColors.redColor
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/100,
                      ),
                      checkListEmployee(
                          leadingText: "Religious Exemption Form - Employee\nInfluenza",
                          buttonText: "No",
                          backGroundColor: AppColors.redColor
                      ),

                      SizedBox(
                        height: Reponsive_.crosslength/100,
                      ),
                      checkListEmployee(
                          leadingText: "Medical Exemption Form - Employee\nInfluenza",
                          buttonText: "No",
                          backGroundColor: AppColors.redColor
                      ),
                    ],
                  ),
                ):Container()
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
                        SizedBox(height: Reponsive_.crosslength*0.015,),
                        MontserratText(text: 'Update Profile Photo',fontWeight: FontWeight.w700,fontSize: Reponsive_.px30,color: AppColors.black,textAlign: TextAlign.center),
                        SizedBox(height: Reponsive_.crosslength*0.015,),
                        Padding(
                          padding: EdgeInsets.all(Reponsive_.crosslength*0.015),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: imageFile == null
                                        ? Container(
                                            height: Reponsive_.crosslength*0.2,
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
                                          height: Reponsive_.crosslength*0.008,
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
                                          height: Reponsive_.crosslength*0.005,
                                        ),
                                        InterText(
                                          text: "Maximum size: 10MB",
                                          fontSize: Reponsive_.crosslength*0.013,
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

  Widget checkListEmployee({String? leadingText,Color? backGroundColor,String? buttonText}){
    return Row(
      children: [
        Expanded(
          child: InterText(
            text: leadingText.toString(),
            fontSize: Reponsive_.px14,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
        ),
        Expanded(
          flex: 0,
          child: Container(
            width: Reponsive_.crosslength/13,
            height: Reponsive_.crosslength/40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color:backGroundColor?? AppColors.deepGreen,
                borderRadius: BorderRadius.circular(30)
            ),
            child: InterText(
              text: buttonText.toString(),
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: Reponsive_.px14,
            ),
          ),
        )
      ],
    );
  }
}
