import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonDrawerModel.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/view/dashBoardMainScreen.dart';
import 'package:instacare/screens/profileFlow/view/profileScreen.dart';
import 'package:instacare/screens/scheduleFlow/scheduleScreen.dart';



class CommonDrawer extends StatefulWidget {
  Function? onItemClick;
  CommonDrawer({this.onItemClick,Key? key}) : super(key: key);

  @override
  State<CommonDrawer> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  @override
  void initState() {
    status = statusValue[0].toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20.w, top: 25.h, right: 10.w),
        decoration: const BoxDecoration(
          color: AppColors.blue,
          // borderRadius: BorderRadius.only(
          //   topRight: Radius.circular(20),
          //   bottomRight: Radius.circular(20),
          // ),
        ),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.clear,
                    color: AppColors.white,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    toPushNavigator(
                        context: context, PageName: const ProfileScreen());
                  },
                  child: Container(
                    alignment: Alignment.bottomRight,
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                            fit: BoxFit.fitHeight),
                        border: Border.all(width: 5, color: AppColors.yallow)),
                    child: Image.asset(
                      AppAssets.profileEdit,
                      height: 30.h,
                      width: 30.w,
                    ),
                  ),
                ),
                Gap(25.w),
                Column(
                  children: [
                    InterText(
                      text: 'Joel\nNewman',
                      maxLines: 2,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ),
                    Gap(5.w),
                    InterText(
                      text: 'Instacare Staff',
                      color: AppColors.buttonColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    )
                  ],
                ),
              ],
            ),
            Gap(20.w),
            Row(
              children: [
                InterText(
                  text: 'Status: ',
                  color: AppColors.buttonColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
                Gap(8.w),
                Container(
                  width: 15.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: status.toString().contains("Available")
                        ? Color.fromRGBO(126, 230, 155, 1)
                        : status.toString().contains("Away")
                            ? AppColors.yallow
                            : status.toString().contains("Busy")
                                ? Color.fromRGBO(243, 48, 71, 1)
                                : status.toString().contains("DND")
                                    ? Color.fromRGBO(243, 48, 71, 1)
                                    : status.toString().contains("Offline")
                                        ? Color.fromRGBO(196, 196, 196, 1)
                                        : null,
                  ),
                ),
                Gap(8.w),
                InterText(
                  text: status,
                  fontSize: 16,
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                ),
                PopupMenuButton<String>(
                  itemBuilder: (context) {
                    return statusValue.map((str) {
                      return PopupMenuItem(
                        value: str,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 15.w,
                              height: 15.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: str.toString().contains("Available")
                                    ? const Color.fromRGBO(126, 230, 155, 1)
                                    : str.toString().contains("Away")
                                        ? AppColors.yallow
                                        : str.toString().contains("Busy")
                                            ? const Color.fromRGBO(
                                                243, 48, 71, 1)
                                            : str.toString().contains("DND")
                                                ? const Color.fromRGBO(
                                                    243, 48, 71, 1)
                                                : str
                                                        .toString()
                                                        .contains("Offline")
                                                    ? const Color.fromRGBO(
                                                        196, 196, 196, 1)
                                                    : null,
                              ),
                            ),
                            Gap(10.w),
                            InterText(
                              text: str.toString(),
                              color: AppColors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      );
                    }).toList();
                  },
                  icon: Image.asset(AppAssets.dropDown),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0.r))),
                  color: AppColors.blue,
                  onSelected: (v) {
                    setState(() {
                      print('!!!===== $v');
                      status = v;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.6,
                  height: 1.5,
                  color: AppColors.greenDark,
                )
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: DrawerItem.drawerItem.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index == DrawerItem.drawerItem.length - 1) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.6,
                              height: 1.5,
                              color: AppColors.greenDark,
                            )
                          ],
                        ),
                        Gap(10.h),
                        ListTile(
                          leading: SvgPicture.asset(AppAssets.logout),
                          title: InterText(
                            text: "Logout",
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: AppColors.white,
                          ),
                          onTap: () {
                            print("tap casllll");
                          },
                        ),
                        Gap(20.h),
                      ],
                    );
                  }
                  DrawerItem data = DrawerItem.drawerItem[index];
                  return ListTile(
                    leading: SvgPicture.asset(data.image),
                    title: InterText(
                      text: data.name,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: AppColors.white,
                    ),
                    onTap: () {
                      if (widget.onItemClick!=null) {
                        widget.onItemClick!(index);
                        Navigator.of(context).pop();
                      }
                    },
                  );
                })
          ]),
        ));
  }

  List<String> statusValue = ["Available", "Away", "Busy", "DND", "Offline"];
  String status = "";

}
