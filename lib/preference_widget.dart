import 'package:flutter/material.dart';
import 'package:loginanimation/preference_form_body.dart';

class preference_widget extends StatefulWidget {
  const preference_widget({Key? key}) : super(key: key);
  @override
  State<preference_widget> createState() => _preference_widgetState();
}

class _preference_widgetState extends State<preference_widget> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Alignment> _alignmentanimation;
  late Animation<double> _sizeanimation;
  late double opacity = 0;
  Widget form = Container();

  void gender_swipe(){
    print("swiped");
  }

  void loadform(){
    setState((){
      form = preference_form_body();
    });
  }
  @override
  initState(){
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 700));
    _alignmentanimation = Tween<Alignment>(begin: Alignment.center,end: Alignment.topLeft).animate(CurvedAnimation(parent: _controller, curve: Interval(0.3, 1,curve: Curves.easeOut)));
    _sizeanimation = Tween<double>(begin: 300,end: 90).animate(CurvedAnimation(parent: _controller, curve: Interval(0.3, 1,curve: Curves.easeOut)));
    _controller.forward().then((value) => setState((){
      loadform();
      opacity=1;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: _alignmentanimation.value,
                      child: Container(
                        margin: EdgeInsets.only(top: 20,left: 20),
                        height: _sizeanimation.value,
                        child: Image.asset("assets/preference.png"),
                      ),
                    ),
                    Expanded(
                        child: form
                    )
                  ],
                );
              },
            )
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.only(top: 32,right: 15),
            height: 50,
            width: 220,
            padding: EdgeInsets.only(left: 15),
            child: AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 700),
              child: Text("About you",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
