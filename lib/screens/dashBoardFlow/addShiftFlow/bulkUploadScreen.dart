import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/addShiftFlow/shiftDetials.dart';

class BulkUploadScreen extends StatefulWidget {
  const BulkUploadScreen({Key? key}) : super(key: key);

  @override
  State<BulkUploadScreen> createState() => _BulkUploadScreenState();
}

class _BulkUploadScreenState extends State<BulkUploadScreen> {
  final cx=Get.put(CommonController());
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: cx.height/3.5,
          width: cx.width,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(30)
          ),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InterText(
                text: "Please upload the excel sheet",
                fontSize: 16,
                color: AppColors.black,
                 fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10,),
              InkWell(
                  child: Image.asset(AppAssets.uploadeExcel),
                onTap: (){
                  openFilePicker();
                },
              ),
              SizedBox(height: 10,),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: cx.width,
                  height: cx.height/12,
                  decoration:BoxDecoration(
                    color: AppColors.buttonColor,
                   borderRadius: BorderRadius.circular(30)
                  ),
                  child: InterText(
                    text: 'Upload File',
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                onTap: (){
                  CommonBottonSheet(
                    context: context,
                    childView: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        InterText(
                          text: "Shift Detail",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.blue,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InterText(
                          text: "Confirmation",
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: AppColors.deepGreen,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InterText(
                          text: "Great, would you like to post this shift?",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.black,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8),
                          child: Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: AppColors.buttonColor,
                                        borderRadius: BorderRadius.circular(30)
                                      ),
                                      child: InterText(
                                        text: "YES",
                                        color: AppColors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    onTap: (){
                                      toPushNavigator(context: context,PageName: ShiftDeatils());
                                    },
                                  )
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: AppColors.hintTextGrey,
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: InterText(
                                      text: "No",
                                      color: AppColors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    )
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }
  void openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null) {

      PlatformFile file = result.files.first;
      String? path = file.path;
      print("filePath==>$path");
      if(path!.contains("xlsx")&&path.contains("xls")){
        print('Successful Add The File');
      }
      else{
        print("FormateExecpation");
      }
    } else {
      print("No Data");
    }
  }

}
