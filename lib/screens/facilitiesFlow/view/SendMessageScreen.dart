import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Commonwidgets.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/screens/dashBoardFlow/view/availableEmployeesFlow/controller/filterController.dart';
import 'package:instacare/screens/employeeSelectionFlow/view/SendingScreen.dart';
import '../../../Utils/CommonDropDown.dart';
import '../../../Utils/appColor.dart';
import '../../../Utils/pageNavigator.dart';


class SendMessageScreen extends StatefulWidget {
  const SendMessageScreen({super.key});

  @override
  State<SendMessageScreen> createState() => _SendMessageScreenState();
}

class _SendMessageScreenState extends State<SendMessageScreen> {
  final filterController = Get.put(FilterController());
  TextEditingController _subj_controller = TextEditingController();
  int index = -1;

  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);

    return SizedBox(
      height: Reponsive_.crosslength * 0.8,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.only(
                left: Reponsive_.crosslength * 0.015,
                right: Reponsive_.crosslength * 0.015,
                bottom: Reponsive_.crosslength * 0.015),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  height: Reponsive_.crosslength * 0.02,
                ),
                InterText(
                  text: 'Send Message',
                  fontWeight: FontWeight.w700,
                  fontSize: Reponsive_.crosslength * 0.025,
                  color: Colors.black,
                ),
                SizedBox(
                  height: Reponsive_.crosslength * 0.02,
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(),
                    decoration: BoxDecoration(
                        // color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(50)),
                    height: Reponsive_.crosslength * 0.055,
                    child: CommonDropDown(
                        context: context,
                        list: [
                          'abc',
                          'abc',
                          'abc',
                          'abc',
                        ],
                        mycontrollerValue: filterController.roleListValue,
                        color: AppColors.backGroundColor)),
                SizedBox(
                  height: Reponsive_.crosslength * 0.01,
                ),
                Commonwidgets.text_field(
                    TextInputType.text, 'Sending to', _subj_controller,
                    suffix: const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.buttonColor,
                    ),
                    readOnly: true, ontap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    backgroundColor: AppColors.white,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, setState) {
                          setState(() {});
                          return SendingScreen();
                        },
                      );
                    },
                  );
                }),
                SizedBox(
                  height: Reponsive_.crosslength * 0.01,
                ),
                Commonwidgets.text_field(
                    TextInputType.text, 'Subject', _subj_controller),
                SizedBox(
                  height: Reponsive_.crosslength * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.only(right: Reponsive_.crosslength * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Commonwidgets.radio_btn('Email', index == 0, () {
                        setState(() {
                          index = 0;
                        });
                      }),
                      Commonwidgets.radio_btn('Text', index == 1, () {
                        setState(() {
                          index = 1;
                        });
                      }),
                      Commonwidgets.radio_btn('Both', index == 2, () {
                        setState(() {
                          index = 2;
                        });
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: Reponsive_.crosslength * 0.01,
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(),
                    decoration: BoxDecoration(
                        // color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(50)),
                    height: Reponsive_.crosslength * 0.055,
                    child: CommonDropDown(
                        context: context,
                        list: [
                          'abc',
                          'abc',
                          'abc',
                          'abc',
                        ],
                        mycontrollerValue: filterController.roleListValue,
                        color: AppColors.backGroundColor)),
                SizedBox(
                  height: Reponsive_.crosslength * 0.01,
                ),
                Container(
                  height: Reponsive_.crosslength * 0.2,
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      vertical: Reponsive_.crosslength * 0.02),
                  decoration: BoxDecoration(
                      color: AppColors.backGroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextField(
                    maxLines: 10,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Message",
                        hintStyle:
                            GoogleFonts.inter(fontWeight: FontWeight.w400),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Reponsive_.crosslength * 0.015)),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          onBack(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: Reponsive_.crosslength * 0.015),
                          decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: InterText(
                            text: "Send",
                            color: Colors.white,
                            fontSize: Reponsive_.crosslength * 0.02,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Reponsive_.crosslength * 0.01,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          onBack(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: Reponsive_.crosslength * 0.015),
                          decoration: BoxDecoration(
                              color: AppColors.allGray,
                              borderRadius: BorderRadius.circular(50)),
                          child: InterText(
                            text: "Cancel",
                            color: Colors.white,
                            fontSize: Reponsive_.crosslength * 0.02,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
