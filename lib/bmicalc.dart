import 'dart:math';

import 'package:bmicalculator/bmi_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiCalc extends StatefulWidget {
  // const BmiCalc({Key? key}) : super(key: key);

  @override
  State<BmiCalc> createState() {
    return _BmiCalcState();
  }
}


class _BmiCalcState extends State<BmiCalc> {
  bool isMale= true;
    double height=120.0;
  int weight=50;
  int age =21;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black.withOpacity(0.3),
        title: Container(alignment: AlignmentDirectional.center,
            child: Text("BMI CALCULATOR",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
      ),
      body: SafeArea(
        child: Container(color: Colors.grey[400],
          child: Column(
            children: [
              Expanded(flex: 3,
                child: Container(alignment: AlignmentDirectional.center,margin: EdgeInsetsDirectional.all(20),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   Expanded(
                     child: GestureDetector(onTap: (){
                       setState(() {
                         isMale=true;
                       });
                     },
                       child: Container(decoration: BoxDecoration(color: isMale?Colors.pink[800]:Colors.black,borderRadius:BorderRadiusDirectional.circular(15)),
                         child: Column(mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                          Image(image: AssetImage('assets/images/R.png'),width: 60,height: 60,),
                           SizedBox(height: 15,),
                           Text("MALE",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),)
                         ],),
                       ),
                     ),
                   ),
                    SizedBox(width: 30,),
                    Expanded(
                      child: GestureDetector(onTap: (){
                        setState(() {
                          isMale=false;
                        });
                      },
                        child: Container(decoration: BoxDecoration(color: isMale?Colors.black:Colors.pink[800],borderRadius:BorderRadiusDirectional.circular(15)),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Image(image: AssetImage('assets/images/f.png',),width: 70,height: 60,),
                            SizedBox(height: 15,),
                            Text("FEMALE",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),

                          ],),
                        ),
                      ),
                    ),
                  ],),
                ),
              ),
              Expanded(flex: 3,
                child: Container(margin: EdgeInsetsDirectional.symmetric(horizontal: 20),decoration: BoxDecoration(color: Colors.black,borderRadius:BorderRadiusDirectional.circular(20)),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("HEIGHT",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                      Text("${height.round()}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                      SizedBox(width: 2,),
                      Text("CM",style: TextStyle(fontSize: 12,color: Colors.white),),
                    ],),
                    Slider(value: height,
                        min: 100,
                        max: 200,
                        activeColor: Colors.pink,inactiveColor: Colors.white,
                        onChanged: (value){
                         setState(() {
                           height=value;
                         });
                        })
                  ],),
                ),
              ),
              Expanded(flex: 3,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Expanded(
                    child: Container(margin: EdgeInsetsDirectional.all(20),decoration: BoxDecoration(color: Colors.black,borderRadius:BorderRadiusDirectional.circular(20)),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text("WEIGHT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                          SizedBox(height: 5,),
                        Text("$weight",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(onPressed: (){setState(() {
                              weight++;
                            });},child: Icon(Icons.add),backgroundColor: Colors.pink,mini:true ,),
                            FloatingActionButton(onPressed: (){setState(() {
                              weight--;
                            });},child: Icon(Icons.minimize),backgroundColor: Colors.pink,mini:true ,),
                          ],
                        )
                      ],),
                    ),
                  ),
                  // SizedBox(width: 30,),
                  Expanded(
                    child: Container(margin: EdgeInsetsDirectional.all(20),decoration: BoxDecoration(color: Colors.black,borderRadius:BorderRadiusDirectional.circular(15)),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text("AGE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                        SizedBox(height: 5,),
                        Text("$age",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(onPressed: (){setState(() {
                              age++;
                            });},child: Icon(Icons.add),backgroundColor: Colors.pink,mini:true ,),
                            FloatingActionButton(onPressed: (){setState(() {
                              age--;
                            });},child: Icon(Icons.minimize),backgroundColor: Colors.pink,mini:true ,),
                          ],
                        )
                      ],),
                    ),
                  ),
                ],),
              ),
              Expanded(flex: 1,
                child: Container(width: double.infinity,decoration: BoxDecoration(color: Colors.pink[600],borderRadius:BorderRadiusDirectional.vertical(top:Radius.circular(15) ) ),
                    child: MaterialButton(onPressed: (){
                      double result=weight/pow(height/100, 2);
                      print(result);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>BmiResult(isMale,result ,age ))
                      );
                   },child: Text("CALCULATE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,decoration: TextDecoration.underline),),)),
              )
            ],
          ),
        ),
      ),
    );

  }
}
