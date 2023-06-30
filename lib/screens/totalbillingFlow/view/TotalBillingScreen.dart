import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/totalbillingFlow/view/InvoiceDetailsScreen.dart';
import '../../../../Utils/appAssets.dart';
import '../../../../Utils/interText.dart';
import 'InvoiceListFilterScreen.dart';

class TotalBillingScreen extends StatefulWidget {
  const TotalBillingScreen({super.key});

  @override
  State<TotalBillingScreen> createState() => _TotalBillingScreenState();
}

class _TotalBillingScreenState extends State<TotalBillingScreen> {
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      top: Reponsive_.crosslength * 0.02,
                      left: Reponsive_.crosslength * 0.015,
                      right: Reponsive_.crosslength * 0.015),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          Reponsive_.crosslength * 0.025)),
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      fillColor: Colors.blue,
                      border: InputBorder.none,
                      hintText: 'Search by Invoice number',
                      helperStyle: GoogleFonts.inter(
                          color: AppColors.hintTextGrey,
                          fontWeight: FontWeight.w400),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: Reponsive_.crosslength * 0.015,
                          vertical: Reponsive_.crosslength * 0.015),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  toPushNavigator(
                      context: context, PageName: InvoiceListFilterScreen());
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: Reponsive_.crosslength * 0.02,
                      right: Reponsive_.crosslength * 0.015),
                  child: Image.asset(
                    AppAssets.filtetr,
                    alignment: Alignment.center,
                  ),
                ),
              )
            ],
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    toPushNavigator(context: context,PageName: SolloInvoiceScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Reponsive_.crosslength * 0.015,
                        vertical: Reponsive_.crosslength * 0.01),
                    margin: EdgeInsets.only(
                        top: Reponsive_.crosslength * 0.01,
                        left: Reponsive_.crosslength * 0.02,
                        right: Reponsive_.crosslength * 0.02),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            InterText(
                              text: 'FRI',
                              color: AppColors.hintTextGrey,
                              fontSize: Reponsive_.crosslength * 0.01,
                              fontWeight: FontWeight.w400,
                            ),
                            InterText(
                              text: 'MAR',
                              color: AppColors.hintTextGrey,
                              fontSize: Reponsive_.crosslength * 0.01,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        InterText(
                          text: '10',
                          color: Color(0xff02050A),
                          fontSize: Reponsive_.crosslength * 0.022,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          width: Reponsive_.crosslength * 0.015,
                        ),
                        Container(
                          height: Reponsive_.crosslength * 0.06,
                          width: 0.2,
                          color: AppColors.hintTextGrey,
                        ),
                        SizedBox(
                          width: Reponsive_.crosslength * 0.008,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InterText(
                                text: 'Invoice 733',
                                color: Color(0xff02050A),
                                fontSize: Reponsive_.crosslength * 0.017,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength * 0.006,
                              ),
                              InterText(
                                text: '\$3,250 Amount',
                                maxLines: 2,
                                color: AppColors.hintTextGrey,
                                fontSize: Reponsive_.crosslength * 0.015,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Reponsive_.crosslength * 0.01,
                            vertical: Reponsive_.crosslength * 0.002,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Reponsive_.crosslength * 0.02),
                              color: AppColors.yallow),
                          child: InterText(
                            text: 'Download',
                            color: AppColors.blue,
                            fontSize: Reponsive_.crosslength * 0.015,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
