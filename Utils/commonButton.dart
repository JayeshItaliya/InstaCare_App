import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/interText.dart';

class CommonButton extends StatefulWidget {
  String text;
  Function onTap;
  double? height;
  double? width;
  Color? color;
    CommonButton({Key? key,required this.text,required this.onTap,this.height,this.width,this.color}) : super(key: key);

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onTap();
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: Reponsive_.crosslength*0.018,),
        width:widget.width??MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color:widget.color??AppColors.buttonColor,
          borderRadius: BorderRadius.circular(30)
        ),
        child: InterText(
          text: widget.text,
          color: AppColors.white,
          fontWeight: FontWeight.w700,
          fontSize: Reponsive_.px18,
        ),
      ),
    );
  }
}
