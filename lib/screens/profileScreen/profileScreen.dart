import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonContainer.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/screens/profileScreen/profileController.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    double toHeight = MediaQuery.of(context).size.height;
    double toWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: CommonAppBar(
        title: "Profile",
        trailingIcon: [
          IconButton(
            icon: const Icon(Icons.notification_add_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 20,
        ),
        children: [
          Container(
            width: toWidth,
            height: toHeight / 3,
            decoration: const BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
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
                      height: toHeight / 7,
                      width: toWidth / 4.1,
                      decoration: const BoxDecoration(
                          color: AppColors.yallow,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 9, right: 6, left: 6),
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBZa08soLdNnqwzni7bfVgNZYGz5-Oe25ZyA&usqp=CAU",
                                      scale: 2.2))),
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
                SizedBox(
                  height: toHeight / 21,
                ),
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
          ),
          SizedBox(
            height: toHeight / 30,
          ),
          CommonContainer(
            width: toWidth,
            height: toHeight / 2.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterTextCommon(
                        text: "Account Information",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue,
                      ),
                      InkWell(
                        child: Image.asset(
                          AppAssets.profileEdit,
                          height: 30,
                          width: 30,
                        ),
                        onTap: () {
                          CommonBottonSheet(
                             childView: Column(
                               children: [
                                 
                               ],
                             )
                          );
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterTextCommon(
                        text: "Screen Name",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterTextCommon(
                        text: "Joel Newman",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterTextCommon(
                              text: "First Name",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterTextCommon(
                              text: "Joel",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InterTextCommon(
                              text: "Last Name",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterTextCommon(
                              text: "Newman ",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterTextCommon(
                        text: "Email",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterTextCommon(
                        text: "joelnewman@gmail.com ",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterTextCommon(
                        text: "Phone",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterTextCommon(
                        text: "8888888888",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CommonContainer(
            width: toWidth,
            height: toHeight / 2.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterTextCommon(
                        text: "Address",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue,
                      ),
                      InkWell(
                        child: Image.asset(
                          AppAssets.profileEdit,
                          height: 30,
                          width: 30,
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterTextCommon(
                        text: "Screen Name",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterTextCommon(
                        text: "Joel Newman",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterTextCommon(
                              text: "Country",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterTextCommon(
                              text: "United States",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InterTextCommon(
                              text: "City",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterTextCommon(
                              text: "Skokie",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InterTextCommon(
                              text: "State",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterTextCommon(
                              text: "illinois",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InterTextCommon(
                              text: "Zip",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            InterTextCommon(
                              text: "60077",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CommonContainer(
            width: toWidth,
            height: toHeight / 3.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterTextCommon(
                        text: "Address",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue,
                      ),
                      InkWell(
                        child: Image.asset(
                          AppAssets.profileEdit,
                          height: 30,
                          width: 30,
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterTextCommon(
                        text: "Time Zone",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterTextCommon(
                        text: "Central Time (US/Can) (GMT-6:00)",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterTextCommon(
                        text: "Language",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                      InterTextCommon(
                        text: "English",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CommonContainer(
            width: toWidth,
            height: toHeight / 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterTextCommon(
                        text: "Security",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InterTextCommon(
                        text: "Change Password",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CommonContainer(
            width: toWidth,
            height: toHeight / 3.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InterTextCommon(
                        text: "Notifications",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue,
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: profileController.switchValues.length,
                    itemBuilder: (context, index) {
                      return Obx(() => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InterTextCommon(
                                  text: profileController.switchName[index],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                                FlutterSwitch(
                                  activeText: "",
                                  inactiveText: "",
                                  width: 50.0,
                                  height: 30.0,
                                  activeColor: AppColors.darkGreen,
                                  inactiveColor:
                                      Color.fromRGBO(217, 217, 217, 1),
                                  toggleSize: 20.0,
                                  value: profileController
                                      .switchValues[index].value,
                                  borderRadius: 50.0,
                                  showOnOff: true,
                                  onToggle: (val) async {
                                    profileController.toggleSwitch(index, val);
                                  },
                                )
                              ],
                            ),
                          ));
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
