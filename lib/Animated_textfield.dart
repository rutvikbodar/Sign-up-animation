import 'dart:core';

import 'package:flutter/material.dart';
class Animated_textfield extends StatefulWidget {
  const Animated_textfield({Key? key}) : super(key: key);

  @override
  State<Animated_textfield> createState() => _Animated_textfieldState();
}

class _Animated_textfieldState extends State<Animated_textfield> {
  double labelHight = 30;
  double labelWidth = 100;
  EdgeInsetsGeometry labelMargin = EdgeInsets.only(left: 30,top: 30);
  double labelFontsize = 18;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 250,
      color: Colors.red,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white,style: BorderStyle.solid,width: 2,),
              borderRadius: BorderRadius.circular(15)
            ),
            padding: EdgeInsets.only(left: 20),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              textAlign: TextAlign.left,
              onTap: (){
                print("Tapped on the first name");
              },
            ),
          ),
          Container(
            height: labelHight,
            width: labelWidth,
            color: Colors.green,
            margin: labelMargin,
            alignment: Alignment.center,
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
