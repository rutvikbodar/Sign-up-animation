import 'package:flutter/material.dart';

class Animated_textfield extends StatefulWidget {
  const Animated_textfield({Key? key}) : super(key: key);

  @override
  State<Animated_textfield> createState() => _Animated_textfieldState();
}

class _Animated_textfieldState extends State<Animated_textfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 250,
      color: Colors.red,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white,style: BorderStyle.solid,width: 2,),
              borderRadius: BorderRadius.circular(15)
            ),
            padding: EdgeInsets.only(left: 20),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "First Name",
              ),
              textAlign: TextAlign.left,
              onTap: (){
                print("Tapped on the first name");
              },
            ),
          )
        ],
      ),
    );
  }
}
