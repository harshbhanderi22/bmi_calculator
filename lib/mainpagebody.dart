import 'package:bmi/calculate_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'boxwidget.dart';
import 'iconwidgetcontent.dart';
import 'constants.dart';
import 'result_page.dart';

enum Gender { Male, Female, none }

class boxes extends StatefulWidget {
  const boxes({Key? key}) : super(key: key);

  @override
  State<boxes> createState() => _boxesState();
}

class _boxesState extends State<boxes> {
  int height = 180;
  int weight = 60;
  int age=20;
  Gender selectedGender = Gender.Male;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    child: singlebox(
                        boxcolor: selectedGender == Gender.Male
                            ? kactivecardcolor
                            : kinactivecardcolor,
                        boxchild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: "Male",
                        )),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    child: singlebox(
                      boxcolor: selectedGender == Gender.Female
                          ? kactivecardcolor
                          : kinactivecardcolor,
                      boxchild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "Femle",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: singlebox(
            boxcolor: kactivecardcolor,
            boxchild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("HEIGHT", style: klabelstyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text("$height", style: kNumberstyle),
                    Text(
                      "cm",
                      style: klabelstyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x30EB1555),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 250,
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
               children: [
                Expanded(
                  child: singlebox(
                    boxcolor: kactivecardcolor,
                    boxchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: klabelstyle,
                        ),
                        Text(
                          "$weight",
                          style: kNumberstyle,
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight=weight-1;
                                });
                              },
                            ),
                            SizedBox(width: 15.0),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight=weight+1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                 Expanded(
                   child: singlebox(
                     boxcolor: kactivecardcolor,
                     boxchild: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           "AGE",
                           style: klabelstyle,
                         ),
                         Text(
                           "$age",
                           style: kNumberstyle,
                         ),
                         SizedBox(height: 5.0),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             RoundButton(
                               icon: FontAwesomeIcons.minus,
                               onPressed: (){
                                 setState(() {
                                   age--;
                                 });
                               },
                             ),
                             SizedBox(width: 15.0),
                             RoundButton(
                               icon: FontAwesomeIcons.plus,
                               onPressed: (){
                                 setState(() {
                                   age++;
                                 });
                               },
                             ),
                           ],
                         )
                       ],
                     ),
                   ),
                 ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {

              calculate cb=calculate(height: height,weight: weight);

              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context){
                return Result(
                  resultText: cb.ResultText(),
                  resultNumber: cb.ResultNumber(),
                  inter: cb.Feedback(),
                );
              },),
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: kBottomContainerheight,
              color: kBottomCOntainerColor,
              child: Text("CALCULATE",
                  style: kLargeButtonTextStyle),
            ) ,
          )
        ],
      ),
    );
  }
}


class RoundButton extends StatelessWidget {
  const RoundButton({Key? key,required this.icon,required this.onPressed}) : super(key:
  key);

  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon,color: Colors.white,),
      shape: CircleBorder(),
      onPressed: (){
        onPressed();
    },
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0
      ),
      fillColor: Color(0xFF4C4F5E),
      elevation: 12.0,
      disabledElevation: 12.0,

    );
  }
}

