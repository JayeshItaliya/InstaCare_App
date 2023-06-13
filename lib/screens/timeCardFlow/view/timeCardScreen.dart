import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/helper/date_conveter.dart';
import 'package:get/get.dart';
import 'package:instacare/screens/timeCardFlow/controller/controller/controller.dart';
import 'package:intl/intl.dart';
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
                      icon: Icon(Icons.calendar_today_outlined,color: AppColors.allGray,size: 30),
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
                    print(DateTime.now());
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
            SizedBox(
              height:Reponsive_.crosslength/100,
            ),

             // Container(
             //   color: Colors.amberAccent,
             //   child: ExpansionTile(
             //     collapsedTextColor:  Colors.amberAccent,
             //      backgroundColor: Colors.red,
             //      initiallyExpanded:  true,
             //      shape: const Border(),
             //      childrenPadding: EdgeInsets.zero,
             //      onExpansionChanged: (value) {
             //
             //      },
             //      title: Text("hii"),
             //      trailing: Icon(Icons.add,color: Colors.transparent,),
             //      children: [
             //        Text("hjfhhjf"),
             //        Text("hjfhhjf"),
             //        Text("hjfhhjf"),
             //        Text("hjfhhjf"),
             //        Text("hjfhhjf"),
             //        Text("hjfhhjf"),
             //        Text("hjfhhjf"),
             //        Text("hjfhhjf"),
             //      ],
             //    ),
             // )
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

