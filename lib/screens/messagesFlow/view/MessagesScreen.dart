import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/facilitiesFlow/view/SendMessageScreen.dart';
import '../../../Utils/appAssets.dart';
import '../../../Utils/appColor.dart';
import '../../../Utils/interText.dart';

import 'ChatRoomScreen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen>{


  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      floatingActionButton: InkWell(
        onTap: (){
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
                  return Padding(
                      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const SendMessageScreen());
                },
              );
            },
          );
        },
        child: Container(
            margin: EdgeInsets.only(bottom: Reponsive_.crosslength * 0.02),
            height: Reponsive_.crosslength * 0.06,
            decoration:
            BoxDecoration(shape: BoxShape.circle, color: AppColors.yallow),
            child: Image.asset(
              'assets/dashBoardFlow/mail.png',
              scale: 1,
              color: Colors.white,
            )),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              toPushNavigator(context: context,PageName: ChatRoomScreen());
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Reponsive_.crosslength * 0.01,
                  vertical: Reponsive_.crosslength * 0.01),
              margin: EdgeInsets.only(
                  top: Reponsive_.crosslength * 0.02,
                  left: Reponsive_.crosslength * 0.02,
                  right: Reponsive_.crosslength * 0.02),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Reponsive_.crosslength*0.06,
                    width: Reponsive_.crosslength*0.06,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              AppAssets.completed,
                            ),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: Reponsive_.crosslength * 0.008,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InterText(
                              text: 'Jasnah Kholin',
                              color: Color(0xff02050A),
                              fontSize: Reponsive_.crosslength*0.015,
                              fontWeight: FontWeight.w600,
                            ),
                            InterText(
                              text: '9:48AM',
                              color: AppColors.blue,
                              fontSize: Reponsive_.crosslength*0.015,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Reponsive_.crosslength * 0.006,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InterText(
                                text: 'Donec lacinia erat ac est hendrerit, sit amet scelerisque lorem lacinia.',
                                maxLines: 2,
                                color: AppColors.hintTextGrey,
                                fontSize: Reponsive_.crosslength*0.015,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              height: Reponsive_.crosslength*0.02,
                              width: Reponsive_.crosslength*0.02,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Reponsive_.crosslength * 0.02),
                                  color: AppColors.yallow),
                              child: InterText(
                                text: '5',
                                color: AppColors.white,
                                fontSize: Reponsive_.crosslength * 0.015,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Reponsive_.crosslength * 0.01,
                                  vertical: Reponsive_.crosslength * 0.003),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Reponsive_.crosslength * 0.02),
                                  color: AppColors.light_gray),
                              child: InterText(
                                text: 'Email',
                                color: AppColors.hintTextGrey,
                                fontSize: Reponsive_.crosslength * 0.015,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
