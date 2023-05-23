

import 'package:flutter/material.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/interText.dart';

import '../../Utils/montserratText.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double toHeight=MediaQuery.of(context).size.height;
    double toWidth=MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: CommonAppBar(
        title: "Profile",
        trailingIcon:[
          IconButton(
            icon: Icon(Icons.notification_add_outlined),
            onPressed: (){},
          )
        ],
      ),
        body: ListView(
          padding:const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 20,
          ),
          children: [
            Container(
              width:toWidth ,
              height:toHeight/3,
              decoration:const BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16))
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          InterTextCommon(
                            text: "Emp. ID",
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: AppColors.darkGreen,
                          ),
                          InterTextCommon(
                            text: "511",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGreen,
                          )
                        ],
                      ),

                      Container(
                        height: toHeight/7,
                        width: toWidth/4.1,
                        decoration: BoxDecoration(
                          color: AppColors.yallow,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 9,right: 6,left: 6),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBZa08soLdNnqwzni7bfVgNZYGz5-Oe25ZyA&usqp=CAU",scale:2.2)
                              )
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          InterTextCommon(
                            text: "Status",
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: AppColors.darkGreen,
                          ),
                          InterTextCommon(
                            text: "Available",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGreen,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: toHeight/21,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          InterTextCommon(
                            text: "Joel Newman",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                          InterTextCommon(
                            text: "Instacare Staff",
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGreen,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
    );
  }
}
