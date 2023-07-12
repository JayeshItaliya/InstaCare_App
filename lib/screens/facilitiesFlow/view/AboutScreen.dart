import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/CommonDropDown.dart';
import 'package:instacare/Utils/Commonwidgets.dart';
import 'package:instacare/Utils/MySeparator.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonContainer.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/view/availableEmployeesFlow/controller/filterController.dart';

import '../../../Utils/commonButton.dart';
import '../controller/AddressBottomSheetController.dart';


class AboutScreen extends StatefulWidget {
  static List<ContactInfoModel> ContactInfoModelList = [];

  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String desc =
      'Fusce eget mattis nulla. Nunc ligula sem, ornare sed feugiat sit amet, consectetur eget urna. Praesent non fermentum quam, sed tincidunt orci. Ut enim arcu, pellentesque eu quam in, sollicitudin ultrices tellus. Integer at efficitur arcu. Duis eleifend, leo sit amet dictum tincidunt, felis ipsum suscipit nisl, in laoreet nibh elit eu tortor. In pretium felis dolor.Integer sed quam ultrices, sagittis tellus a, venenatis ex. Pellentesque condimentum tristique ante, sed scelerisque sapien lobortis quis.';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AboutScreen.ContactInfoModelList=[];
  }

  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            about(),
            facility_guide(),
            address(),
            contact_info(),
            SizedBox(
              height: Reponsive_.crosslength * 0.015,
            ),
          ],
        ),
      ),
    );
  }

  CommonContainer contact_info() {
    return CommonContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterText(
                text: 'Contact Info',
                color: AppColors.blue,
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.crosslength * 0.015,
              ),
              InkWell(
                onTap: (){
                  edit_contact_info_bottomsheet();
                },
                child: Container(
                  height: Reponsive_.crosslength * 0.032,
                  width: Reponsive_.crosslength * 0.032,
                  decoration: BoxDecoration(
                    color: AppColors.yallow,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/profileFlow/pencil.png',
                    scale: 3,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.01,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: Reponsive_.crosslength * 0.015,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: 'Contact Person',
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: Reponsive_.crosslength * 0.012,
                            ),
                            InterText(
                              text: 'Stacy Douglas',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: Reponsive_.crosslength * 0.015,
                              height: Reponsive_.crosslength*0.0015,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: 'Position',
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: Reponsive_.crosslength * 0.012,
                            ),
                            InterText(
                              text: 'Manager',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: Reponsive_.crosslength * 0.015,
                              height: Reponsive_.crosslength*0.0015,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength * 0.015,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: 'Phone',
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: Reponsive_.crosslength * 0.012,
                            ),
                            InterText(
                              text: '8888888888',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: Reponsive_.crosslength * 0.015,
                              height: Reponsive_.crosslength*0.0015,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterText(
                              text: 'Email',
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: Reponsive_.crosslength * 0.012,
                            ),
                            InterText(
                              text: 'stacy.d@gmail.com',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: Reponsive_.crosslength * 0.015,
                              height: Reponsive_.crosslength*0.0015,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Reponsive_.crosslength * 0.015,
                  ),
                  if (index != 2) ...{
                    MySeparator(
                      color: AppColors.buttonColor,
                      height: 2,
                    )
                  }
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  CommonContainer address() {
    return CommonContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterText(
                text: 'Address',
                color: AppColors.blue,
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.crosslength * 0.015,
              ),
              InkWell(
                onTap: () {
                  edit_address_bottomsheet();
                },
                child: Container(
                  height: Reponsive_.crosslength * 0.032,
                  width: Reponsive_.crosslength * 0.032,
                  decoration: BoxDecoration(
                    color: AppColors.yallow,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/profileFlow/pencil.png',
                    scale: 3,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.01,
          ),
          InterText(
            text: 'Address',
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: Reponsive_.crosslength * 0.012,
          ),
          InterText(
            text: '5454 Fargo Ave',
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: Reponsive_.crosslength * 0.015,
            height: Reponsive_.crosslength*0.0015,
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.015,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(
                      text: 'City',
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: Reponsive_.crosslength * 0.012,
                    ),
                    InterText(
                      text: 'Skokie',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: Reponsive_.crosslength * 0.015,
                      height: Reponsive_.crosslength*0.0015,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(
                      text: 'State',
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: Reponsive_.crosslength * 0.012,
                    ),
                    InterText(
                      text: 'Illinois',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: Reponsive_.crosslength * 0.015,
                      height: Reponsive_.crosslength*0.0015,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.015,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(
                      text: 'Zip',
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: Reponsive_.crosslength * 0.012,
                    ),
                    InterText(
                      text: '123456',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: Reponsive_.crosslength * 0.015,
                      height: Reponsive_.crosslength*0.0015,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InterText(
                      text: 'Country',
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: Reponsive_.crosslength * 0.012,
                    ),
                    InterText(
                      text: 'United States',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: Reponsive_.crosslength * 0.015,
                      height: Reponsive_.crosslength*0.0015,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  CommonContainer facility_guide() {
    return CommonContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InterText(
                text: 'Facility Guide',
                color: AppColors.blue,
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.crosslength * 0.015,
              ),
              SizedBox(
                height: Reponsive_.crosslength * 0.005,
              ),
              Text('Beacon-health-center.pdf',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: Reponsive_.crosslength * 0.015,
                  )),
            ],
          ),
          Container(
            height: Reponsive_.crosslength * 0.032,
            width: Reponsive_.crosslength * 0.032,
            decoration: BoxDecoration(
              color: AppColors.yallow,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/profileFlow/download.png',
              scale: 3,
            ),
          ),
        ],
      ),
    );
  }

  CommonContainer about() {
    return CommonContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterText(
                text: 'About',
                color: AppColors.blue,
                fontWeight: FontWeight.w600,
                fontSize: Reponsive_.crosslength * 0.015,
              ),
              InkWell(
                onTap: () {
                  edit_about_bottom_sheet();
                },
                child: Container(
                  height: Reponsive_.crosslength * 0.032,
                  width: Reponsive_.crosslength * 0.032,
                  decoration: BoxDecoration(
                    color: AppColors.yallow,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/profileFlow/pencil.png',
                    scale: 3,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.01,
          ),
          InterText(
            text: 'Description',
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: Reponsive_.crosslength * 0.012,
          ),
          SizedBox(
            height: Reponsive_.crosslength * 0.005,
          ),
          Text(
              'Fusce eget mattis nulla. Nunc ligula sem, ornare sed feugiat sit amet, consectetur eget urna. Praesent non fermentum quam, sed tincidunt orci. Ut enim arcu, pellentesque eu quam in, sollicitudin ultrices tellus. Integer at efficitur arcu. Duis eleifend, leo sit amet dictum tincidunt, felis ipsum suscipit nisl, in laoreet nibh elit eu tortor. In pretium felis dolor.Integer sed quam ultrices, sagittis tellus a, venenatis ex. Pellentesque condimentum tristique ante, sed scelerisque sapien lobortis quis.',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,height: Reponsive_.crosslength*0.0016,
                fontSize: Reponsive_.crosslength * 0.015,
              )),
        ],
      ),
    );
  }

  void edit_about_bottom_sheet() {
    CommonBottonSheet(
        childView: Container(
          padding: EdgeInsets.only(
              top: Reponsive_.h * 0.02,
              left: Reponsive_.h * 0.02,
              right: Reponsive_.h * 0.02),
          alignment: Alignment.centerLeft,
          height: Reponsive_.crosslength / 1.2,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InterText(
                text: ' Edit Facility',
                fontWeight: FontWeight.w700,
                fontSize: Reponsive_.crosslength * 0.025,
                color: Colors.black,
              ),
              SizedBox(
                height: Reponsive_.crosslength * 0.02,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                    vertical: Reponsive_.crosslength * 0.02,horizontal: Reponsive_.crosslength * 0.02),
                decoration: BoxDecoration(
                    color: AppColors.backGroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: InterText(
                  text: 'Beacon Health Center',
                  fontWeight: FontWeight.w400,
                  fontSize: Reponsive_.crosslength * 0.018,
                  color: AppColors.black,
                ),
              ),
              SizedBox(
                height: Reponsive_.crosslength * 0.01,
              ),
              Expanded(
                child: Container(
                  height: Reponsive_.crosslength * 0.2,
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      vertical: Reponsive_.crosslength * 0.02),
                  decoration: BoxDecoration(
                      color: AppColors.backGroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextField(
                    maxLines: 500,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Description",
                        hintStyle:
                            GoogleFonts.inter(fontWeight: FontWeight.w400),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Reponsive_.crosslength * 0.015,vertical: Reponsive_.crosslength * 0.0015,)),
                  ),
                ),
              ),
              SizedBox(
                height: Reponsive_.crosslength * 0.06,
              ),
              Row(
                children: [
                  Expanded(
                    child: CommonButton(text: 'SAVE', onTap: (){
                      onBack(context);
                    }),
                  ),
                  SizedBox(
                    width: Reponsive_.crosslength * 0.01,
                  ),
                  Expanded(
                    child: CommonButton(text: 'CANCEL', onTap: (){
                      onBack(context);
                    },color: AppColors.allGray),
                  ),
                ],
              ),
              SizedBox(
                height: Reponsive_.crosslength * 0.02,
              ),
            ],
          ),
        ),
        context: context);
  }

  void edit_address_bottomsheet() {
    TextEditingController _addressController =
        TextEditingController(text: '5454 Fargo Ave');
    TextEditingController _cityController =
        TextEditingController(text: 'Skokie');
    TextEditingController _stateController =
        TextEditingController(text: 'illinois');
    TextEditingController _zipController =
        TextEditingController(text: '123456');
    final filterController = Get.put(AddressBottomSheetController());
    CommonBottonSheet(
        childView: Container(
          padding: EdgeInsets.only(
              top: Reponsive_.crosslength * 0.02,
              left: Reponsive_.crosslength * 0.02,
              right: Reponsive_.crosslength * 0.02),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InterText(
                text: ' Address',
                fontWeight: FontWeight.w700,
                fontSize: Reponsive_.crosslength * 0.025,
                color: Colors.black,
              ),
              SizedBox(
                height: Reponsive_.crosslength * 0.02,
              ),
              Commonwidgets.text_field(
                  TextInputType.text, "Address", _addressController),
              SizedBox(
                height: Reponsive_.crosslength * 0.01,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(),
                  decoration: BoxDecoration(
                      // color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: CommonDropDown(
                      context: context,
                      list: filterController.countryList,
                      mycontrollerValue: filterController.selectedCountry,
                      color: AppColors.backGroundColor),
                  height: Reponsive_.crosslength * 0.055),
              SizedBox(
                height: Reponsive_.crosslength * 0.01,
              ),
              Commonwidgets.text_field(
                  TextInputType.text, "City", _cityController),
              SizedBox(
                height: Reponsive_.crosslength * 0.01,
              ),
              Row(
                children: [
                  Expanded(
                      child: Commonwidgets.text_field(
                          TextInputType.text, "State", _stateController)),
                  SizedBox(
                    width: Reponsive_.crosslength * 0.015,
                  ),
                  Expanded(
                      child: Commonwidgets.text_field(
                          TextInputType.text, "Zip", _zipController)),
                ],
              ),
              SizedBox(
                height: Reponsive_.crosslength * 0.04,
              ),
              GestureDetector(
                onTap: (){
                  onBack(context);
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      vertical: Reponsive_.crosslength * 0.015),
                  decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: InterText(
                    text: "SAVE & CLOSE",
                    color: Colors.white,
                    fontSize: Reponsive_.crosslength * 0.02,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: Reponsive_.crosslength * 0.02,
              ),
            ],
          ),
        ),
        context: context);
  }

  void edit_contact_info_bottomsheet() {
    showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    backgroundColor: AppColors.white,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          setState(() {});
          return Padding(
            padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const ContactInfoBottomSheetLayout());
        },
      );
    },
  );
  }
}

