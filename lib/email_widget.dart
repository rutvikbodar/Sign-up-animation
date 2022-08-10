import 'package:flutter/material.dart';
import 'package:loginanimation/Animated_textfield.dart';
import 'package:loginanimation/typing_text_widget.dart';

class email_widget extends StatefulWidget {
  const email_widget({Key? key}) : super(key: key);

  @override
  State<email_widget> createState() => _email_widgetState();
}

class _email_widgetState extends State<email_widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(margin:EdgeInsets.only(bottom: 8,top: 10),height:50,child: typing_text_widget(size: 20, text: "lets get started,\nshall we?",gredient: LinearGradient(colors: [Color.fromRGBO(198, 255, 221, 1),Color.fromRGBO(251, 215, 134, 1),Color.fromRGBO(247, 121, 125,1)]))),
          Animated_textfield(hintText: "Email",),
          SizedBox(height: 20,),
          Animated_textfield(hintText: "Password"),
          SizedBox(height: 20,),
          Animated_textfield(hintText: "Confirm Password"),
          SizedBox(height: 40,),
          Align(alignment: Alignment.bottomRight,child: Container(margin : EdgeInsets.only(bottom: 10,right: 30,top: 15),child : IconButton(onPressed: null, icon: Icon(Icons.check_circle_outline,color: Colors.white,size: 40,))))
        ],
      ),
    );
  }
}
