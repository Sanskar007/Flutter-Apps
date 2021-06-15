import 'package:bmi/screens/results.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/box_container.dart';
import '../components/icon_content.dart';
import '../components/constants.dart';
import 'results.dart';
import '../components/button.dart';
import '../components/calculator.dart';


enum Gender{
male,
female,
none
}

int height = 180;
int weight = 60;
int age = 20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender=Gender.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR'
          ),
        )
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                          selectedGender = Gender.male;
                        });
                        },
                          child: BoxContainer(
                          colour: (selectedGender == Gender.male) ? activeColour: inactiveColour,
                          childCard:  IconContent(icon: FontAwesomeIcons.male, label: 'MALE',),
                        ),
                      ),
                    ),
                
                Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                        child: BoxContainer(
                        colour: (selectedGender == Gender.female) ? activeColour: inactiveColour,
                        childCard:  IconContent(icon: FontAwesomeIcons.female, label: 'FEMALE',),
                      ),
                    ),
                ),
          ],
          ),
          ),
          Expanded(child: BoxContainer(
          colour: activeColour, 
          childCard:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
              Center(
                child: Text('HEIGHT',
                style: labelStyle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget> [
                  Text(height.toString(),
                  style: displayFont,
                  ),
                  Text('cm',
                  style: labelStyle,
                  ),
                ]
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbColor: Color(0xFFEB1555),
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Color(0xFF8D8E98),
                  overlayColor: Color(0x29EB1555),
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 15
                    ),
                overlayShape: RoundSliderOverlayShape(
                  overlayRadius: 30
                  ),
                ),
                  child: Slider(
                  value: height.toDouble(), 
                  min: 100,
                  max: 240,
                  onChanged: (newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                  ),
              ),
              ],),
          ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BoxContainer(
                    colour: activeColour, 
                    childCard:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text('WEIGHT', style: labelStyle,),
                        Text(weight.toString(), style: displayFont,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          RoundedIconButton(
                            iconData: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            }),
                          SizedBox(width: 10),
                          RoundedIconButton(iconData: FontAwesomeIcons.plus,
                          onPressed: () {
                              setState(() {
                                weight++;
                              });
                            }),
                        ],)
                      ]
                    )
                    ),
                ),
                Expanded(
                  child: BoxContainer(
                    colour: activeColour, 
                    childCard:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text("AGE", style: labelStyle,),
                        Text(age.toString(), style: displayFont),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget> [
                            RoundedIconButton(
                            iconData: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            }),
                          SizedBox(width: 10),
                          RoundedIconButton(iconData: FontAwesomeIcons.plus,
                          onPressed: () {
                              setState(() {
                                age++;
                              });
                            }),
                          ],
                        ),
                      ]
                    ),
                    ),
                    ),
          ],
          ),
          ),
          BottomButton(title: 'CALCULATE', onTap: () {

            Calculator calc = Calculator(height: height, weight: weight);

        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => ResultPage(
              score: calc.calcBMI(),
              result: calc.getResult(),
              suggestion: calc.getInterpret(),
            ),
            ),
          );
      },)
      ],),
      );
  }
}

class RoundedIconButton extends StatelessWidget {

  RoundedIconButton({required this.iconData, required this.onPressed});

  final IconData iconData;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.5,
      child: Icon(iconData),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      fillColor: Color(0x4C4F5E),
      shape: CircleBorder()

    );
  }
}
