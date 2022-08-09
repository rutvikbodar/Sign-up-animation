import 'package:flutter/material.dart';

class typing_text_widget extends StatefulWidget {
  bool firstbuilt = true;
  double size;
  String text;
  typing_text_widget({required this.size,required this.text,required this.gredient});
  String temp_text = "";
  Gradient gredient;

  @override
  State<typing_text_widget> createState() => _typing_text_widgetState();
}

class _typing_text_widgetState extends State<typing_text_widget> {
  void initiate() async{
    for(int i = 0; i < widget.text.length; i++){
      await Future.delayed(Duration(milliseconds: 20)).then((value) async {
        widget.temp_text+=widget.text[i];
        setState((){});
        widget.temp_text+="_";
        await Future.delayed(Duration(milliseconds: 20));
        setState((){});
        widget.temp_text=widget.temp_text.substring(0,widget.temp_text.length-1);
        await Future.delayed(Duration(milliseconds: 20));
        setState((){});
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    if(widget.firstbuilt){
      initiate();
      widget.firstbuilt = false;
    }
    return Container(
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => widget.gredient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height),),
          child: Text(widget.temp_text,style: TextStyle(color: Colors.white,fontSize: widget.size,fontWeight: FontWeight.w900,),)),
    );
  }
}
