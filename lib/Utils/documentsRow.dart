import 'package:flutter/material.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/interText.dart';

class DocumentsRow extends StatefulWidget {
  String? documentText;
  String? documentButtonText;
  Color? buttonColor;
  bool? addButton;
  Function onTap;
    DocumentsRow({Key? key,this.buttonColor,this.documentButtonText,this.documentText,this.addButton,required this.onTap}) : super(key: key);

  @override
  State<DocumentsRow> createState() => _DocumentsRowState();
}

class _DocumentsRowState extends State<DocumentsRow> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InterText(
          text: widget.documentText,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        GestureDetector(
          onTap: (){
            widget.onTap();
          },
          child: Container(
            height: 24,
            width: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color:widget.buttonColor ,
                borderRadius: BorderRadius.circular(12)
            ),
            child:widget.addButton==true?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add,size: 12,color: AppColors.white),
                InterText(
                  text: widget.documentButtonText,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                )
              ],
            ):InterText(
              text: widget.documentButtonText,
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }
}
