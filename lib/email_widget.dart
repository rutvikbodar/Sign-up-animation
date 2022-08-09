import 'package:flutter/material.dart';
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
          Align(child: Container(margin : EdgeInsets.only(left: 40,bottom:5,top: 0),child: Text("Email : ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),alignment: Alignment.centerLeft),
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(245, 241, 233,1),border: Border.all(color: Colors.cyan,width: 2,style: BorderStyle.solid),borderRadius: BorderRadius.circular(30)),
            width: 300,
            child: const TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(border: InputBorder.none),
              style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w900,fontSize: 22),
            ),
          ),
          Align(child: Container(margin : EdgeInsets.only(left: 40,bottom:5,top: 20),child: Text("Create Password : ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),alignment: Alignment.centerLeft),
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(245, 241, 233,1),border: Border.all(color: Colors.cyan,width: 2,style: BorderStyle.solid),borderRadius: BorderRadius.circular(30)),
            width: 300,
            child: const TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(border: InputBorder.none),
              style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w900,fontSize: 22,),
              obscureText: true,
            ),
          ),
          Align(child: Container(margin : EdgeInsets.only(left: 40,bottom:5,top: 20),child: Text("Confirm Password : ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),alignment: Alignment.centerLeft),
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(245, 241, 233,1),border: Border.all(color: Colors.cyan,width: 2,style: BorderStyle.solid),borderRadius: BorderRadius.circular(30)),
            width: 300,
            child: const TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(border: InputBorder.none),
              style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w900,fontSize: 22),
              obscureText: true,
            ),
          ),
          Align(alignment: Alignment.bottomRight,child: Container(margin : EdgeInsets.only(bottom: 30,right: 30,top: 15),child : IconButton(onPressed: null, icon: Icon(Icons.check_circle_outline,color: Colors.white,size: 40,))))
        ],
      ),
    );
  }
}
