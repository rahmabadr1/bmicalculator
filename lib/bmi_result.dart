import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BmiResult extends StatelessWidget {

  final bool isMale;
  final double result;
  final int age;
  BmiResult( this.isMale,this.result,this.age,){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.black.withOpacity(0.3),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },icon: Icon(Icons.arrow_circle_left_rounded),),
          title: Container(alignment: AlignmentDirectional.center,
              child: Text("BMI RESULT",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
        ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text("Gender:${isMale?"Male":"Female"}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
          Text("Result:${result.round()}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
          Text("Age: $age",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)
        ],),
      ),
    );
  }
}
