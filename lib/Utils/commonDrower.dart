import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/commonDrawerModel.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/Utils/storeToken.dart';
import 'package:instacare/screens/authFlow/controller/chnageStatusController.dart';
import 'package:instacare/screens/authFlow/controller/logoutController.dart';
import 'package:instacare/screens/profileFlow/view/profileScreen.dart';

class CommonDrawer extends StatefulWidget {
  Function? onItemClick;
  CommonDrawer({this.onItemClick, Key? key}) : super(key: key);

  @override
  State<CommonDrawer> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  @override
  void initState() {
    chnageStatusController.status.value = chnageStatusController.statusValue[0].toString();
    super.initState();
  }
  final globalKey = GlobalKey<PopupMenuButtonState>();
  final cx = Get.put(CommonController());
  final logOutController = Get.put(LogOutController());
  final chnageStatusController = Get.put(ChangeStatusController());

  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Container(
        padding: EdgeInsets.only(left: 20.w, top: 25.h, right: 10.w),
        decoration: const BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.clear,
                      color: AppColors.white,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
             Expanded(
               flex: 20,
               child: SingleChildScrollView(
                child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          onBack(context);
                          toPushNavigator(context: context, PageName:   ProfileScreen());
                        },
                        child: Container(
                          alignment: Alignment.bottomRight,
                          width: 100.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image:   DecorationImage(
                                  image: NetworkImage(cx.profileImage.toString()),
                                  fit: BoxFit.fitHeight,
                                 onError: (errDetails,hi){
                                    AssetImage(AppAssets.doctorPhoto);
                                 }
                              ),

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InterText(
                            text:cx.fullName.toString(),
                            maxLines: 2,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 24.sp,
                            textAlign: TextAlign.start,
                          ),
                          Gap(5.w),
                          InterText(
                            text: cx.role,
                            color: AppColors.buttonColor,
                            fontWeight: FontWeight.w600,
                            fontSize: Reponsive_.px16,
                            textAlign: TextAlign.start,
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
                        fontSize: Reponsive_.px16,
                      ),
                      Gap(8.w),
                      Container(
                        width: 15.w,
                        height: 15.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: chnageStatusController.statusValue[int.parse(cx.status)-1].contains("Available")
                              ? Color.fromRGBO(126, 230, 155, 1)
                              : chnageStatusController.statusValue[int.parse(cx.status)-1].contains("Away")
                                  ? AppColors.yallow
                                  : chnageStatusController.statusValue[int.parse(cx.status)-1].contains("Busy")
                                      ? Color.fromRGBO(243, 48, 71, 1)
                                      : chnageStatusController.statusValue[int.parse(cx.status)-1].contains("DND")
                                          ? Color.fromRGBO(243, 48, 71, 1)
                                          : chnageStatusController.statusValue[int.parse(cx.status)-1].contains("Offline")
                                              ? Color.fromRGBO(196, 196, 196, 1)
                                              : null,
                        ),
                      ),
                      Gap(8.w),
                      GestureDetector(
                        onTap: (){
                          globalKey.currentState?.showButtonMenu();
                        },
                        child: InterText(
                          text: chnageStatusController.statusValue[int.parse(cx.status)-1],
                          fontSize: Reponsive_.px16,
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      PopupMenuButton<String>(
                        key: globalKey,
                        itemBuilder: (context) {
                          return chnageStatusController.statusValue.map((str) {
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
                                              : str.contains("Busy")
                                                  ? const Color.fromRGBO(
                                                      243, 48, 71, 1)
                                                  : str.toString().contains("DND")
                                                      ? const Color.fromRGBO(
                                                          243, 48, 71, 1)
                                                      : str.toString().contains("Offline")
                                                          ? const Color.fromRGBO(
                                                              196, 196, 196, 1)
                                                          : null,
                                    ),
                                  ),
                                  Gap(10.w),
                                  InterText(
                                    text: str.toString(),
                                    color: AppColors.white,
                                    fontSize: Reponsive_.px16,
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
                            chnageStatusController.status.value = v;
                            if(chnageStatusController.status.value=="Available"){
                              chnageStatusController.changeStatusValue.value="1";
                              cx.status=1.toString();
                              print(chnageStatusController.changeStatusValue.value);
                              chnageStatusController.changeStatus(context);
                              StorageUtil.setData(StorageUtil.status,cx.status);
                              StorageUtil.getData(StorageUtil.status).then((value)  {
                                cx.status=value.toString();
                                print(cx.status);
                              });
                            }
                           else if(chnageStatusController.status.value=="Away"){
                              chnageStatusController.changeStatusValue.value="2";
                              cx.status=2.toString();
                              print(chnageStatusController.changeStatusValue.value);
                              chnageStatusController.changeStatus(context);
                              StorageUtil.setData(StorageUtil.status,cx.status);
                              StorageUtil.getData(StorageUtil.status).then((value)  {
                                cx.status=value.toString();
                                print(cx.status);
                              });
                            }
                           else if(chnageStatusController.status.value=="Busy"){
                              chnageStatusController.changeStatusValue.value="3";
                              cx.status=3.toString();
                              print(chnageStatusController.changeStatusValue.value);
                              chnageStatusController.changeStatus(context);
                              StorageUtil.setData(StorageUtil.status,cx.status);
                              StorageUtil.getData(StorageUtil.status).then((value)  {
                                cx.status=value.toString();
                                print(cx.status);
                              });
                            }
                           else if(chnageStatusController.status.value=="DND") {
                              chnageStatusController.changeStatusValue.value="4";
                              cx.status=4.toString();
                              print(chnageStatusController.changeStatusValue.value);
                              chnageStatusController.changeStatus(context);
                              StorageUtil.setData(StorageUtil.status,cx.status);
                              StorageUtil.getData(StorageUtil.status).then((value)  {
                                cx.status=value.toString();
                                print(cx.status);
                              });
                            }
                           else if(chnageStatusController.status.value=="Offline"){
                              chnageStatusController.changeStatusValue.value="5";
                              cx.status=5.toString();
                              print(chnageStatusController.changeStatusValue.value);
                              chnageStatusController.changeStatus(context);
                              StorageUtil.setData(StorageUtil.status,cx.status);
                              StorageUtil.getData(StorageUtil.status).then((value)  {
                                cx.status=value.toString();
                                print(cx.status);
                              });
                            }
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
                      itemCount: cx.screens.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        print(DrawerItem.drawerItem.length);
                        DrawerItem data = DrawerItem.drawerItem[index];

                        return Column(
                          children: [
                            ListTile(
                              leading: SvgPicture.asset(cx.image[index]),
                              title: InterText(
                                text: cx.drowerTitle[index],
                                fontWeight: FontWeight.w500,
                                fontSize: Reponsive_.px16,
                                color: AppColors.white,
                              ),
                              onTap: () {
                                if (widget.onItemClick != null) {
                                  widget.onItemClick!(index);
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                            index == cx.drowerTitle.length - 1
                                ? Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width /
                                                1.6,
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
                                          fontSize: Reponsive_.px16,
                                          color: AppColors.white,
                                        ),
                                        onTap: () {
                                          showDialog<void>(
                                            context: context,
                                            barrierDismissible: false, // user must tap button!
                                            builder: (BuildContext context) {
                                              return CupertinoAlertDialog(
                                                title:  Image.asset(AppAssets.app),
                                                content:   const Text("Do You Want Sure LogOut ?"),
                                                actions: [
                                                  CupertinoDialogAction(
                                                    isDefaultAction: true,
                                                    onPressed: (){
                                                      logOutController.logOut(context);
                                                    },
                                                    child: Text("Yes"),
                                                  ),
                                                  CupertinoDialogAction(
                                                    child: Text("No"),
                                                    onPressed: (){
                                                      onBack(context);
                                                    },
                                                  )
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      Gap(20.h),
                                    ],
                                  )
                                : Container()
                          ],
                        );
                      })
                ]),
            ),
             ),
          ],
        ));
  }


}
