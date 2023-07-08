import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appColor.dart';



class CommonContainer extends StatefulWidget {
  double? height;
  double? width;
  Widget? child;
  Color? bgcolor;
  double paddingtop,
      paddingbottom,
      paddingright,
      paddingleft,
      padding,
      borderRadius;
  double margintop, marginbottom, marginright, marginleft, margin;

  CommonContainer(
      {Key? key,
      this.child,
      this.bgcolor = Colors.white,
      this.paddingtop = 0,
      this.paddingbottom = 0,
      this.paddingright = 0,
      this.paddingleft = 0,
      this.padding = 0,
      this.margintop = 0,
      this.marginbottom = 0,
      this.marginright = 0,
      this.marginleft = 0,
      this.margin = 0,
      this.borderRadius = 0})
      : super(key: key);

  @override
  State<CommonContainer> createState() => _CommonContainerState();
}

class _CommonContainerState extends State<CommonContainer> {
  @override
  Widget build(BuildContext context) {
    Reponsive_.init(context);

    if (widget.padding != 0) {
      widget.paddingtop = widget.padding;
      widget.paddingbottom = widget.padding;
      widget.paddingleft = widget.padding;
      widget.paddingright = widget.padding;
    }

    if (widget.margin != 0) {
      widget.margintop = widget.margin;
      widget.marginbottom = widget.margin;
      widget.marginleft = widget.margin;
      widget.marginright = widget.margin;
    }
    return Container(
      padding: EdgeInsets.only(
        top: widget.paddingtop == 0
            ? Reponsive_.crosslength * 0.015
            : widget.paddingtop,
        bottom: widget.paddingbottom == 0
            ? Reponsive_.crosslength * 0.015
            : widget.paddingbottom,
        left: widget.paddingleft == 0
            ? Reponsive_.crosslength * 0.015
            : widget.paddingleft,
        right: widget.paddingright == 0
            ? Reponsive_.crosslength * 0.015
            : widget.paddingright,
      ),
      margin: EdgeInsets.only(
          top: widget.margintop == 0
              ? Reponsive_.crosslength * 0.015
              : widget.margintop,
          left: widget.marginleft == 0
              ? Reponsive_.crosslength * 0.015
              : widget.marginleft,
          right: widget.marginright == 0
              ? Reponsive_.crosslength * 0.015
              : widget.marginright,
          bottom: widget.marginbottom == 0 ? 0 : widget.marginbottom),
      decoration: BoxDecoration(
          color: widget.bgcolor,
          borderRadius: BorderRadius.circular(widget.borderRadius == 0
              ? Reponsive_.crosslength * 0.015
              : widget.borderRadius)),
      child: widget.child,
    );
  }
}
