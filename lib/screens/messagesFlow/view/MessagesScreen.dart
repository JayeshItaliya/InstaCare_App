import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/facilitiesFlow/view/SendMessageScreen.dart';
import '../../../Utils/appAssets.dart';
import '../../../Utils/appColor.dart';
import '../../../Utils/interText.dart';

import 'ChatRoomScreen.dart';

class MessagesScreen extends StatefulWidget {
    MessagesScreen({super.key,});

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
          CommonBottonSheet(
            context: context,
              childView: SendMessageScreen(),
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
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              toPushNavigator(context: context,PageName: ChatRoomScreen());
            },
            child: Slidable(
              key: const ValueKey(0),
              endActionPane:ActionPane (
                motion: const ScrollMotion(),extentRatio: 0.2,
                children:   [
                  Container(
                    height: Reponsive_.crosslength*0.05,
                    width: Reponsive_.crosslength*0.05,
                    alignment: Alignment.center,
                    child:   SlidableAction(
                      onPressed: doNothing,
                      padding: EdgeInsets.zero,
                      
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      backgroundColor: AppColors.redColor,
                      foregroundColor: Colors.white,
                      icon: Icons.delete_outline_sharp,
                    ),
                  )
                ],
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Reponsive_.crosslength * 0.015,
                    vertical: Reponsive_.crosslength * 0.015),
                margin: EdgeInsets.only(
                    top: Reponsive_.crosslength * 0.005,
                    left: Reponsive_.crosslength * 0.015,
                    right: Reponsive_.crosslength * 0.015),
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
                                color: AppColors.black,
                                fontSize: Reponsive_.crosslength*0.015,
                                fontWeight: FontWeight.w600,
                              ),
                              InterText(
                                text: '9:48AM',
                                color: AppColors.blue,
                                fontSize: Reponsive_.crosslength*0.013,
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
                                  text: 'Donec lacinia erat ac est hendrerit, sit am et scelerisque lorem lacinia.',
                                  maxLines: 2,
                                  color: AppColors.hintTextGrey,
                                  fontSize: Reponsive_.crosslength*0.0135,
                                  height: Reponsive_.crosslength*0.0015,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: Reponsive_.crosslength*0.01,),
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
                                  fontSize: Reponsive_.crosslength * 0.013,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),

                            ],
                          ),
                         index==2? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: Reponsive_.crosslength*0.03,
                                width: Reponsive_.crosslength*0.07,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Reponsive_.crosslength * 0.02),
                                    color: AppColors.light_gray),
                                child: InterText(
                                  text: 'Email',
                                  color: AppColors.allGray,
                                  fontSize: Reponsive_.crosslength * 0.013,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ):Container(),
                          /*Row(
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
                          ),*/
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  void doNothing(BuildContext context) {}
}
