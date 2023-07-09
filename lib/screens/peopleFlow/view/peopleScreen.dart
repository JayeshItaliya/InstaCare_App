import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Commonwidgets.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonDrower.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/model/peopleModel.dart';
import 'package:instacare/screens/dashBoardFlow/view/peopleDashBoardFlow/Controller/peopleController.dart';
import 'package:instacare/screens/dashBoardFlow/view/peopleDashBoardFlow/view/peopleScreenDetial.dart';
import 'package:instacare/screens/peopleFlow/controller/controller.dart';
import 'package:instacare/screens/peopleFlow/view/applyFilterScreen.dart';

class PeopleScreen extends StatefulWidget {
  PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  final globalKey = GlobalKey<ScaffoldState>();
  final controller = TextEditingController();
  final peopleController = Get.put(PeopleControllerFilter());
  final peopleControllerDetial = Get.put(PeopleController());

  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      key: globalKey,
      backgroundColor: AppColors.backGroundColor,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Reponsive_.crosslength * 0.01,
                left: Reponsive_.crosslength * 0.02,
                right: Reponsive_.crosslength * 0.02),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: Reponsive_.crosslength * 0.04,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search by name",
                          isDense: true,
                          hintStyle: GoogleFonts.inter(
                              fontSize: Reponsive_.px14,
                              color: AppColors.hintTextGrey,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Image.asset(
                    AppAssets.filtetr,
                    scale: 1.2,
                  ),
                  onTap: () {
                    toPushNavigator(
                        context: context, PageName: ApplyFilterPeopleScreen());
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.001,
          ),
          Obx(() => peopleController.loadingValue.value == true
              ? Column(
                children: [
                  SizedBox(
                      height: Reponsive_.crosslength/4
                  ),
                  Container(
                      child: CircularProgressIndicator(
                        color: AppColors.buttonColor,
                      ),
                      ),
                ],
              )
              : ListView.builder(
                  itemCount: peopleController.peopleData.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    PeopleList data = peopleController.peopleData[index];
                    return GestureDetector(
                      onTap: () {
                        toPushNavigator(
                            context: context,
                            PageName: PeopleScreenDetil(
                              id: data.id,
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Reponsive_.crosslength * 0.01,
                            vertical: Reponsive_.crosslength * 0.015),
                        margin: EdgeInsets.only(
                            top: Reponsive_.crosslength * 0.01,
                            left: Reponsive_.crosslength * 0.02,
                            right: Reponsive_.crosslength * 0.02),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppColors.buttonColor, width: 2),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        data.image.toString(),
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
                                  InterText(
                                    text: data.fullname,
                                    color: Color(0xff02050A),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    height: Reponsive_.crosslength * 0.006,
                                  ),
                                  Row(
                                    children: [
                                      InterText(
                                        text: data.role,
                                        color: Color(0xff02050A),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      InterText(
                                        text: '  ${data.email}',
                                        color: Color(0xff16478E),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                data.status == "1"
                                    ? Row(
                                        children: [
                                          InterText(
                                            text: 'Available ',
                                            color: Color(0xff02050A),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.deepGreen,
                                            ),
                                          ),
                                        ],
                                      )
                                    : data.status == "2"
                                        ? Row(
                                            children: [
                                              InterText(
                                                text: 'Away',
                                                color: Color(0xff02050A),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              Container(
                                                height: 10,
                                                width: 10,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.yallow,
                                                ),
                                              ),
                                            ],
                                          )
                                        : data.status == "3"
                                            ? Row(
                                                children: [
                                                  InterText(
                                                    text: 'Busy',
                                                    color: Color(0xff02050A),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: AppColors.redColor,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : data.status == "4"
                                                ? Row(
                                                    children: [
                                                      InterText(
                                                        text: 'DND',
                                                        color:
                                                            Color(0xff02050A),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      Container(
                                                        height: 10,
                                                        width: 10,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: AppColors
                                                              .redColor,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : data.status == "5"
                                                    ? Row(
                                                        children: [
                                                          InterText(
                                                            text: 'Offline',
                                                            color: Color(
                                                                0xff02050A),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                          Container(
                                                            height: 10,
                                                            width: 10,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: AppColors
                                                                  .hintTextGrey,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : Container(),
                                SizedBox(
                                  height: Reponsive_.crosslength * 0.008,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Reponsive_.crosslength * 0.01,
                                              vertical: Reponsive_.crosslength *
                                                  0.003),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Reponsive_.crosslength *
                                                          0.02),
                                              color: AppColors.yallow),
                                          child: Row(
                                            children: [
                                              InterText(
                                                text: data.review == null
                                                    ? '5'
                                                    : data.review,
                                                color: AppColors.blue,
                                                fontSize:
                                                    Reponsive_.crosslength *
                                                        0.015,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              Image.asset(
                                                AppAssets.star,
                                                height: Reponsive_.crosslength *
                                                    0.015,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: Reponsive_.crosslength * 0.008,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Reponsive_.crosslength * 0.01,
                                              vertical: Reponsive_.crosslength *
                                                  0.003),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Reponsive_.crosslength *
                                                          0.02),
                                              color: AppColors.yallow),
                                          child: InterText(
                                            text: data.points == null
                                                ? '0 pts'
                                                : data.points,
                                            color: AppColors.blue,
                                            fontSize:
                                                Reponsive_.crosslength * 0.015,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
        ],
      ),
    );
  }
}
