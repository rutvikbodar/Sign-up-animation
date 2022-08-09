import 'package:flutter/material.dart';

class preference_form_body extends StatefulWidget {
  const preference_form_body({Key? key}) : super(key: key);

  @override
  State<preference_form_body> createState() => _preference_form_bodyState();
}

class _preference_form_bodyState extends State<preference_form_body> {
  double opacity = 0;
  DateTime? DOB;
  Gradient gradient = LinearGradient(colors: [Color.fromRGBO(24, 197, 96, 1.0),Color.fromRGBO(251, 215, 134, 1),Color.fromRGBO(
      203, 20, 25, 1.0)]);
  @override
  initState(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {setState(()=>opacity=1);});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(milliseconds: 700),
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(child: TextField(),color: Colors.pinkAccent),
            SizedBox(height: 30,),
            Container(child: TextField(),color: Colors.green,),
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onHorizontalDragEnd : (details) {
                      if(details.primaryVelocity!=null && details.primaryVelocity!>0){
                        print("swiped right");
                      }
                      if(details.primaryVelocity!=null && details.primaryVelocity!<0){
                        print("swiped left");
                      }
                    },
                    child: Container(color: Colors.yellow,height: 100,),
                  )
                  ,
                ),
                Expanded(
                    child: Container(
                        child: GestureDetector(
                          onTap: () async{
                            DOB = await showDatePicker(
                              context: context,
                              initialDate: DateTime(1987,3,3),
                              firstDate: DateTime(1940),
                              lastDate: DateTime.now()
                            );
                            setState((){});
                          },
                          child: Column(
                            children: [
                              (DOB==null)?Text("Birthdate",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),):Container(),
                              ShaderMask(
                                child: IconButton(onPressed: null, icon: Icon(Icons.cake,color: Colors.white,size: 34,)),
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) => gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height),),
                              ),
                              (DOB==null)?
                              Container():
                              Text(DOB!.day.toString()+"/"+DOB!.month.toString()+"/"+DOB!.year.toString(),
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
                            ],
                          ),
                        )
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
