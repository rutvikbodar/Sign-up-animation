import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loginanimation/email_widget.dart';
import 'package:loginanimation/meta_containers.dart';
import 'package:loginanimation/preference_widget.dart';
import 'package:loginanimation/profile_photo_widget.dart';
import 'package:loginanimation/username_widget.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> with SingleTickerProviderStateMixin{
  bool isemailset = true;
  bool isusernameset = true;
  bool isdpset = true;
  bool isprofileconfigured = true;
  bool isexpanded = false;
  int childnumber = 0;
  int margin = 240;
  late double seriously_opacity;
  late AnimationController _controller;
  late Animation<double> _animation;
  Widget active_widget = Container();
  @override
  initState(){
    _controller = AnimationController(duration: Duration(seconds: 2), vsync: this,);
    _animation = Tween<double>(begin: 0.0,end: 240).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
    seriously_opacity = 0;
  }
  double h = 90;
  double w = 90;
  void toggle(){
    print("old h : "+h.toString());
    if(h == 90){
      setState((){
        h=460;
        w=360;
      });
    }
    else{
      setState((){
        h=90;
        w=90;
      });
    }
    if(isexpanded) {
      isexpanded=false;
    } else {
      isexpanded=true;
    }
  }
  void childprovider(int n){
    if(n==1){
      print("first child");
      childnumber = 1;
      toggle();
    }
    else if(n==2){
      print("second child");
      childnumber = 2;
      toggle();
    }
    else if(n==3){
      print("third child");
      childnumber = 3;
      toggle();
    }
    else{
      print("4th child");
      childnumber = 4;
      toggle();
    }
    popupchild();
  }

   void popupchild(){
    active_widget = Container();
    print("started waiting");
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      print("waiting finished");
      if(childnumber==1){
        active_widget = email_widget();
      }
      else if(childnumber==2){
        active_widget= username_widget();
      }
      else if(childnumber==3){
        active_widget= profile_photo_widget();
      }
      else{
        active_widget= preference_widget();
      }
      setState((){});
    });
   }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Stack(
              children: [
                GestureDetector(child: Container(color: Color.fromRGBO(36, 33, 50, 1)),
                  onTap: (){
                    if(isexpanded){
                      setState((){
                        active_widget=Container();
                        toggle();
                      }
                    );
                  }
                }),
                meta_containers(alignment: Alignment.center,img: Image.asset("assets/email.png"),n: 1,f: childprovider,top: _animation.value),
                meta_containers(alignment: Alignment.center,img: Image.asset("assets/username.png"),n: 2,f: childprovider,right: _animation.value,),
                meta_containers(alignment: Alignment.center,img: Image.asset("assets/dp.png"),n: 3,f: childprovider,bottom: _animation.value,),
                meta_containers(alignment: Alignment.center,img: Image.asset("assets/preference.png",),n: 4,f: childprovider,left: _animation.value,),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if(isemailset && isusernameset && isdpset && isprofileconfigured){
                        print("all are configured");
                      }
                      else{
                        print(isemailset);
                        print(isusernameset);
                        print(isdpset);
                        print(isprofileconfigured);
                      }
                    },
                    child: AnimatedContainer(
                      curve: Curves.easeOut,
                      duration: Duration(milliseconds: 200),
                      height: h,
                      width: w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(45),color: Color.fromRGBO(36, 118, 130, 1),boxShadow: [BoxShadow(color: Color.fromRGBO(174, 140, 250, 1),spreadRadius: 1,blurRadius: 1)]),
                      child: active_widget,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
