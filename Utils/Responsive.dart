import 'dart:math';
import 'package:flutter/cupertino.dart';

class Reponsive_{
  static double h=0,w=0,crosslength=0;
  static double px10=0,px12=0,px14=0,px16=0,px18=0,px24=0,px30=0;

  static void init(BuildContext context){
    h=MediaQuery.of(context).size.height;
    w=MediaQuery.of(context).size.width;
    crosslength=pow((h*h)+(w*w),1/2) as double;

    px10=Reponsive_.crosslength*0.010;
    px12=Reponsive_.crosslength*0.013;
    px14=Reponsive_.crosslength*0.014;
    px16=Reponsive_.crosslength*0.016;
    px18=Reponsive_.crosslength*0.018;
    px24=Reponsive_.crosslength*0.022;
    px30=Reponsive_.crosslength*0.03;
  }
}