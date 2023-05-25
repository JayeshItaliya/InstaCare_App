import 'package:flutter/material.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/interText.dart';
import 'package:instacare/Utils/montserratText.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? icon;

  final List<Widget>? trailingIcon;
    CommonAppBar({Key? key,this.title,this.trailingIcon,this.icon,}) : super(key: key);

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      centerTitle: true,
      elevation: 8,
      leading:widget.icon??Icon(Icons.arrow_back,color: Colors.black,),
      leadingWidth: 30,
      title: MontserratText(
        text: widget.title,
        fontWeight: FontWeight.bold,
      ),
      actions: widget.trailingIcon,
    );
  }
}
