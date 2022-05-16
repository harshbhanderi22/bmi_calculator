import 'package:bmi/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi/boxwidget.dart';

class Result extends StatelessWidget {

  Result({required this.resultText,required this.resultNumber,required this.inter});


  final String resultText;
  final String resultNumber;
  final String inter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Your Result", style: kTitleTextStyle,
            textAlign: TextAlign.center,),
          Expanded(
            flex: 5,
            
            child: singlebox(boxcolor: kactivecardcolor,
                boxchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Text("$resultText", style: kResultTextStyle,),
                    Text("$resultNumber", style: kBMITextStyle,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text("$inter",
                          textAlign: TextAlign.center,
                          style: kBodyTextStyle),
                    )
                  ],
                ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: kBottomContainerheight,
              color: kBottomCOntainerColor,
              child: Text("RE-CALCULATE",
                  style: kLargeButtonTextStyle),
            ) ,
          )
        ],
      ),
    );
  }


}
