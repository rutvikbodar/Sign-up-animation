import 'package:flutter/material.dart';
import 'package:loginanimation/Animated_textfield.dart';

class preference_form_body extends StatefulWidget {
  const preference_form_body({Key? key}) : super(key: key);

  @override
  State<preference_form_body> createState() => _preference_form_bodyState();
}

class _preference_form_bodyState extends State<preference_form_body> {
  double opacity = 0;
  DateTime? DOB;
  String selectedGender = "";
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  Gradient gradient = LinearGradient(colors: [Color.fromRGBO(24, 197, 96, 1.0),Color.fromRGBO(251, 215, 134, 1),Color.fromRGBO(
      203, 20, 25, 1.0)]);
  @override
  initState(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {setState(()=>opacity=1);});
  }

  Decoration provideDecoration(bool gender){
    if(gender){
      return BoxDecoration(borderRadius: BorderRadius.circular(40),boxShadow: [BoxShadow(color: Colors.red,spreadRadius: 2,blurRadius: 2)]);
    }
    return BoxDecoration(borderRadius: BorderRadius.circular(40));
  }

  void toggleGender(String gender){
    if(gender=="male"){
      setState((){
        isMaleSelected = true;
        isFemaleSelected = false;
        selectedGender = gender;
      });
    }
    else{
      setState((){
        isMaleSelected = false;
        isFemaleSelected = true;
        selectedGender = gender;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(milliseconds: 700),
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 16,),
            Container(child: Animated_textfield(hintText: "First name",)),
            SizedBox(height: 16,),
            Container(child: Animated_textfield(hintText: "Last name",)),
            SizedBox(height: 16,),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 120,
                    child: Column(
                      children: [
                        Container(
                          height: 30,
                          width: 140,
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Choose Gender",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: ()=>toggleGender("male"),
                              child: Container(
                                height: 80,
                                width: 80,
                                child: Image.asset("assets/male.png"),
                                decoration: provideDecoration(isMaleSelected),
                              ),
                            ),
                            SizedBox(width: 20,),
                            GestureDetector(
                              onTap: ()=>toggleGender("female"),
                              child: Container(
                                height: 80,
                                width: 80,
                                child: Image.asset("assets/female.png"),
                                decoration: provideDecoration(isFemaleSelected),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
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
            ),
            Align(alignment: Alignment.bottomRight,child: Container(margin : EdgeInsets.only(right: 30),child : IconButton(onPressed: null, icon: Icon(Icons.check_circle_outline,color: Colors.white,size: 30,))))
          ],
        ),
      ),
    );
  }
}
