import 'package:flutter/material.dart';
import 'package:loginanimation/typing_text_widget.dart';

class profile_photo_widget extends StatefulWidget {
  const profile_photo_widget({Key? key}) : super(key: key);

  @override
  State<profile_photo_widget> createState() => _profile_photo_widgetState();
}

class _profile_photo_widgetState extends State<profile_photo_widget> {
  double seriously_opacity = 0;
  late Widget quote;
  @override
  initState(){
    quote = Container(height : 30,margin: EdgeInsets.only(top: 10),child: typing_text_widget(size: 20, text: "Share your smile with the world!", gredient: LinearGradient(colors: [Colors.white,Color.fromRGBO(198, 255, 221, 1),Color.fromRGBO(251, 215, 134, 1),Color.fromRGBO(247, 121, 125,1)])));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          quote,
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: Stack(
                    children: [
                      Image.asset("assets/dp.png"),
                      AnimatedOpacity(
                          opacity : seriously_opacity,
                          duration: Duration(milliseconds: 500),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                margin: EdgeInsets.only(top: 40),
                                width: 150,
                                height: 50,
                                child: Image.asset("assets/seriously.png")
                            ),
                          )
                      )
                    ],
                  )
              )
          ),
          Container(
            height: 80,
            child: Row(
              children: [
                Expanded(
                    child: IconButton(
                      onPressed: () async {
                        seriously_opacity = 1;
                        setState((){
                        });
                        await Future.delayed(Duration(seconds: 2)).then((value){
                          seriously_opacity=0;
                          setState((){});
                        });
                      },
                      icon: Icon(Icons.add_a_photo_outlined,color: Colors.white,size: 30,),
                    )
                ),
                Expanded(
                  child : IconButton(
                    onPressed: null,
                    icon: Icon(Icons.photo,color: Colors.white,size: 30,),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
