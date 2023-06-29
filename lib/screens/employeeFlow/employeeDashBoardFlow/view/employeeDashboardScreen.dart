import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/employeeFlow/PayrollFlow/view/payrollScreen.dart';
import 'package:instacare/screens/employeeFlow/marketPlaceFlow/view/MarketPlaceScreen.dart';
import 'package:instacare/screens/employeeFlow/myAvailabilityFlow/screens/MyAvailability.dart';
import 'package:instacare/screens/employeeFlow/timeCardFlow/view/employeeTimeCard.dart';
import 'package:instacare/screens/profileFlow/view/profileScreen.dart';

class EmployeeDashBoardScreen extends StatefulWidget {
  const EmployeeDashBoardScreen({super.key});

  @override
  State<EmployeeDashBoardScreen> createState() =>
      _EmployeeDashBoardScreenState();
}

class _EmployeeDashBoardScreenState extends State<EmployeeDashBoardScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: ListView(
        padding: padding,
        children: [
          MontserratText(
              text: "Upcoming Shifts",
              color: AppColors.hintTextGrey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center),
          SizedBox(
            height: Reponsive_.crosslength / 30,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Card(
                    color: AppColors.backGroundColor,
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: Reponsive_.w / 12,
                              height: Reponsive_.h / 9,
                              decoration: ShapeDecoration(
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn.assistedlivingcenter.com/wp-content/uploads/2020/11/elevate-care-riverwoods-il.jpg"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Reponsive_.crosslength / 100,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InterText(
                                  text: "Elevate Care North Branch",
                                  fontWeight: FontWeight.bold,
                                  fontSize: Reponsive_.px18,
                                  color: AppColors.black,
                                ),
                                SizedBox(
                                  height: Reponsive_.crosslength / 200,
                                ),
                                InterText(
                                  text: "Tuesday, 21 March 2023",
                                  fontWeight: FontWeight.bold,
                                  fontSize: Reponsive_.px16,
                                  color: AppColors.hintTextGrey,
                                ),
                                SizedBox(
                                  height: Reponsive_.crosslength / 200,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time_filled_rounded,
                                      color: AppColors.buttonColor,
                                    ),
                                    SizedBox(
                                      width: Reponsive_.crosslength / 200,
                                    ),
                                    InterText(
                                      text: "Clock In at 7:00AM",
                                      fontWeight: FontWeight.bold,
                                      fontSize: Reponsive_.px16,
                                      color: AppColors.buttonColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    CommonBottonSheet(
                      context: context,
                      topIcon: false,
                      childView: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                            width: Reponsive_.w,
                            height: Reponsive_.h / 4,
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0),
                                ),
                                color: AppColors.blue),
                            child: Column(
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
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: AppColors.buttonColor,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InterText(
                                      text: "Clock In 10 Minutes",
                                      color: AppColors.buttonColor,
                                      fontSize: Reponsive_.px16,
                                      fontWeight: FontWeight.w600,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Reponsive_.crosslength / 50,
                                      left: 10,
                                      right: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 0,
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    "https://seniorcarefinder.blob.core.windows.net/photos/5e7dd877-9da7-407d-970d-f459093ecaeb.jpg")),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Reponsive_.crosslength / 40,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InterText(
                                              text: "Elevate Care North Branch",
                                              fontWeight: FontWeight.w600,
                                              fontSize: Reponsive_.px18,
                                              color: AppColors.white,
                                            ),
                                            SizedBox(
                                              width:
                                                  Reponsive_.crosslength / 50,
                                            ),
                                            InterText(
                                              text: "Tuesday, 21 March 2023",
                                              fontWeight: FontWeight.w600,
                                              fontSize: Reponsive_.px16,
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 0.5),
                                            ),
                                            SizedBox(
                                              width:
                                                  Reponsive_.crosslength / 50,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(AppAssets.flag),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                InterText(
                                                  text: "Incentive",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: Reponsive_.px12,
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 0.5),
                                                ),
                                                SizedBox(
                                                  width:
                                                      Reponsive_.crosslength /
                                                          20,
                                                ),
                                                Icon(
                                                    Icons.verified_user_rounded,
                                                    color: AppColors.deepGreen),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                InterText(
                                                  text: "Guarantee",
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: Reponsive_.px12,
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 0.5),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength / 60,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: Reponsive_.crosslength / 40,
                                right: Reponsive_.crosslength / 40),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InterText(
                                          text: "Clock-In",
                                          color: AppColors.black,
                                          fontSize: Reponsive_.px14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(
                                          height: Reponsive_.crosslength / 60,
                                        ),
                                        InterText(
                                          text: "Clock-Out",
                                          color: AppColors.black,
                                          fontSize: Reponsive_.px14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(
                                          height: Reponsive_.crosslength / 25,
                                        ),
                                        InterText(
                                          text: "Rate (per hour)",
                                          color: AppColors.black,
                                          fontSize: Reponsive_.px14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(
                                          height: Reponsive_.crosslength / 60,
                                        ),
                                        InterText(
                                          text: "Incentive Amount (per hour)",
                                          color: AppColors.black,
                                          fontSize: Reponsive_.px14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InterText(
                                          text: "7:00 AM",
                                          color: AppColors.black,
                                          fontSize: Reponsive_.px14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(
                                          height: Reponsive_.crosslength / 60,
                                        ),
                                        InterText(
                                          text: "--:-- PM",
                                          color: AppColors.black,
                                          fontSize: Reponsive_.px14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(
                                          height: Reponsive_.crosslength / 25,
                                        ),
                                        InterText(
                                          text: "\$45.00",
                                          color: AppColors.black,
                                          fontSize: Reponsive_.px14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(
                                          height: Reponsive_.crosslength / 60,
                                        ),
                                        InterText(
                                          text: "\$5.00",
                                          color: AppColors.black,
                                          fontSize: Reponsive_.px14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: Reponsive_.crosslength / 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.deepGreen,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          width: Reponsive_.w,
                                          height: 50,
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(AppAssets.clockInEmp),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              MontserratText(
                                                text: "Clock In",
                                                fontWeight: FontWeight.w400,
                                                fontSize: Reponsive_.px16,
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                              )
                                            ],
                                          ),
                                        ),
                                        onTap: (){
                                          onBack(context);
                                          CommonBottonSheet(
                                              context: context,
                                              childView: ListView(
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                children: [
                                                  SizedBox(
                                                    height: Reponsive_.crosslength/40,
                                                  ),
                                                  MontserratText(
                                                      text: "Shift Information",
                                                    color: AppColors.blue,
                                                    fontSize: Reponsive_.px12,
                                                    fontWeight: FontWeight.w400,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    height: Reponsive_.crosslength/40,
                                                  ),
                                                  MontserratText(
                                                    text: "Confirmation",
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: Reponsive_.px30,
                                                    color: AppColors.black,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    height: Reponsive_.crosslength/70,
                                                  ),
                                                  InterText(
                                                    text: "Do you really want to Clock In shift?",
                                                    color: AppColors.black,
                                                    textAlign: TextAlign.center,
                                                    fontSize: Reponsive_.px16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  SizedBox(
                                                    height: Reponsive_.crosslength/50,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: CommonButton(
                                                              text: "Yes",
                                                              onTap: (){
                                                                onBack(context);
                                                              },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                          child: CommonButton(
                                                              text: "No",
                                                              onTap: (){},
                                                            color: AppColors.allGray,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: Reponsive_.crosslength / 20,
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.redColor)),
                                          width: Reponsive_.w,
                                          height: 50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                  AppAssets.clocseShift),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              MontserratText(
                                                text: "Cancel Shift",
                                                fontWeight: FontWeight.w400,
                                                fontSize: Reponsive_.px16,
                                                color: AppColors.redColor,
                                              )
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          onBack(context);
                                          CommonBottonSheet(
                                              context: context,
                                              childView: ListView(
                                                physics: NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                children: [
                                                  SizedBox(
                                                    height: Reponsive_.crosslength/70,
                                                  ),
                                                  MontserratText(
                                                    text: "Shift Information",
                                                    color: AppColors.blue,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: Reponsive_.px12,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    height: Reponsive_.crosslength/40,
                                                  ),
                                                  MontserratText(
                                                    text: 'Confirmation',
                                                    textAlign: TextAlign.center,
                                                    fontSize: Reponsive_.px30,
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.redColor,
                                                  ),
                                                  SizedBox(
                                                    height: Reponsive_.crosslength/90,
                                                  ),
                                                  InterText(
                                                    text: 'Why you want to cancel your shift?',
                                                    textAlign: TextAlign.center,
                                                    fontSize: Reponsive_.px16,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.black,
                                                  ),
                                                  SizedBox(
                                                    height: Reponsive_.crosslength/90,
                                                  ),
                                                  AppWidget().getTextField(
                                                    hintText: "Please provide the reason",
                                                    filledColor: AppColors.backGroundColor,
                                                    maxLine: 5
                                                  ),
                                                  SizedBox(
                                                    height: Reponsive_.crosslength/90,
                                                  ),
                                                  GestureDetector(
                                                    child: Container(
                                                      width:Reponsive_.w,
                                                      alignment: Alignment.center,
                                                      margin: EdgeInsets.all(10),
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: AppColors.buttonColor,
                                                        ),
                                                        borderRadius: BorderRadius.circular(30),
                                                      ),
                                                      child: InterText(
                                                        text: "Upload the file/document",
                                                        fontSize: Reponsive_.px14,
                                                        fontWeight: FontWeight.w400,
                                                        color: AppColors.black,

                                                      ),
                                                    ),
                                                    onTap: (){
                                                      openFilePicker().then((value){
                                                        print("fileValue===>${value}");
                                                      });
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: Reponsive_.crosslength/100,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: CommonButton(
                                                            text: "Cancel SHift",
                                                            color: AppColors.redColor,
                                                            onTap: (){
                                                              onBack(context);
                                                            },
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                          child: CommonButton(
                                                            text: "Go Back",
                                                            onTap: (){},
                                                            color: AppColors.buttonColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: Reponsive_.crosslength / 45,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InterText(
                                      text: "Message",
                                      color: AppColors.blue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: Reponsive_.px14,
                                    ),
                                    InterText(
                                      text: "Arrive Late",
                                      color: AppColors.blue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: Reponsive_.px14,
                                    ),
                                    InterText(
                                      text: "Report an Issue",
                                      color: AppColors.blue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: Reponsive_.px14,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Reponsive_.crosslength / 50,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              }),
          SizedBox(
            height: Reponsive_.crosslength / 35,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  child: Container(
                    width: Reponsive_.crosslength / 10,
                    height: Reponsive_.crosslength / 8,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InterText(
                          text: "42",
                          color: AppColors.yallow,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        InterText(
                          text: "Marketplace",
                          color: AppColors.black,
                          fontSize: Reponsive_.px16,
                          fontWeight: FontWeight.normal,
                        )
                      ],
                    ),
                  ),
                  onTap: (){
                    toPushNavigator(context: context,PageName: MarketPlaceScreen(showAppApr: true,));
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    toPushNavigator(
                        PageName: ProfileScreen(), context: context);
                  },
                  child: Container(
                    width: Reponsive_.crosslength / 10,
                    height: Reponsive_.crosslength / 8,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.calenderEmployee),
                        InterText(
                          text: "My Account",
                          color: AppColors.black,
                          fontSize: Reponsive_.px16,
                          fontWeight: FontWeight.normal,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Reponsive_.crosslength / 35,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    toPushNavigator(context: context,PageName: MyAvailability());
                  },
                  child: Container(
                    width: Reponsive_.crosslength / 10,
                    height: Reponsive_.crosslength / 8,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.settings),
                        SizedBox(
                          height: 8,
                        ),
                        InterText(
                          text: "My Availability",
                          color: AppColors.black,
                          fontSize: Reponsive_.px16,
                          fontWeight: FontWeight.normal,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    width: Reponsive_.crosslength / 10,
                    height: Reponsive_.crosslength / 8,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.payroll),
                        SizedBox(
                          height: 8,
                        ),
                        InterText(
                          text: "Payroll",
                          color: AppColors.black,
                          fontSize: Reponsive_.px16,
                          fontWeight: FontWeight.normal,
                        )
                      ],
                    ),
                  ),
                  onTap: (){
                    toPushNavigator(context: context,PageName: PayrollScreen());
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Future<String?> openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      String? path = file.path;
      print("filePath==>$path");
      return path;
    } else {
      print("Data has Not Found!!!!");
    }
    return "Select The File ";
  }
}
