import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/helper/date_conveter.dart';
import 'package:get/get.dart';
import 'package:instacare/screens/timeCardFlow/controller/controller/timeCardController.dart';
import 'package:instacare/screens/timeCardFlow/view/applyFilterScreen.dart';
import 'package:instacare/screens/timeCardFlow/view/timecardDetailScreen.dart';

class TimeCardScreen extends StatefulWidget {
  const TimeCardScreen({super.key});

  @override
  State<TimeCardScreen> createState() => _TimeCardScreenState();
}

class _TimeCardScreenState extends State<TimeCardScreen> {
  final timeCardController=Get.put(TimeCardsController());
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
        body: ListView(
          padding: padding,
          children: [
            Row(
              children: [
                Expanded(
                  child: Obx(() => InterText(
                    text: timeCardController.rangData.value.replaceAll("to", "-"),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.hintTextGrey,
                  )),
                ),
                GestureDetector(
                    child: IconButton(
                      icon:const Icon(Icons.calendar_today_outlined,color: AppColors.allGray,size: 30),
                      onPressed: (){
                          DateConverter.RangeDatePicker(
                              context: context,
                              monthType: false,
                              dateRang: true,
                          ).then((value) {
                            if(value!=null){
                              timeCardController.rangData.value=value;
                              print(timeCardController.rangData.value);
                            }
                          }).onError((error, stackTrace){
                            print("dateRangError==>>${error}");
                          });
                      },
                    ),
                  
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  child: Image.asset(AppAssets.filtetr),
                  onTap: (){
                    toPushNavigator(context: context,PageName: ApplyFilterTimeCardScreen());
                  },
                ),
              ],
            ),
            SizedBox(
              height:Reponsive_.crosslength/100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => timeCardController.rangData.value.length>=5? InterText(
                  text: DateConverter.monthNameDay(DateTime.parse(timeCardController.rangData.value.substring(0,10).replaceAll("/", "-"))),
                  color: AppColors.hintTextGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ):Container())
              ],
            ),
                ListView.builder(
                key: Key(timeCardController.selectedTile.toString()),
                itemCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: Reponsive_.crosslength/50),
                    child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.zero,
                        child:
                        ExpansionTile(
                          key: Key(index.toString()),
                          tilePadding: EdgeInsets.zero,
                          initiallyExpanded:index== timeCardController.selectedTile,
                          onExpansionChanged: (value) {
                            if(value){
                              setState(() {
                                timeCardController.selectedTile=index;
                              });
                            }
                            else{
                              setState(() {
                                timeCardController.selectedTile=-1;
                              });
                            }
                          },
                          title: SizedBox(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    InterText(
                                      text:index==1?"12":"11",
                                      fontSize: 40,
                                      color: AppColors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    MontserratText(
                                      text: "March",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10,
                                      color: AppColors.black,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: Reponsive_.crosslength/35,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InterText(
                                      text: "Jasnah Kholin",
                                      fontSize: 18,
                                      color: AppColors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    InterText(
                                      text: "Elevate Care",
                                      fontSize: 16,
                                      color: const Color.fromRGBO(2, 5, 10, 0.5),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      height: Reponsive_.crosslength/50,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.access_time,color: AppColors.blue,size: 15),
                                        SizedBox(
                                          width: Reponsive_.crosslength/200,
                                        ),
                                        InterText(
                                          text: "8:00 Total Hours",
                                          fontSize: 15,
                                          color: AppColors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),

                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          trailing: SizedBox(
                            width:Reponsive_.crosslength/10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width:Reponsive_.crosslength/10,
                                  height: Reponsive_.crosslength/22,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.yallow,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromRGBO(255, 175, 50, 0.2)
                                  ),
                                  child: InterText(
                                    text: "CNA",
                                    color: AppColors.yallow,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                               // index==1?Row(
                               //    children: [
                               //      Image.asset(AppAssets.loader),
                               //      const SizedBox(
                               //         width: 10,
                               //      ),
                               //      InterText(
                               //        text: "Process",
                               //        color: const Color.fromRGBO(2, 5, 10, 0.5),
                               //        fontSize: 14,
                               //        fontWeight: FontWeight.normal,
                               //      )
                               //    ],
                               //  ):Container()
                              ],
                            ),
                          ),
                          children: [
                            SizedBox(
                              height: Reponsive_.crosslength/25,
                            ),
                           GestureDetector(
                             child: Column(
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Row(
                                       children: [
                                         Image.asset(AppAssets.clockIn),
                                         SizedBox(width: 8),
                                         InterText(
                                           text: "Clock-In",
                                           color: AppColors.black,
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14,
                                         )
                                       ],
                                     ),
                                     InterText(
                                       text: "Saturday, 18 March",
                                       fontSize: 14,
                                       fontWeight: FontWeight.normal,
                                       color: Color.fromRGBO(2, 5, 10, 1),
                                     ),
                                     InterText(
                                       text: "7:00 AM",
                                       fontSize: 16,
                                       fontWeight: FontWeight.bold,
                                       color: AppColors.blue,
                                     ),
                                   ],
                                 ),
                                 SizedBox(
                                   height: Reponsive_.crosslength/50,
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Row(
                                       children: [
                                         Image.asset(AppAssets.clockOut),
                                         SizedBox(width: 8),
                                         InterText(
                                           text: "Clock-In",
                                           color: AppColors.black,
                                           fontWeight: FontWeight.bold,
                                           fontSize: 14,
                                         )
                                       ],
                                     ),
                                     InterText(
                                       text: "Saturday, 18 March",
                                       fontSize: 14,
                                       fontWeight: FontWeight.normal,
                                       color: Color.fromRGBO(2, 5, 10, 1),
                                     ),
                                     InterText(
                                       text: "3:25 PM",
                                       fontSize: 16,
                                       fontWeight: FontWeight.bold,
                                       color: AppColors.blue,
                                     ),
                                   ],
                                 ),
                                 SizedBox(
                                   height: Reponsive_.crosslength/50,
                                 ),
                                 Padding(
                                   padding: EdgeInsets.only(left: 5),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       InterText(
                                         text: "Edit",
                                         fontSize: 14,
                                         fontWeight: FontWeight.bold,
                                         color: AppColors.blue,
                                       ),
                                       Row(
                                         children: [
                                           Image.asset(AppAssets.downodTimeCard),
                                           SizedBox(width: 8,),
                                           InterText(
                                             text: "Download Timecard",
                                             fontSize: 14,
                                             fontWeight: FontWeight.bold,
                                             color: AppColors.blue,
                                           ),
                                         ],
                                       ),
                                       InterText(
                                         text: "Report an Issue",
                                         fontSize: 14,
                                         fontWeight: FontWeight.bold,
                                         color: AppColors.blue,
                                       ),
                                     ],
                                   ),
                                 ),
                                 SizedBox(
                                   height: Reponsive_.crosslength/50,
                                 ),
                               ],
                             ),
                             onTap: (){
                               toPushNavigator(context: context,PageName: TimeCardDetailScreen(index: index,));
                             },
                           )
                          ],
                        )

                    ),
                  );
                }
            )
          ],
        )
    );
  }
  Widget CardList(){
    return const Flexible(
        child: Card(
          child: ExpansionTile(

            title: Text("Periodo",
              style:  TextStyle(
              ),textAlign: TextAlign.center,
            ),
            children: <Widget>[
              ListTile(
                title: Text("Periodo 1",textAlign: TextAlign.center,),
              ),
              ListTile(
                title: Text("Periodo 2",textAlign: TextAlign.center,),
              ),
              ListTile(
                title: Text("Periodo 3",textAlign: TextAlign.center,),
              ),
              ListTile(
                title: Text("Periodo 4",textAlign: TextAlign.center,),
              ),
              ListTile(
                title: Text("Periodo 5",textAlign: TextAlign.center,),
              ),ListTile(
                title: Text("Periodo 6",textAlign: TextAlign.center,),
              ),ListTile(
                title: Text("Periodo 7",textAlign: TextAlign.center,),
              ),ListTile(
                title: Text("Periodo 8",textAlign: TextAlign.center,),
              ),
            ],
          ),
        )
    );
  }
}

