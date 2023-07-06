import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Commonwidgets.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/screens/messagesFlow/view/StaffTypeSelectionScreen.dart';
import '../../../Utils/appColor.dart';
import '../../../Utils/interText.dart';
import '../../../Utils/montserratText.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      bottomNavigationBar: msg_input_layout(),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: MontserratText(
          text: "Granny Weatherwax",
          fontSize: Reponsive_.crosslength * 0.02,
          fontWeight: FontWeight.w700,
          color: AppColors.blue,
        ),
        actions: [
          InkWell(
              onTap: () {
                CommonBottonSheet(
                    context: context,
                  childView: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      StaffTypeSelectionScreen()
                    ],
                  )
                );
              },
              child: Image.asset(
                'assets/x/user_plus.png',
                height: Reponsive_.crosslength * 0.03,
                width: Reponsive_.crosslength * 0.03,
              )),
          SizedBox(width: Reponsive_.crosslength*0.01,),
          open_pop_menu(),
          SizedBox(width: Reponsive_.crosslength*0.01,),
        ],
      ),
      body: ListView.builder(
        reverse: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          if (index == 4) {
            return Commonwidgets.time_layout('TODAY');
          } else if (index < 3) {
            return received_msg();
          } else {
            return sent_msg();
          }
        },
      ),
    );
  }



  Widget msg_input_layout() {
    return Container(
      margin: EdgeInsets.only(
          bottom: Reponsive_.crosslength * 0.02,
          left: Reponsive_.crosslength * 0.015,
          right: Reponsive_.crosslength * 0.015,
          top: 10),
      padding: MediaQuery.of(context).viewInsets,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: Reponsive_.crosslength * 0.055,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: AppWidget().getTextField(
                      hintText: 'Message',
                      filledColor: AppColors.white
                    ),
                  ),
                  Image.asset(
                    'assets/x/attach.png',
                    height: Reponsive_.crosslength * 0.025,
                    width: Reponsive_.crosslength * 0.025,
                  ),
                  SizedBox(
                    width: Reponsive_.crosslength * 0.01,
                  ),
                  Image.asset(
                    'assets/x/smily.png',
                    height: Reponsive_.crosslength * 0.025,
                    width: Reponsive_.crosslength * 0.025,
                  ),
                  SizedBox(
                    width: Reponsive_.crosslength * 0.02,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: Reponsive_.crosslength * 0.01,
          ),
          Image.asset(
            'assets/x/send_msg.png',
            height: Reponsive_.crosslength * 0.05,
            width: Reponsive_.crosslength * 0.05,
          ),
        ],
      ),
    );
  }

  Widget received_msg() {
    return Container(
      margin: EdgeInsets.only(top: Reponsive_.crosslength * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: Reponsive_.crosslength * 0.02,
          ),
          Container(
              height: Reponsive_.crosslength * 0.04,
              width: Reponsive_.crosslength * 0.04,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.yallow),
              child: Image.asset(
                'assets/x/mw.png',
                scale: 3,
                color: Colors.white,
              )),
          SizedBox(
            width: Reponsive_.crosslength * 0.01,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(Reponsive_.crosslength * 0.01),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              child: Column(
                children: [
                  InterText(
                    text:
                        'Donec lacinia erat ac est hendrerit, sit amet scelerisque lorem lacinia.',
                    color: AppColors.hintTextGrey,
                    fontSize: Reponsive_.px14,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          fontSize: Reponsive_.px12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InterText(
                        text: '9:48AM',
                        color: AppColors.blue,
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: Reponsive_.crosslength * 0.06,
          ),
        ],
      ),
    );
  }

  Widget sent_msg() {
    return Container(
      margin: EdgeInsets.only(
          top: Reponsive_.crosslength * 0.02,
          right: Reponsive_.crosslength * 0.02,
          left: Reponsive_.crosslength * 0.06),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(Reponsive_.crosslength * 0.01),
              decoration: BoxDecoration(
                  color: AppColors.light_blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InterText(
                          text:
                              'Donec lacinia erat ac est hendrerit, sit amet scelerisque lorem lacinia.',
                          softWrap: true,
                          color: AppColors.hintTextGrey,
                          fontSize: Reponsive_.px14,
                          fontWeight: FontWeight.w400,
                          maxLines: 10,
                        ),
                      ),
                      Image.asset(
                        'assets/x/double_tick.png',
                        height: Reponsive_.crosslength * 0.02,
                        width: Reponsive_.crosslength * 0.02,
                      )
                    ],
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          fontSize: Reponsive_.px14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InterText(
                        text: '9:48AM',
                        color: AppColors.blue,
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget open_pop_menu() {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        popupMenuItem('Delete'),
        popupMenuItem('Clear Chat'),
        popupMenuItem('Block'),
        popupMenuItem('Report'),
      ],
      color: Colors.white,
      elevation: 2,
      child: Image.asset('assets/x/more.png',height: Reponsive_.crosslength*0.03,width: Reponsive_.crosslength*0.03,),
    );
  }

  PopupMenuItem<int> popupMenuItem(String label) {
    return PopupMenuItem(
        // row has two child icon and text.
      onTap: (){
         if(label=="Delete" || label=="Clear Chat" || label=="Block"){
             CommonBottonSheet(
                context: context,
                childView: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    MontserratText(
                      text: "Chat Information",
                      fontWeight: FontWeight.w400,
                      fontSize: Reponsive_.crosslength*012,
                      color: AppColors.blue,
                    )
                  ],
                )
            );
         }
         else{

         }
      },
        child: InterText(
      text: label,
      fontSize: Reponsive_.crosslength * 0.016,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ));
  }
}
