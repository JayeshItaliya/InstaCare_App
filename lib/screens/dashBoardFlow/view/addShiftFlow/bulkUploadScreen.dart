import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/controller/bulkUplodeController.dart';
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/shiftDetials.dart';



class BulkUploadScreen extends StatefulWidget {
  const BulkUploadScreen({Key? key}) : super(key: key);

  @override
  State<BulkUploadScreen> createState() => _BulkUploadScreenState();
}

class _BulkUploadScreenState extends State<BulkUploadScreen> {
  final cx=Get.put(CommonController());
  final bulkUplodeController=Get.put(BulkUplodeController());
  String uplodeExcleFile="";
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return ListView(
      padding: padding,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(30)
          ),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InterText(
                text: "Please upload the excel sheet",
                fontSize: Reponsive_.px16,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10,),
              InkWell(
                child: Image.asset(AppAssets.uploadeExcel),
                onTap: (){
                  openFilePicker().then((value) {
                   setState(() {
                     uplodeExcleFile=value.toString();
                   });
                    print(value);
                  });
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
                    text: 'UPLOAD FILE',
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: Reponsive_.px18,
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
                            fontSize: Reponsive_.px12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blue,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InterText(
                            text: "Confirmation",
                            fontWeight: FontWeight.w700,
                            fontSize: Reponsive_.px30,
                            color: AppColors.deepGreen,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InterText(
                            text: "Great, would you like to post this shift?",
                            fontWeight: FontWeight.w400,
                            fontSize: Reponsive_.px16,
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
                                          fontSize: Reponsive_.px18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      onTap: (){
                                        bulkUplodeController.uplodeExcle(uplodeExcleFile,context);
                                        onBack(context);
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
                                        fontSize: Reponsive_.px18,
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
  Future<String?> openFilePicker() async {
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
      return path;
    } else {
      print("No Data");
    }
    return "no data";
  }
}