class ContactInfoBottomSheetLayout extends StatefulWidget {
  const ContactInfoBottomSheetLayout({super.key});

  @override
  State<ContactInfoBottomSheetLayout> createState() =>
      _ContactInfoBottomSheetLayoutState();
}

class _ContactInfoBottomSheetLayoutState
    extends State<ContactInfoBottomSheetLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("bottomsheet called");
    AboutScreen.ContactInfoModelList.add(ContactInfoModel(
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController()));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Reponsive_.crosslength*0.8,
        padding: EdgeInsets.only(
          left: Reponsive_.h * 0.02,
          right: Reponsive_.h * 0.02,),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    width: 100,
                    height: 5,
                    color: AppColors.yallow,
                  ),
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
            SizedBox(height: Reponsive_.h * 0.03,),
            InterText(
              text: ' Contact Info',
              fontWeight: FontWeight.w700,
              fontSize: Reponsive_.crosslength * 0.025,
              color: Colors.black,
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.02,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: AboutScreen.ContactInfoModelList.length,
                itemBuilder: (context, index) {
                  ContactInfoModel model =
                  AboutScreen.ContactInfoModelList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Commonwidgets.text_field(
                          TextInputType.text, "Name", model._nameController),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.01,
                      ),
                      Commonwidgets.text_field(TextInputType.text, "Position",
                          model._positionController),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.01,
                      ),
                      Commonwidgets.text_field(TextInputType.text, "Number",
                          model._numberController),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.01,
                      ),
                      Commonwidgets.text_field(
                          TextInputType.text, "Email", model._emailController),
                      SizedBox(
                        height: Reponsive_.crosslength * 0.01,
                      ),
                      if (index != AboutScreen.ContactInfoModelList.length-1) ...{
                        MySeparator(
                          color: AppColors.blue,
                          height: 2,
                        ),
                        SizedBox(
                          height: Reponsive_.crosslength * 0.01,
                        ),
                      },

                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: Reponsive_.crosslength * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(left: Reponsive_.crosslength*0.02),
              child: InkWell(
                onTap: () {
                  AboutScreen.ContactInfoModelList.add(ContactInfoModel(
                      TextEditingController(),
                      TextEditingController(),
                      TextEditingController(),
                      TextEditingController()));
                  setState(() {});
                },
                child: InterText(
                  text: '+ Add Contact',
                  fontWeight: FontWeight.w400,
                  fontSize: Reponsive_.crosslength * 0.02,
                  color: AppColors.blue,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all( Reponsive_.crosslength*0.02),
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                  vertical: Reponsive_.crosslength * 0.015),
              decoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(50)),
              child: InterText(
                text: "SAVE & CLOSE",
                color: Colors.white,
                fontSize: Reponsive_.crosslength * 0.02,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ));
  }
}

class ContactInfoModel {
  TextEditingController _nameController;
  TextEditingController _positionController;
  TextEditingController _numberController;
  TextEditingController _emailController;

  ContactInfoModel(this._nameController, this._positionController,
      this._numberController, this._emailController);
}
