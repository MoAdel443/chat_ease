
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




Widget button (double width, double height ,Color color ,VoidCallback onPressed, String lable ,Color txtColor){
  return SizedBox(
    width: width,
    height: height,
    child: MaterialButton(
      color: color,
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: txt(lable , txtColor, 16.0, FontWeight.bold),
    ),
  );
}
