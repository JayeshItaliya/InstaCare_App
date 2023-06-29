import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonContainer.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/helper/date_conveter.dart';
import 'package:instacare/screens/employeeFlow/facilitiesView/controller/employeeFacilitiesController.dart';

class EmpFacilitiesScreenDeatils extends StatefulWidget {
  const EmpFacilitiesScreenDeatils({super.key});

  @override
  State<EmpFacilitiesScreenDeatils> createState() => _EmpFacilitiesScreenDeatilsState();
}

class _EmpFacilitiesScreenDeatilsState extends State<EmpFacilitiesScreenDeatils> {
  final employeeFacilitiesController=Get.put(EmployeeFacilitiesController());
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    print(Reponsive_.crosslength*0.1);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Reponsive_.w,
              height: Reponsive_.crosslength/2.2,
              child: Stack(
                children: [
                  Container(
                    width: Reponsive_.w,
                    height: Reponsive_.crosslength*0.4,
                    padding: EdgeInsets.only(
                        top: Reponsive_.crosslength*0.03
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: (){
                                      onBack(context);
                                    },
                                    icon: Icon(Icons.arrow_back,color: AppColors.white,size: 26,)
                                ),
                                Image.asset(AppAssets.empLogo,color: AppColors.deepGreen),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Row(

                                children: [
                                  Image.asset(AppAssets.bell,width: 30,height: 30,color: AppColors.white,)
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding:   EdgeInsets.only(left: 8,right: 8,bottom: Reponsive_.crosslength/25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MontserratText(
                                text: "Elevate Care North Branch",
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(AppAssets.location),
                                      SizedBox(width: 5,),
                                      InterText(
                                        text: "Seattle Grace - 135 Ridgewood Ave.",
                                        fontWeight: FontWeight.w400,
                                        fontSize: Reponsive_.px14,
                                        color: AppColors.white,
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Row(
                                      children: [
                                        Image.asset(AppAssets.senderEmp),
                                        SizedBox(width: 5,),
                                        InterText(
                                          text: "5.2 mi",
                                          fontSize: Reponsive_.px14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      top: Reponsive_.crosslength/2.6,
                      left:Reponsive_.crosslength/2.3 ,
                      child: Image.asset(AppAssets.downlodEmp,width: 30,height: 30,)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InterText(
                    text: 'About',
                    fontWeight: FontWeight.w600,
                    fontSize: Reponsive_.px16,
                    color: AppColors.blue,
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength/100,
                  ),
                  InterText(
                    text: 'Description',
                    fontWeight: FontWeight.w400,
                    fontSize: Reponsive_.px12,
                    color: AppColors.black,
                  ),
                  InterText(
                    maxLines: 10,
                    text: "Fusce eget mattis nulla. Nunc ligula sem, ornare sed feugiat sit amet, consectetur eget urna. Praesent non fermentum quam, sed tincidunt orci. Ut enim arcu, pellentesque eu quam in, sollicitudin ultrices tellus. Integer at efficitur arcu. Duis eleifend, leo sit amet dictum tincidunt, felis ipsum suscipit nisl, in laoreet nibh elit eu tortor. In pretium felis dolor.",
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength/100,
                  ),
                  InterText(
                    maxLines: 10,
                    text: "Integer sed quam ultrices, sagittis tellus a, venenatis ex. Pellentesque condimentum tristique ante, sed scelerisque sapien lobortis quis.",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Reponsive_.crosslength/100,
            ),
            CommonContainer(
              bgcolor: AppColors.white,
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InterText(
                            text: "Contact Info",
                            fontSize: Reponsive_.px16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue,
                          ),
                          Container(
                            width: Reponsive_.crosslength/12,
                            height: Reponsive_.crosslength/12,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image:NetworkImage(imageUrl1),
                                    fit: BoxFit.cover
                                )
                            ),
                          )
                        ],
                      ),
                      InterText(
                        text: "Contact Person",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/60,
                      ),
                      InterText(
                        text: "Joel Newman",
                        fontSize: Reponsive_.px18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),


                      SizedBox(
                        height: Reponsive_.crosslength/60,
                      ),
                      InterText(
                        text: "Phone",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/60,
                      ),
                      InterText(
                        text: "8888888888",
                        fontSize: Reponsive_.px18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),


                      SizedBox(
                        height: Reponsive_.crosslength/60,
                      ),
                      InterText(
                        text: "Address",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/60,
                      ),
                      InterText(
                        text: "5454 Fargo Ave",
                        fontSize: Reponsive_.px18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),


                      SizedBox(
                        height: Reponsive_.crosslength/60,
                      ),
                      InterText(
                        text: "Address",
                        fontSize: Reponsive_.px12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: Reponsive_.crosslength/60,
                      ),
                      InterText(
                        text: "5454 Fargo Ave",
                        fontSize: Reponsive_.px18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Reponsive_.crosslength/60,
                              ),
                              InterText(
                                text: "City",
                                fontSize: Reponsive_.px12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength/60,
                              ),
                              InterText(
                                text: "Skokie",
                                fontSize: Reponsive_.px18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),

                              SizedBox(
                                height: Reponsive_.crosslength/60,
                              ),
                              InterText(
                                text: "Zip",
                                fontSize: Reponsive_.px12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength/60,
                              ),
                              InterText(
                                text: "60077",
                                fontSize: Reponsive_.px18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Reponsive_.crosslength/60,
                              ),
                              InterText(
                                text: "State",
                                fontSize: Reponsive_.px12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength/60,
                              ),
                              InterText(
                                text: "Illinois",
                                fontSize: Reponsive_.px18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),


                              SizedBox(
                                height: Reponsive_.crosslength/60,
                              ),
                              InterText(
                                text: "Country",
                                fontSize: Reponsive_.px12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength/60,
                              ),
                              InterText(
                                text: "United States",
                                fontSize: Reponsive_.px18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ],
                          )

                          // SizedBox(
                          //   height: Reponsive_.crosslength/60,
                          // ),
                          // InterText(
                          //   text: "Address",
                          //   fontSize: Reponsive_.px12,
                          //   fontWeight: FontWeight.w400,
                          //   color: AppColors.black,
                          // ),
                          // SizedBox(
                          //   height: Reponsive_.crosslength/60,
                          // ),
                          // InterText(
                          //   text: "City",
                          //   fontSize: Reponsive_.px18,
                          //   fontWeight: FontWeight.w600,
                          //   color: AppColors.black,
                          // ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Reponsive_.crosslength/70,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: "Request Shift",
                      onTap: (){
                        CommonBottonSheet(
                          context: context,
                          childView: ListView(
                            padding: EdgeInsets.only(left: 8,right: 8),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              SizedBox(
                                height: Reponsive_.crosslength/30,
                              ),
                              MontserratText(
                                text: "Request Shift",
                                fontSize: Reponsive_.px30,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                              ),
                              ListView.builder(
                                  itemCount: employeeFacilitiesController.dallyServices.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        Transform.scale(
                                          scale: 1.3,
                                          child: Theme(
                                              data: ThemeData(unselectedWidgetColor: AppColors.buttonColor),
                                              child: Obx(()=>
                                                  Radio(
                                                    groupValue: employeeFacilitiesController.dallyServicesValue.value,
                                                    value: employeeFacilitiesController.dallyServices[index],
                                                    activeColor: AppColors.buttonColor,
                                                    onChanged: (newValue) {
                                                      employeeFacilitiesController.dallyServicesValue.value=newValue.toString();
                                                      print(employeeFacilitiesController.dallyServicesValue.value);
                                                    },
                                                  ),
                                              )

                                          ),
                                        ),
                                        GestureDetector(
                                          child: InterText(
                                            text: employeeFacilitiesController.dallyServices[index].toString(),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 17,
                                            color: AppColors.black,
                                          ),
                                          onTap: (){
                                            employeeFacilitiesController.dallyServicesValue.value=employeeFacilitiesController.dallyServices[index];
                                            print(employeeFacilitiesController.dallyServicesValue.value);
                                          },
                                        ),
                                      ],
                                    );
                                  }),
                              GestureDetector(
                                onTap: (){
                                  DateConverter.RangeDatePicker(
                                      context: context,
                                      monthType: false,
                                      dateRang: false,
                                    dateType: true,
                                  ).then((value) {
                                    employeeFacilitiesController.selectedDate.value=value.toString();
                                  });
                                },
                                child: Container(
                                  width: Reponsive_.w,
                                  height: 50,
                                  padding: EdgeInsets.only(left: 10,right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: AppColors.buttonColor,
                                      width: 0.5
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(() => InterText(
                                        text: employeeFacilitiesController.selectedDate.value,
                                        fontWeight: FontWeight.w400,
                                        fontSize: Reponsive_.px18,
                                        color: Color.fromRGBO(2, 5, 10, 0.5),
                                      )),
                                      Image.asset(AppAssets.dropDown)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength/50,
                              ),
                              CommonDropDown(
                                  context: context,
                                  list: employeeFacilitiesController.shift,
                                  mycontrollerValue: employeeFacilitiesController.shiftValue,
                                color: AppColors.white
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength/50,
                              ),
                              CommonButton(
                                  text: "Submit Request",
                                  onTap: (){
                                    onBack(context);
                                  }
                              ),
                              SizedBox(
                                height: Reponsive_.crosslength/50,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CommonButton(
                      text: "Message",
                      onTap: (){},
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Reponsive_.crosslength/70,
            ),
          ],
        ),
      ),
    );
  }
  String imageUrl="https://ssl.cdn-redfin.com/photo/114/mbphoto/289/genMid.6392289_1_0.jpg";
  String imageUrl1="https://t3.ftcdn.net/jpg/02/95/51/80/360_F_295518052_aO5d9CqRhPnjlNDTRDjKLZHNftqfsxzI.jpg";
}


