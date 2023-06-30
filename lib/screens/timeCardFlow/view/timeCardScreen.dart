import 'dart:async';
import 'package:easy_geofencing/easy_geofencing.dart';
import 'package:easy_geofencing/enums/geofence_status.dart';
import 'package:flutter/material.dart';
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
import 'package:geolocator/geolocator.dart';
import 'package:instacare/screens/timeCardFlow/view/timecardEdit.dart';
import 'package:intl/intl.dart';

class TimeCardScreen extends StatefulWidget {
  const TimeCardScreen({super.key});

  @override
  State<TimeCardScreen> createState() => _TimeCardScreenState();
}

class _TimeCardScreenState extends State<TimeCardScreen> {
  Timer? timer;
  final timeCardController = Get.put(TimeCardsController());
  int selectedIndex = 0;
  TextEditingController latitudeController = new TextEditingController();
  TextEditingController longitudeController = new TextEditingController();
  StreamSubscription<GeofenceStatus>? geofenceStatusStream;
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
        backgroundColor: AppColors.backGroundColor,
        body: ListView(
          padding: padding,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Obx(() => InterText(
                            text:
                            '     ${timeCardController.rangData.value.replaceAll("to", "-")}',
                            fontSize: Reponsive_.px14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.hintTextGrey,
                          )),
                        ),
                        GestureDetector(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.calendar_today_outlined,
                                color: AppColors.allGray, size: Reponsive_.crosslength*0.025),
                            onPressed: () {
                              DateConverter.RangeDatePicker(
                                context: context,
                                monthType: false,
                                dateRang: true,
                              ).then((value) {
                                if (value != null) {
                                  timeCardController.rangData.value = value;
                                  print(timeCardController.rangData.value);
                                }
                              }).onError((error, stackTrace) {
                                print("dateRangError==>>${error}");
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Reponsive_.crosslength*0.01,
                ),
                GestureDetector(
                  child: Image.asset(AppAssets.filtetr),
                  onTap: () {
                    toPushNavigator(
                        context: context,
                        PageName: ApplyFilterTimeCardScreen());
                  },
                ),
              ],
            ),
            SizedBox(
              height: Reponsive_.crosslength / 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => timeCardController.rangData.value.length >= 5
                    ? InterText(
                  text: DateConverter.monthNameDay(DateTime.parse(
                      timeCardController.rangData.value
                          .substring(0, 10)
                          .replaceAll("/", "-"))),
                  color: AppColors.hintTextGrey,
                  fontSize: Reponsive_.px14,
                  fontWeight: FontWeight.w600,
                )
                    : Container())
              ],
            ),
            ListView.builder(
                key: Key(timeCardController.selectedTile.toString()),
                itemCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (index==selectedIndex) {
                          selectedIndex = -1;
                        }else{
                          selectedIndex = index;
                        }
                      });
                    },
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      margin:
                      EdgeInsets.only(top: Reponsive_.crosslength * .01),
                      child: Padding(
                        padding: EdgeInsets.all(Reponsive_.crosslength * .01),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  //margin: EdgeInsets.only(left: Reponsive_.crosslength*0.01),
                                  padding: EdgeInsets.symmetric(
                                      vertical: Reponsive_.crosslength * .01,
                                      horizontal:
                                      Reponsive_.crosslength * .015),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(22, 71, 142, 0.05),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      InterText(
                                        text: index == 1 ? "12" : "11",
                                        fontSize: Reponsive_.px40,
                                        color: AppColors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      MontserratText(
                                        text: "March",
                                        fontWeight: FontWeight.normal,
                                        fontSize: Reponsive_.px10,
                                        color: AppColors.black,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: Reponsive_.crosslength / 35,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          InterText(
                                            text: "Jasnah Kholin",
                                            fontSize: Reponsive_.px18,
                                            color: AppColors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                vertical:
                                                Reponsive_.crosslength *
                                                    .005,
                                                horizontal: 10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: AppColors.yallow,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(20),
                                                color: Color.fromRGBO(
                                                    255, 175, 50, 0.2)),
                                            child: InterText(
                                              text: "CNA",
                                              color: AppColors.yallow,
                                              fontSize: Reponsive_.px12,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(
                                      //   height: Reponsive_.crosslength*0.005,
                                      // ),
                                      InterText(
                                        text: "Elevate Care",
                                        fontSize: Reponsive_.px16,
                                        color:
                                        const Color.fromRGBO(2, 5, 10, 0.5),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(
                                        height: Reponsive_.crosslength * 0.012,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.access_time,
                                                  color: AppColors.blue,
                                                  size: Reponsive_.crosslength*0.015),
                                              InterText(
                                                text: "  8:00 Total Hours",
                                                fontSize: Reponsive_.px14,
                                                color: AppColors.blue,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(AppAssets.loader),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              InterText(
                                                text: "Process",
                                                color: const Color.fromRGBO(
                                                    2, 5, 10, 0.5),
                                                fontSize: Reponsive_.px14,
                                                fontWeight: FontWeight.normal,
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: selectedIndex == index,
                              child: GestureDetector(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical:
                                          Reponsive_.crosslength * 0.015,
                                          horizontal:
                                          Reponsive_.crosslength * 0.01),
                                      margin: EdgeInsets.only(
                                          top: Reponsive_.crosslength * 0.015),
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
                                      height: Reponsive_.crosslength / 50,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          child: InterText(
                                            text: "  Edit",
                                            fontSize: Reponsive_.px14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.blue,
                                          ),
                                          onTap: (){
                                            toPushNavigator(context: context,PageName: TimecardEdit() );
                                          },
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                AppAssets.downodTimeCard),
                                            InterText(
                                              text: "   Download Timecard",
                                              fontSize: Reponsive_.px14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blue,
                                            ),
                                          ],
                                        ),
                                        InterText(
                                          text: "Report an Issue  ",
                                          fontSize: Reponsive_.px14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.blue,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  toPushNavigator(
                                      context: context,
                                      PageName: TimeCardDetailScreen(
                                        index: index,
                                      ));
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.yallow,
        onPressed: () {
          toPushNavigator(context: context,PageName: TimecardEdit(newTimeCard: true,));
        },
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }

  Widget CardList() {
    return const Flexible(
        child: Card(
          child: ExpansionTile(
            title: Text(
              "Periodo",
              style: TextStyle(),
              textAlign: TextAlign.center,
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  "Periodo 1",
                  textAlign: TextAlign.center,
                ),
              ),
              ListTile(
                title: Text(
                  "Periodo 2",
                  textAlign: TextAlign.center,
                ),
              ),
              ListTile(
                title: Text(
                  "Periodo 3",
                  textAlign: TextAlign.center,
                ),
              ),
              ListTile(
                title: Text(
                  "Periodo 4",
                  textAlign: TextAlign.center,
                ),
              ),
              ListTile(
                title: Text(
                  "Periodo 5",
                  textAlign: TextAlign.center,
                ),
              ),
              ListTile(
                title: Text(
                  "Periodo 6",
                  textAlign: TextAlign.center,
                ),
              ),
              ListTile(
                title: Text(
                  "Periodo 7",
                  textAlign: TextAlign.center,
                ),
              ),
              ListTile(
                title: Text(
                  "Periodo 8",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}
