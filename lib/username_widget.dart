import 'package:flutter/material.dart';
import 'package:loginanimation/typing_text_widget.dart';

class username_widget extends StatefulWidget {
  const username_widget({Key? key}) : super(key: key);

  @override
  State<username_widget> createState() => _username_widgetState();
}

class _username_widgetState extends State<username_widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset("assets/username.png"),),
          Container(margin:EdgeInsets.only(bottom: 8,top: 10),height:100,width:300,child: typing_text_widget(size: 20, text: "The username must be unique.\nit can not be changed afterwards, so please choose wisely!",gredient: LinearGradient(colors: [Color.fromRGBO(198, 255, 221, 1),Color.fromRGBO(251, 215, 134, 1),Color.fromRGBO(247, 121, 125,1)]))),
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(245, 241, 233,1),border: Border.all(color: Colors.cyan,width: 2,style: BorderStyle.solid),borderRadius: BorderRadius.circular(30)),
            width: 300,
            child: const TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(border: InputBorder.none),
              style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w900,fontSize: 22),
            ),
          ),
          Align(alignment: Alignment.bottomRight,child: Container(margin : EdgeInsets.only(bottom: 30,right: 30,top: 15),child : IconButton(onPressed: null, icon: Icon(Icons.check_circle_outline,color: Colors.white,size: 40,))))
        ],
      ),
    );
  }
}
