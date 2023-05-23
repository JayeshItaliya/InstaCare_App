import 'package:flutter/material.dart';

/// Get To
toPushNavigator({context, PageName}){
  Navigator.push(context, MaterialPageRoute(builder: (context) => PageName));
}

/// Get offAll
offNavigator({context, PageName}){
  Navigator.removeRoute(context, MaterialPageRoute(builder: (context) => PageName));
}