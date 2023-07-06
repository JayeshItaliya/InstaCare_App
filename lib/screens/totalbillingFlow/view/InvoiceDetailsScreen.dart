import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';

import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/interText.dart';

import '../../../Utils/Commonwidgets.dart';
import '../../../Utils/MyClipper.dart';
import '../../../Utils/appAssets.dart';
import '../../../Utils/appColor.dart';
import '../../../Utils/montserratText.dart';

class SolloInvoiceScreen extends StatefulWidget {
  const SolloInvoiceScreen({super.key});

  @override
  State<SolloInvoiceScreen> createState() => _SolloInvoiceScreenState();
}

class _SolloInvoiceScreenState extends State<SolloInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title: MontserratText(
          text: "Invoice 733",
          fontSize: Reponsive_.crosslength*0.025,
          fontWeight: FontWeight.w700,
          color: AppColors.blue,
        ),
        trailingIcon: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(AppAssets.bell,height: Reponsive_.crosslength*0.03,width: Reponsive_.crosslength*0.03,),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: Reponsive_.crosslength*0.02,),
          Commonwidgets.time_layout('10 March 2023',weight: FontWeight.w400),
          SizedBox(height: Reponsive_.crosslength*0.02,),

          Container(
            margin: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.015),
            height: Reponsive_.crosslength*0.3,
            child: Stack(
              children: [
                Image.asset('assets/x/zig_zag_edges_bg.png',fit: BoxFit.cover,height: double.infinity,),
                Column(
                  children: [
                    SizedBox(height: Reponsive_.crosslength*0.02,),
                    InterText(
                      text: "Invoice 733",
                      fontSize: Reponsive_.crosslength*0.02,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blue,
                    ),
                    SizedBox(height: Reponsive_.crosslength*0.02,),
                    Padding(
                      padding: EdgeInsets.only(left: Reponsive_.crosslength*0.02,right: Reponsive_.crosslength*0.01),
                      child: Row(
                        children: [
                          Expanded(
                            child: InterText(
                              text: "Description",
                              fontSize: Reponsive_.crosslength*0.015,
                              fontWeight: FontWeight.w400,
                              color: AppColors.hintTextGrey,
                            ),
                          ),
                          Expanded(
                            child: InterText(
                              text: "Qty",
                              fontSize: Reponsive_.crosslength*0.015,
                              fontWeight: FontWeight.w400,
                              color: AppColors.hintTextGrey,
                            ),
                          ),
                          Expanded(
                            child: InterText(
                              text: "Amount",
                              fontSize: Reponsive_.crosslength*0.015,
                              fontWeight: FontWeight.w400,
                              color: AppColors.hintTextGrey,
                            ),
                          ),

                        ],
                      ),
                    ),
                    date_row("CNA Staffing Hours","120","\$1200"),
                    date_row("LPN Staffing Hours","20","\$1150"),
                    date_row("RN Staffing Hours","60","\$600"),
                    Padding(
                      padding: EdgeInsets.only(left: Reponsive_.crosslength*0.02,right: Reponsive_.crosslength*0.07,top: Reponsive_.crosslength*0.035,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(
                            text: "Total Invoice Amount",
                            fontSize: Reponsive_.crosslength*0.02,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue,
                          ),
                          InterText(
                            text: "\$2,950",
                            fontSize: Reponsive_.crosslength*0.02,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
          SizedBox(height: Reponsive_.crosslength*0.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/profileFlow/download.png',color: AppColors.blue,height: Reponsive_.crosslength*0.025,width: Reponsive_.crosslength*0.025,),
              InterText(
                text: "    Download Invoice",
                fontSize: Reponsive_.crosslength*0.02,
                fontWeight: FontWeight.w600,
                color: AppColors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container date_row(String desc, String qty, String amount) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.01,vertical: Reponsive_.crosslength*0.01,),
      margin: EdgeInsets.only(left: Reponsive_.crosslength*0.01,right: Reponsive_.crosslength*0.01,top: Reponsive_.crosslength*0.006,),
      decoration: BoxDecoration(
        color: AppColors.backGroundColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: InterText(
              text: desc,
              fontSize: Reponsive_.crosslength*0.015,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          Expanded(
            child: InterText(
              text: qty,
              fontSize: Reponsive_.crosslength*0.015,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          Expanded(
            child: InterText(
              text: amount,
              fontSize: Reponsive_.crosslength*0.015,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),

        ],
      ),
    );
  }
}
