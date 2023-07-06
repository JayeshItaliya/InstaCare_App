import 'dart:async';
import 'package:easy_geofencing/easy_geofencing.dart';
import 'package:easy_geofencing/enums/geofence_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonTextFormField.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/employeeFlow/timeCardFlow/controller/employeeTimeController.dart';
import 'package:instacare/screens/employeeFlow/timeCardFlow/view/employeeFilterTimerScreen.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
class EmployeeTimeCard extends StatefulWidget {
  const EmployeeTimeCard({super.key});

  @override
  State<EmployeeTimeCard> createState() => _EmployeeTimeCardState();
}

class _EmployeeTimeCardState extends State<EmployeeTimeCard> {
  DateTime currentDate = DateTime.now();
  Timer? timer;
  final employeeTimeCardController=Get.put(EmployeeTimeController());
  StreamSubscription<GeofenceStatus>? geofenceStatusStream;
  TextEditingController latitudeController = new TextEditingController();
  TextEditingController longitudeController = new TextEditingController();
  Geolocator geolocator = Geolocator();
  String geofenceStatus = '';
  bool isReady = false;
  Position? position;
  String date1='',time1='',date2='',time2='';

  @override
  void initState() {
    super.initState();
    getCurrentPosition();

  }
  @override
  void dispose(){
    geofenceStatusStream?.cancel();
    timer?.cancel();
    super.dispose();

  }

