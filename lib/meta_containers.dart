import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class meta_containers extends StatefulWidget {
  Alignment alignment;
  double top = 0;
  double right = 0;
  double bottom = 0;
  double left = 0;
  int n;
  Function f;
  Image? img;
  meta_containers({required this.alignment,required this.f,this.img,required this.n,double? top,double? right,double? bottom,double? left}){
    if(top!=null){
      this.top=top;
    }
    if(right!=null){
      this.right=right;
    }
    if(bottom!=null){
      this.bottom=bottom;
    }
    if(left!=null){
      this.left=left;
    }
  }
  @override
  State<meta_containers> createState() => _meta_containersState();
}

class _meta_containersState extends State<meta_containers> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: ()=>widget.f(widget.n),
        child: Container(
          margin: EdgeInsets.fromLTRB(widget.right, widget.bottom, widget.left, widget.top),
          height: 100,
          width: 100,
          decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(50),),
          child: (widget.img==null)?Container():widget.img,
          padding: EdgeInsets.all(0),
        ),
      ),
    );
  }
}
