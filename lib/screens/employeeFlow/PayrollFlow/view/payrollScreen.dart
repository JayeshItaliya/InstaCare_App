import 'package:flutter/material.dart';
import 'package:instacare/Utils/MySeparator.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';

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
        appBar: CommonAppBar(
          title: MontserratText(
            text: "Payroll",
            fontWeight: FontWeight.w700,
            fontSize: Reponsive_.px24,
            color: AppColors.blue,
          ),
        ),
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
            return Container(
              margin: EdgeInsets.only(top: 10),
              decoration:BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/x/zig_zag_edges_bg.png"),
                  fit: BoxFit.cover
                )
              ) ,
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: Reponsive_.crosslength/55,top: Reponsive_.crosslength/55),
                    child: InterText(
                      text: "Earnings",
                      fontSize: Reponsive_.px16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blue,
                    ),
                  ),
                  date_row1(
                    disp: "Description",
                    rate: "Rates",
                    hour: "Hours",
                    currentTotal: "Current Total",
                    backGroundColor: AppColors.white,
                    textColor: AppColors.allGray
                  ),
                  date_row1(
                      disp: "Regular",
                      rate: "\$65",
                      hour: "100",
                      currentTotal: "\$6,500",
                  ),
                  date_row1(
                    disp: "Regular",
                    rate: "\$65",
                    hour: "100",
                    currentTotal: "\$6,500",
                  ),
                  date_row2(
                    disp: "Gross Pay",
                    rate: "\$510K",
                    textColor: AppColors.blue,
                    backGroundColor: AppColors.white,
                      fontSize: Reponsive_.px18
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength/70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: MySeparator(
                      color: Color.fromRGBO(196, 196, 196, 0.7),
                    ),
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength/70,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Reponsive_.crosslength/55),
                    child: InterText(
                      text: "Deductions",
                      fontSize: Reponsive_.px16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blue,
                    ),
                  ),
                  date_row2(
                    disp: "Current Total",
                    rate: "\$510K",
                    textColor: AppColors.allGray,
                    backGroundColor: AppColors.white,
                  ),
                  date_row2(
                    disp: "Medicare",
                    rate: "\$320",
                  ),
                  date_row2(
                    disp: "Federal Tax",
                    rate: "\$120",
                  ),
                  date_row2(
                    disp: "Social Security",
                    rate: "\$96",
                  ),
                  date_row2(
                    disp: "State Tax",
                    rate: "\$80",
                  ),
                  date_row2(
                    disp: "Other",
                    rate: "\$70",
                  ),
                  date_row2(
                    disp: "Total Deductions",
                    rate: "\$772",
                  ),
                  date_row2(
                    disp: "Net Pay",
                    rate: "\$580K",
                    textColor: AppColors.blue,
                    backGroundColor: AppColors.white,
                      fontSize: Reponsive_.px18
                  ),
                ],
              ),
            );
          }
        ),
        SizedBox(
          height: Reponsive_.crosslength/20,
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
              return Container(
                margin: EdgeInsets.only(top: 10),
                decoration:BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/x/zig_zag_edges_bg.png"),
                        fit: BoxFit.cover
                    )
                ) ,
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: Reponsive_.crosslength/55,top: Reponsive_.crosslength/55),
                      child: InterText(
                        text: "Earnings",
                        fontSize: Reponsive_.px16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue,
                      ),
                    ),
                    date_row1(
                        disp: "Description",
                        rate: "Rates",
                        hour: "Hours",
                        currentTotal: "Current Total",
                        backGroundColor: AppColors.white,
                        textColor: AppColors.allGray
                    ),
                    date_row1(
                      disp: "Regular",
                      rate: "\$65",
                      hour: "100",
                      currentTotal: "\$6,500",
                    ),
                    date_row1(
                      disp: "Regular",
                      rate: "\$65",
                      hour: "100",
                      currentTotal: "\$6,500",
                    ),
                    date_row2(
                        disp: "Gross Pay",
                        rate: "\$510K",
                        textColor: AppColors.blue,
                        backGroundColor: AppColors.white,
                        fontSize: Reponsive_.px18
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength/70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: MySeparator(
                        color: Color.fromRGBO(196, 196, 196, 0.7),
                      ),
                    ),
                    SizedBox(
                      height: Reponsive_.crosslength/70,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: Reponsive_.crosslength/55),
                      child: InterText(
                        text: "Deductions",
                        fontSize: Reponsive_.px16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue,
                      ),
                    ),
                    date_row2(
                      disp: "Current Total",
                      rate: "\$510K",
                      textColor: AppColors.allGray,
                      backGroundColor: AppColors.white,
                    ),
                    date_row2(
                      disp: "Medicare",
                      rate: "\$320",
                    ),
                    date_row2(
                      disp: "Federal Tax",
                      rate: "\$120",
                    ),
                    date_row2(
                      disp: "Social Security",
                      rate: "\$96",
                    ),
                    date_row2(
                      disp: "State Tax",
                      rate: "\$80",
                    ),
                    date_row2(
                      disp: "Other",
                      rate: "\$70",
                    ),
                    date_row2(
                      disp: "Total Deductions",
                      rate: "\$772",
                    ),
                    date_row2(
                        disp: "Net Pay",
                        rate: "\$580K",
                        textColor: AppColors.blue,
                        backGroundColor: AppColors.white,
                        fontSize: Reponsive_.px18
                    ),
                  ],
                ),
              );
            }
        ),
        SizedBox(
          height: Reponsive_.crosslength/20,
        )
      ],
    );
  }


  Container date_row1({String? disp, String? rate, String? hour,String? currentTotal,Color? textColor,Color? backGroundColor}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.01,vertical: Reponsive_.crosslength*0.01,),
      margin: EdgeInsets.only(left: Reponsive_.crosslength*0.01,right: Reponsive_.crosslength*0.01,top: Reponsive_.crosslength*0.006,),
      decoration: BoxDecoration(
        color:backGroundColor?? AppColors.backGroundColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: InterText(
              text: disp,
              fontSize: Reponsive_.crosslength*0.015,
              fontWeight: FontWeight.w600,
              color:textColor?? AppColors.black,
            ),
          ),
          Expanded(
            child: InterText(
              text: rate,
              fontSize: Reponsive_.crosslength*0.015,
              fontWeight: FontWeight.w600,
              color:textColor?? AppColors.black,
            ),
          ),
          Expanded(
            child: InterText(
              text: hour,
              fontSize: Reponsive_.crosslength*0.015,
              fontWeight: FontWeight.w600,
              color:textColor?? AppColors.black,
            ),
          ),
          Expanded(
            child: InterText(
              text: currentTotal,
              fontSize: Reponsive_.crosslength*0.015,
              fontWeight: FontWeight.w600,
              color:textColor?? AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Container date_row2({String? disp, String? rate,Color? textColor,Color? backGroundColor,double? fontSize}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.01,vertical: Reponsive_.crosslength*0.01,),
      margin: EdgeInsets.only(left: Reponsive_.crosslength*0.01,right: Reponsive_.crosslength*0.01,top: Reponsive_.crosslength*0.006,),
      decoration: BoxDecoration(
        color:backGroundColor??AppColors.backGroundColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InterText(
            text: disp,
            fontSize:fontSize?? Reponsive_.crosslength*0.015,
            fontWeight: FontWeight.w600,
            color:textColor?? AppColors.black,
          ),
          InterText(
            text: rate,
            fontSize:fontSize?? Reponsive_.crosslength*0.015,
            fontWeight: FontWeight.w600,
            color:textColor?? AppColors.black,
          ),
        ],
      ),
    );
  }
}
