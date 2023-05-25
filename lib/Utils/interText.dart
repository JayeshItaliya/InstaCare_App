import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InterText extends StatefulWidget {
  String? text;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;
  TextDecoration? textDecoration;
  TextAlign? textAlign;
  double? height;
  List<Shadow>? shadow;
  int? maxLines;
  TextOverflow? textOverflow;
  InterText(
      {Key? key,
        required this.text,
        this.fontSize,
        this.fontWeight,
        this.textDecoration,
        this.color,
        this.textAlign,
        this.height,
        this.shadow,
        this.maxLines,
        this.textOverflow,
      })
      : super(key: key);

  @override
  State<InterText> createState() => _InterTextState();
}

class _InterTextState extends State<InterText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text ?? "",
      textAlign: widget.textAlign,
      maxLines:widget.maxLines ?? 1,
      overflow: widget.textOverflow,
      style: GoogleFonts.inter(
        height: widget.height,
        shadows: widget.shadow ?? [],
        fontSize: widget.fontSize ?? 20,
        fontWeight: widget.fontWeight ?? FontWeight.w700,
        color: widget.color,
        decoration: widget.textDecoration,
        decorationStyle: TextDecorationStyle.solid,
      ),
    );
  }
}

