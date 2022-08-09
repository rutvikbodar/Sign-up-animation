import 'dart:core';

import 'package:flutter/material.dart';
class Animated_textfield extends StatefulWidget {
  String hintText;
  Animated_textfield({Key? key, required this.hintText}) : super(key: key);

  @override
  State<Animated_textfield> createState() => _Animated_textfieldState();
}

class _Animated_textfieldState extends State<Animated_textfield> {
  bool AnimationState = false;
  double labelHight = 30;
  double labelWidth = 104;
  EdgeInsetsGeometry labelMargin = EdgeInsets.only(left: 30,top: 20);
  BoxBorder labelBorder = Border.symmetric(vertical: BorderSide.none);
  double labelFontsize = 18;
  Duration duration = Duration(milliseconds: 300);

  void initiateAnimation(){
    print("initiating animation");
    if(!AnimationState){
      AnimationState = true;
      setState((){
        labelHight = 20;
        labelWidth = 70.66;
        labelMargin = EdgeInsets.only(left: 20,top: 5);
        labelBorder = Border.symmetric(vertical: BorderSide(color: Colors.white,width: 2));
        labelFontsize = 12;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("building widget screen");
    return Container(
      height: 60,
      width: 250,
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
                initiateAnimation();
              },
            ),
          ),
          GestureDetector(
            onTap: ()=>initiateAnimation(),
            child: AnimatedContainer(
              duration: duration,
              height: labelHight,
              width: labelWidth,
              margin: labelMargin,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(36, 118, 130, 1),
                  border: labelBorder,
              ),
              padding: EdgeInsets.only(left: 2,right: 2),
              child: AnimatedDefaultTextStyle(
                duration: duration,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: labelFontsize,
                ),
                child: Text(
                  widget.hintText,
                ),
              )
            ),
          )

        ],
      ),
    );
  }
}
