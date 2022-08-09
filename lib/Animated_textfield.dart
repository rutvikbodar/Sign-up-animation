import 'dart:core';

import 'package:flutter/material.dart';
class Animated_textfield extends StatefulWidget {
  const Animated_textfield({Key? key}) : super(key: key);

  @override
  State<Animated_textfield> createState() => _Animated_textfieldState();
}

class _Animated_textfieldState extends State<Animated_textfield> {
  double labelHight = 30;
  double labelWidth = 104;
  EdgeInsetsGeometry labelMargin = EdgeInsets.only(left: 30,top: 20);
  double labelFontsize = 18;

  void initiateAnimation(){
    setState((){
      labelHight = 20;
      labelWidth = 70.66;
      labelMargin = EdgeInsets.only(left: 20,top: 5);
      labelFontsize = 12;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 250,
      color: Colors.red,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white,style: BorderStyle.solid,width: 2,),
              borderRadius: BorderRadius.circular(15)
            ),
            padding: EdgeInsets.only(left: 40,top: 5),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.white,fontSize: 20),
              textAlign: TextAlign.left,
              onTap: (){
                print("Tapped on the first name");
                initiateAnimation();
              },
            ),
          ),
          Container(
            height: labelHight,
            width: labelWidth,
            margin: labelMargin,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.symmetric(vertical: BorderSide(color: Colors.white,width: 2))
            ),
            padding: EdgeInsets.only(left: 2,right: 2),
            child: Text(
              "First name",
              style: TextStyle(
                color: Colors.white,
                fontSize: labelFontsize,
              ),
            ),
          )
        ],
      ),
    );
  }
}