  getCurrentPosition() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("LOCATION => ${position!.toJson()}");
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) async {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    });
    isReady = (position != null) ? true : false;
    latitudeController =
        TextEditingController(text: position!.latitude.toString());
    longitudeController =
        TextEditingController(text: position!.longitude.toString());

    EasyGeofencing.startGeofenceService(
        pointedLatitude: latitudeController.text,
        pointedLongitude: longitudeController.text,
        radiusMeter: '3',
        eventPeriodInSeconds: 5);
    if (geofenceStatusStream == null) {
      geofenceStatusStream = EasyGeofencing.getGeofenceStream()!
          .listen((GeofenceStatus status) {
        print(status.toString());
        geofenceStatus = status.toString();
        if (geofenceStatus.contains('enter') && date1.isEmpty) {
          date1=getDateTime(position!.timestamp!,'EEEE, dd MMMM');
          time1=getDateTime(position!.timestamp!,'hh:mm a');
          setState(() {});
        }else if (geofenceStatus.contains('exit') && date1.isNotEmpty && date2.isEmpty) {
          date2=getDateTime(position!.timestamp!,'EEEE, dd MMMM');
          time2=getDateTime(position!.timestamp!,'hh:mm a');
          setState(() {});
        }
      });
    }
  }

  String getDateTime(DateTime dateTime,String format) {
    // final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat(format);
    return formatter.format(dateTime.toLocal());
  }

  setLocation() async {
    await getCurrentPosition();
    // print("POSITION => ${position!.toJson()}");
    latitudeController =
        TextEditingController(text: position!.latitude.toString());
    longitudeController =
        TextEditingController(text: position!.longitude.toString());
  }
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      body: Obx(()=>
        ListView(
          key: Key(employeeTimeCardController.selectedTile.toString()),
          padding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength / 50, vertical: Reponsive_.crosslength*0.001),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(""),
                MontserratText(
                  text: DateFormat('d, MMMM').format(currentDate),
                  fontWeight: FontWeight.w600,
                  color: AppColors.hintTextGrey,
                  textAlign: TextAlign.center,
                  fontSize: Reponsive_.px14,
                ),
                GestureDetector(
                    child: Image.asset(AppAssets.filtetr),
                  onTap: (){
                      toPushNavigator(context: context,PageName:  const EmployeeFilterTimerScreen());
                  },
                )
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              padding: EdgeInsets.zero,
              itemBuilder: (context,index){
                return Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.zero,
                      child:  ExpansionTile(
                        key: Key(index.toString()),
                        initiallyExpanded:index== employeeTimeCardController.selectedTile.value,
                        onExpansionChanged: (value) {
                          if(value){
                            employeeTimeCardController.selectedTile.value = index;
                          }
                          else{
                            employeeTimeCardController.selectedTile.value = -1;
                          }
                        },
                        tilePadding: EdgeInsets.zero,
                        trailing: Icon(Icons.access_time_filled,color: Colors.transparent),
                        title:Row(
                          children: [
                            Expanded(
                              flex:1,
                              child: Container(
                                height: Reponsive_.h/10,
                                margin: EdgeInsets.only(top: Reponsive_.crosslength*0.005,left:Reponsive_.crosslength*0.01,bottom: Reponsive_.crosslength*0.005, ),
                                decoration: ShapeDecoration(
                                  image: const DecorationImage(
                                    image: NetworkImage("https://cdn.assistedlivingcenter.com/wp-content/uploads/2020/11/elevate-care-riverwoods-il.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: Reponsive_.crosslength/100,),
                            Expanded(
                              flex:3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InterText(
                                    text: "Elevate Care North Branch",
                                    fontWeight: FontWeight.w600,
                                    fontSize: Reponsive_.px18,
                                    color: AppColors.black,
                                  ),
                                  SizedBox(height: Reponsive_.crosslength/200,),
                                  InterText(
                                    text: "Tuesday, 21 March 2023",
                                    fontWeight: FontWeight.w600,
                                    fontSize: Reponsive_.px16,
                                    color: AppColors.hintTextGrey,
                                  ),
                                  SizedBox(height: Reponsive_.crosslength*0.015,),
                                  Row(
                                    children: [
                                      const Icon(Icons.access_time_filled_rounded,color: AppColors.blue,size: 16),
                                      InterText(
                                        text: "  Clock In at 7:00AM",
                                        fontWeight: FontWeight.w600,
                                        fontSize: Reponsive_.px14,
                                        color: AppColors.blue,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                    Reponsive_.crosslength * 0.015,
                                    horizontal:
                                    Reponsive_.crosslength * 0.01),
                                margin: EdgeInsets.only(top: Reponsive_.crosslength * 0.01,right:Reponsive_.crosslength * 0.01,left:Reponsive_.crosslength * 0.01  ),
                                decoration: BoxDecoration(
                                    color: AppColors.backGroundColor,
                                    borderRadius:
                                    BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                                AppAssets.clockIn),
                                            SizedBox(width: 8),
                                            InterText(
                                              text: "Clock-In",
                                              color: AppColors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Reponsive_.px14,
                                            )
                                          ],
                                        ),
                                        InterText(
                                          text: date1,
                                          fontSize: Reponsive_.px14,
                                          fontWeight: FontWeight.normal,
                                          color:
                                          Color.fromRGBO(2, 5, 10, 1),
                                        ),
                                        InterText(
                                          text: time1,
                                          fontSize: Reponsive_.px16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.blue,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                      Reponsive_.crosslength * 0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                                AppAssets.clockOut),
                                            SizedBox(width: 8),
                                            InterText(
                                              text: "Clock-Out",
                                              color: AppColors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Reponsive_.px14,
                                            )
                                          ],
                                        ),
                                        InterText(
                                          text: date2,
                                          fontSize: Reponsive_.px14,
                                          fontWeight: FontWeight.w400,
                                          color:
                                          Color.fromRGBO(2, 5, 10, 1),
                                        ),
                                        InterText(
                                          text: time2,
                                          fontSize: Reponsive_.px16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.blue,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength/50,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(AppAssets.downodTimeCard),
                                        SizedBox(width: 8,),
                                        InterText(
                                          text: "Download Timecard",
                                          fontSize: Reponsive_.px14,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.blue,
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      child: InterText(
                                        text: "Report an Issue",
                                        fontSize: Reponsive_.px14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blue,
                                      ),
                                      onTap: (){
                                        CommonBottonSheet(
                                          context: context,
                                          childView: ListView(
                                            shrinkWrap: true,
                                            children: [
                                              MontserratText(
                                                text: "Confirmation",
                                                textAlign: TextAlign.center,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.black,
                                                fontSize: Reponsive_.px30,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text.rich(
                                                  textAlign: TextAlign.center,
                                                  TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Do you want to “',
                                                          style: GoogleFonts.inter(
                                                              fontSize: Reponsive_.px18,
                                                              color: AppColors.allGray,
                                                              fontWeight: FontWeight.w500
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: 'Report" ',
                                                          style: GoogleFonts.inter(
                                                              fontSize: Reponsive_.px18,
                                                              color: AppColors.black,
                                                              fontWeight: FontWeight.w500
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: 'all the selected shifts timecards?',
                                                          style: GoogleFonts.inter(
                                                            fontSize: Reponsive_.px18,
                                                            color: AppColors.allGray,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                      ]
                                                  )
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding:EdgeInsets.only(right: 8,left: 8),
                                                child: CommonDropDown(
                                                    context:context ,
                                                    list:employeeTimeCardController.selectReasonList,
                                                    mycontrollerValue: employeeTimeCardController.selectReasonValue,
                                                    color: AppColors.backGroundColor
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding:EdgeInsets.only(right: 8,left: 8),
                                                child: AppWidget().getTextField(
                                                  hintText: "Add Notes",
                                                  filledColor: AppColors.backGroundColor,
                                                  maxLine: 5,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding:   EdgeInsets.only(bottom: 10,right: 8,left: 8),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: CommonButton(
                                                        text: "Submit",
                                                        onTap: (){},
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Expanded(
                                                      child: CommonButton(
                                                        text: "CANCEL",
                                                        onTap: (){
                                                          onBack(context);
                                                        },
                                                        color: AppColors.allGray,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength/50,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
            )

          ],
        ),
      ),
    );
  }
}
