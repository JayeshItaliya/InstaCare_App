import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/notifactionFlow/view/notificationScreen.dart';


class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? icon;

  final List<Widget>? trailingIcon;
  CommonAppBar({
    Key? key,
    this.title,
    this.trailingIcon,
    this.icon,
  }) : super(key: key);

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CommonAppBarState extends State<CommonAppBar> {
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return AppBar(
      backgroundColor: AppColors.white,
      centerTitle: true,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: widget.icon ??
            InkWell(
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                }),
      ),
      leadingWidth: Reponsive_.crosslength/30,
      title: widget.title,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
              child: Image.asset(AppAssets.bell,height: 22,width: 22,),
            onTap: (){
                toPushNavigator(context: context, PageName: NotificationScreen());
            },
          ),
        ),
      ],
    );
  }
}
