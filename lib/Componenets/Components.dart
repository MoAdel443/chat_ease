
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget txt (String txt,Color color, double fontSize,FontWeight fontWeight ,{double height = 1.5}){
  return Text(
    txt,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,

    ),
  );

}
