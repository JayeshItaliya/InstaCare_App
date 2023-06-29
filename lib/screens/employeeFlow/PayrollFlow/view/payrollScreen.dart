import 'package:flutter/material.dart';
import 'package:instacare/Utils/MySeparator.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/interText.dart';

class PayrollScreen extends StatefulWidget {
  const PayrollScreen({super.key});

  @override
  State<PayrollScreen> createState() => _PayrollScreenState();
}

class _PayrollScreenState extends State<PayrollScreen> with TickerProviderStateMixin {
  late TabController controller;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2 , vsync: this);
    controller.addListener(() {
      setState(() {
        selectedIndex = controller.index;
      });
      print("Selected Index: " + controller.index.toString());
    });
  }
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Column(
          children: [
            SizedBox(height: 15,),
           Expanded(
             child: TabBar(
               indicatorColor: AppColors.blue,
               controller: controller,
                labelPadding: EdgeInsets.only(bottom: 10,),
               onTap: (value){
                 selectedIndex=value;
                 print(selectedIndex);
               },
               tabs: [
                 InterText(
                   text: "Check Date",
                   fontSize: Reponsive_.px14,
                   color:selectedIndex==0?AppColors.blue:AppColors.hintTextGrey,
                 ),
                 InterText(
                   text: "Year to Date Totals",
                   fontSize: Reponsive_.px14,
                   color:selectedIndex==1?AppColors.blue:AppColors.hintTextGrey,
                 ),
               ],
             ),
           ) ,
            Expanded(
              flex: 20,
              child: TabBarView(
                controller: controller,
                children:   [
                  CheckDate(),
                  yearToDateTotals(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.deepGreen,
          child: Image.asset(AppAssets.employeeDownload),
          onPressed: (){
            if(selectedIndex==0){

            }
            else if(selectedIndex==1){

            }
          },
        ),
      ),
    );
  }
  Widget CheckDate(){
    return ListView(
      padding: padding,
      children: [
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context,index){
            if(index==0){
              return InterText(
                text: "10 March 2023",
                fontSize: Reponsive_.px12,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                textAlign: TextAlign.center,
              );
            }
            if(index==3){
              return InterText(
                text: "09 March 2023",
                fontSize: Reponsive_.px12,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                textAlign: TextAlign.center,

              );
            }
            return Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InterText(
                    text: "Earnings",
                    fontSize: Reponsive_.px16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blue,
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength/60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "Description",
                            color: AppColors.allGray,
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "Regular",
                            color: AppColors.black,
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "Incentives",
                            color: AppColors.black,
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "Gross Pay",
                            color: AppColors.blue,
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "Rates",
                            color: AppColors.allGray,
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "\$65",
                            color: AppColors.black,
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "\$10",
                            color: AppColors.black,
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "",
                            color: AppColors.blue,
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "Hours",
                            color: AppColors.allGray,
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "100",
                            color: AppColors.black,
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "10",
                            color: AppColors.black,
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "",
                            color: AppColors.blue,
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "Current Total",
                            color: AppColors.allGray,
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "\$6,500",
                            color: AppColors.black,
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "\$100",
                            color: AppColors.black,
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "\$6,600",
                            color: AppColors.blue,
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength/70,
                  ),
                  MySeparator(
                    color: Color.fromRGBO(196, 196, 196, 0.7),
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength/70,
                  ),
                  InterText(
                    text: "Deductions",
                    fontSize: Reponsive_.px16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blue,
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength/60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "Deductions",
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.allGray,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "Medicare",
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "Federal Tax",
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "Social Security",
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "State Tax",
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "Other",
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "Total Deductions",
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "Net Pay",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue,
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text: "Current Total",
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.allGray,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "\$40",
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "\$15",
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "\$12",
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "\$40",
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "\$10",
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "\$13",
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                          SizedBox(
                            height: Reponsive_.crosslength/70,
                          ),
                          InterText(
                            text: "\$6,510",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        )
      ],
    );
  }

  Widget yearToDateTotals(){
    return ListView(
      padding: padding,
      children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context,index){
              if(index==0){
                return InterText(
                  text: "2023",
                  fontSize: Reponsive_.px12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  textAlign: TextAlign.center,
                );
              }
              if(index==3){
                return InterText(
                  text: "2022",
                  fontSize: Reponsive_.px12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  textAlign: TextAlign.center,

                );
              }
              return Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(
                      text: "Earnings",
                      fontSize: Reponsive_.px16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blue,
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength/60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Description",
                              color: AppColors.allGray,
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "Regular",
                              color: AppColors.black,
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "Incentives",
                              color: AppColors.black,
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "Gross Pay",
                              color: AppColors.blue,
                              fontSize: Reponsive_.px16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Rates",
                              color: AppColors.allGray,
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "\$65",
                              color: AppColors.black,
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "\$10",
                              color: AppColors.black,
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "",
                              color: AppColors.blue,
                              fontSize: Reponsive_.px16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Hours",
                              color: AppColors.allGray,
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "100",
                              color: AppColors.black,
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "10",
                              color: AppColors.black,
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "",
                              color: AppColors.blue,
                              fontSize: Reponsive_.px16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Current Total",
                              color: AppColors.allGray,
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "\$6,500",
                              color: AppColors.black,
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "\$100",
                              color: AppColors.black,
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "\$6,600",
                              color: AppColors.blue,
                              fontSize: Reponsive_.px16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength/70,
                    ),
                    MySeparator(
                      color: Color.fromRGBO(196, 196, 196, 0.7),
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength/70,
                    ),
                    InterText(
                      text: "Deductions",
                      fontSize: Reponsive_.px16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blue,
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength/60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Deductions",
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.allGray,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "Medicare",
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "Federal Tax",
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "Social Security",
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "State Tax",
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "Other",
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "Total Deductions",
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "Net Pay",
                              fontSize: Reponsive_.px16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blue,
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: "Current Total",
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.allGray,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "\$40",
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "\$15",
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "\$12",
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "\$40",
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "\$10",
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "\$13",
                              fontSize: Reponsive_.px14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            SizedBox(
                              height: Reponsive_.crosslength/70,
                            ),
                            InterText(
                              text: "\$6,510",
                              fontSize: Reponsive_.px16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blue,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
        )
      ],
    );
  }
}
