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
  late double labelWidth;
  EdgeInsetsGeometry labelMargin = EdgeInsets.only(left: 30,top: 20);
  BoxBorder labelBorder = Border.symmetric(vertical: BorderSide.none);
  double labelFontsize = 16;
  Duration duration = Duration(milliseconds: 300);

  @override
  initState(){
    labelWidth = (widget.hintText.length*9.5);
    super.initState();
  }

  void initiateAnimation(){
    print("initiating animation");
    if(!AnimationState){
      AnimationState = true;
      setState((){
        labelHight = 20;
        labelWidth = (widget.hintText.length*8);
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
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 1,spreadRadius: 1,offset: Offset(2,2))],
              color: Color.fromRGBO(36, 118, 130, 1)
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
              alignment: Alignment.centerLeft,
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
