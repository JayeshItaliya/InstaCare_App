import 'dart:math';
import 'package:flutter/cupertino.dart';

class Reponsive_{
  static double h=0,w=0,crosslength=0;

  static void init(BuildContext context){
    h=MediaQuery.of(context).size.height;
    w=MediaQuery.of(context).size.width;
    crosslength=pow((h*h)+(w*w),1/2) as double;
  }
}