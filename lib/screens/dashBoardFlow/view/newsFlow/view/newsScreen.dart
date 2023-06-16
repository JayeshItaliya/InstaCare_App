import 'package:flutter/material.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:get/get.dart';
class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final cx=Get.put(CommonController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title: MontserratText(
          text: "News",
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.blue,
        ),
        trailingIcon: [
           Padding(
             padding: const EdgeInsets.only(right: 10),
             child: Image.asset(AppAssets.bell,height: 30,width: 30,),
           )
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: newsList.length,
        itemBuilder: (context,index){
          NewsModel newsModel=newsList[index];
          return Container(
            width: cx.width,
            height: cx.height/5,
            margin: const EdgeInsets.only(top: 10,bottom: 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InterText(
                  text: newsModel.headerNews,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blue,
                ),
                SizedBox( height: 10),
                InterText(
                  text: newsModel.newDisp,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.hintTextGrey,
                  maxLines: 2,
                ),
                SizedBox( height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InterText(
                      text: newsModel.newAutherName,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                    InterText(
                      text: newsModel.newsTime,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ],
                )
              ],
            ),
          );
        },
        padding: padding,

      ),
    );
  }
  List<NewsModel> newsList=[
    NewsModel(
      headerNews: "Print office #1 out of action",
      newDisp: "Hi all,Just a quick note that print office number one is currently out of action. Please use the print office at location #2",
      newAutherName: "Rossy Clantoriya",
      newsTime: "March 8, 2023  11:45AM"
    ),
    NewsModel(
        headerNews: "Print office #1 out of action",
        newDisp: "Hi all,Just a quick note that print office number one is currently out of action. Please use the print office at location #2",
        newAutherName: "Rossy Clantoriya",
        newsTime: "March 8, 2023  11:45AM"
    ),
    NewsModel(
        headerNews: "Print office #1 out of action",
        newDisp: "Hi all,Just a quick note that print office number one is currently out of action. Please use the print office at location #2",
        newAutherName: "Rossy Clantoriya",
        newsTime: "March 8, 2023  11:45AM"
    ),
    NewsModel(
        headerNews: "Print office #1 out of action",
        newDisp: "Hi all,Just a quick note that print office number one is currently out of action. Please use the print office at location #2",
        newAutherName: "Rossy Clantoriya",
        newsTime: "March 8, 2023  11:45AM"
    ),
    NewsModel(
        headerNews: "Print office #1 out of action",
        newDisp: "Hi all,Just a quick note that print office number one is currently out of action. Please use the print office at location #2",
        newAutherName: "Rossy Clantoriya",
        newsTime: "March 8, 2023  11:45AM"
    ),
    NewsModel(
        headerNews: "Print office #1 out of action",
        newDisp: "Hi all,Just a quick note that print office number one is currently out of action. Please use the print office at location #2",
        newAutherName: "Rossy Clantoriya",
        newsTime: "March 8, 2023  11:45AM"
    ),
    NewsModel(
        headerNews: "Print office #1 out of action",
        newDisp: "Hi all,Just a quick note that print office number one is currently out of action. Please use the print office at location #2",
        newAutherName: "Rossy Clantoriya",
        newsTime: "March 8, 2023  11:45AM"
    ),
    NewsModel(
        headerNews: "Print office #1 out of action",
        newDisp: "Hi all,Just a quick note that print office number one is currently out of action. Please use the print office at location #2",
        newAutherName: "Rossy Clantoriya",
        newsTime: "March 8, 2023  11:45AM"
    ),
    NewsModel(
        headerNews: "Print office #1 out of action",
        newDisp: "Hi all,Just a quick note that print office number one is currently out of action. Please use the print office at location #2",
        newAutherName: "Rossy Clantoriya",
        newsTime: "March 8, 2023  11:45AM"
    ),
    NewsModel(
        headerNews: "Print office #1 out of action",
        newDisp: "Hi all,Just a quick note that print office number one is currently out of action. Please use the print office at location #2",
        newAutherName: "Rossy Clantoriya",
        newsTime: "March 8, 2023  11:45AM"
    ),
    NewsModel(
        headerNews: "Print office #1 out of action",
        newDisp: "Hi all,Just a quick note that print office number one is currently out of action. Please use the print office at location #2",
        newAutherName: "Rossy Clantoriya",
        newsTime: "March 8, 2023  11:45AM"
    ),
  ];
}

class NewsModel{
  String? headerNews;
  String? newDisp;
  String? newAutherName;
  String? newsTime;

  NewsModel({this.headerNews,this.newAutherName,this.newDisp,this.newsTime});
}
