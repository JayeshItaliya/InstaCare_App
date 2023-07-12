import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:get/get.dart';
import 'package:instacare/helper/date_conveter.dart';
import 'package:instacare/model/newsModel.dart';
import 'package:instacare/screens/dashBoardFlow/view/newsFlow/controller/newsController.dart';
class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  final cx=Get.put(CommonController());
  final newsController=Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title: MontserratText(
          text: "News",
          fontSize: Reponsive_.px24,
          fontWeight: FontWeight.w700,
          color: AppColors.blue,
        ),
        trailingIcon: [
           Padding(
             padding: const EdgeInsets.only(right: 10),
             child: Image.asset(AppAssets.bell,height: 30,width: 30,),
           )
        ],
      ),
      body: Obx(() =>newsController.loadingData.value==true?Center(child: CircularProgressIndicator(backgroundColor: AppColors.buttonColor,)):
      ListView.builder(
        shrinkWrap: true,
        itemCount: newsController.newsListModel.length,
        itemBuilder: (context,index){
          NewsListModel newsModel=newsController.newsListModel[index];
          return Container(
            margin:   EdgeInsets.only(top: Reponsive_.crosslength*0.01,),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InterText(
                  text: newsModel.title,
                  fontSize: Reponsive_.px16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blue,
                ),
                SizedBox( height: 10),
                InterText(
                  text: newsModel.description,
                  fontSize: Reponsive_.px14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.hintTextGrey,
                  maxLines: 3,
                ),
                SizedBox( height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InterText(
                      text: newsModel.addedBy.fullname,
                      fontSize: Reponsive_.px14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                    InterText(
                      text: DateConverter.newsDateConvetr(newsModel.updatedAt),
                      fontSize: Reponsive_.px10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ],
                )
              ],
            ),
          );
        },
        padding: EdgeInsets.only(left: Reponsive_.crosslength*0.02,right: Reponsive_.crosslength*0.02,bottom: Reponsive_.crosslength*0.02),
      )
      ),
    );
  }
}
