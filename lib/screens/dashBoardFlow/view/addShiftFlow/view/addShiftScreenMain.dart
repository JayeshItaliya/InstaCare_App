import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/controller/recurringShiftController.dart';
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/controller/singleShiftController.dart';
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/view/bulkUploadScreen.dart';
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/view/recurringShiftsScreen.dart';
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/view/singleShiftScreen.dart';


class AddShiftScreen extends StatefulWidget {
  const AddShiftScreen({Key? key}) : super(key: key);

  @override
  State<AddShiftScreen> createState() => _AddShiftScreenState();
}

class _AddShiftScreenState extends State<AddShiftScreen> with TickerProviderStateMixin {
  final recurringShiftController = Get.put(RecurringShiftController());
  final singleShiftController = Get.put(SingleShiftController());
  late TabController controller;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3 , vsync: this);
    controller.addListener(() {
      setState(() {
        selectedIndex = controller.index;
      });
      print("Selected Index: " + controller.index.toString());
    });
    singleShiftController.selectedFacility.value="Select Facility";
    singleShiftController.selectRoleValue.value = "Select Role";
    singleShiftController.selectedNumberOfPosition.value = "01";
    recurringShiftController.selectedFacility.value="Select Facility";
    recurringShiftController.selectRoleValue.value = "Select Role";
    recurringShiftController.selectedNumberOfPosition.value = "01";
  }
  final cx=Get.put(CommonController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 2,
          shadowColor: AppColors.backGroundColor,
          centerTitle: true,
          leading: InkWell(
              child: const Icon(Icons.arrow_back,color: AppColors.black),
            onTap: (){
                Navigator.of(context).pop();
            },
          ),
          title: MontserratText(
            text: "Add Shift",
            fontSize: Reponsive_.px24,
            fontWeight: FontWeight.w700,
            color: AppColors.blue,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                AppAssets.bell,
                width: 30,
                height: 30,
              ),
            ),
          ],

        ),
        body: Column(
          children: [

            Container(
              width: cx.width,
              height: Reponsive_.crosslength/17,
              color: AppColors.white,
              child: TabBar(
                indicatorColor: AppColors.blue,
                controller: controller,
                indicatorPadding: EdgeInsets.only(top: 20),
                onTap: (value){
                  selectedIndex=value;
                  print(selectedIndex);
                },
                tabs: [
                  InterText(
                    text: "Single Shift",
                    fontSize: Reponsive_.px16 ,
                    fontWeight: FontWeight.w600,
                    color:selectedIndex==0?AppColors.blue:AppColors.hintTextGrey,
                  ),
                  InterText(
                    text: "Recurring Shifts",
                    fontSize: Reponsive_.px16 ,
                    fontWeight: FontWeight.w600,
                    color:selectedIndex==1?AppColors.blue:AppColors.hintTextGrey,
                  ),
                  InterText(
                    text: "Bulk Upload",
                    fontSize: Reponsive_.px16 ,
                    fontWeight: FontWeight.w600,
                    color:selectedIndex==2?AppColors.blue:AppColors.hintTextGrey,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 20,
              child: TabBarView(
                controller: controller,
                children: const [
                  SingleShiftScreen(),
                  RecurringShiftsScreen(),
                  BulkUploadScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
