import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';

import '../../../Utils/appAssets.dart';

class SendingScreen extends StatefulWidget {
  const SendingScreen({super.key});

  @override
  State<SendingScreen> createState() => _SendingScreenState();
}

class _SendingScreenState extends State<SendingScreen> {
  int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Container(
      padding: EdgeInsets.only(
        left: Reponsive_.crosslength * 0.02,
        right: Reponsive_.crosslength * 0.02,
        bottom: Reponsive_.crosslength * 0.02,
      ),
      height: Reponsive_.crosslength * 0.8,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
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
                text: 'Instacare Staff',
                fontSize: Reponsive_.crosslength * 0.025,
                color: AppColors.blue,
                fontWeight: FontWeight.w700),
            SizedBox(
              height: Reponsive_.crosslength * 0.01,
            ),
            InterText(
              text:
                  'Please select the person to whom you want to send message.',
              maxLines: 2,
              fontSize: Reponsive_.crosslength * 0.016,
              color: AppColors.blue,
              fontWeight: FontWeight.w400,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      selectedIndex=index;
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: Reponsive_.crosslength * 0.02,
                        left: Reponsive_.crosslength * 0.015,
                        right: Reponsive_.crosslength * 0.015,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            selectedIndex==index?'assets/x/check.png':'assets/x/uncheck.png',
                            height: Reponsive_.crosslength * 0.03,
                          ),
                          SizedBox(
                            width: Reponsive_.crosslength * 0.02,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: Reponsive_.crosslength * 0.06,
                                  width: Reponsive_.crosslength * 0.06,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                            AppAssets.completed,
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                InterText(
                                  text: '   Granny Weatherwax',
                                  color: Color(0xff02050A),
                                  fontSize: Reponsive_.crosslength * 0.015,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Reponsive_.crosslength * 0.01,
                                vertical: Reponsive_.crosslength * 0.003),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Reponsive_.crosslength * 0.02),
                                border: Border.all(color: AppColors.yallow),
                                color: AppColors.light_yallow),
                            child: InterText(
                              text: 'Staff',
                              color: AppColors.yallow,
                              fontSize: Reponsive_.crosslength * 0.015,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.02,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
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
                        text: "SELECT",
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
                    onTap: (){
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
                        text: "CANCEL",
                        color: Colors.white,
                        fontSize: Reponsive_.crosslength * 0.02,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
