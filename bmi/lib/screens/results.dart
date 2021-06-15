import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/box_container.dart';
import '../components/button.dart';

class ResultPage extends StatelessWidget {
  
  final String result;
  final String score;
  final String suggestion;

  ResultPage({required this.score, required this.result, required this.suggestion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: titleStyle,
            ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BoxContainer(
              colour: activeColour, 
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Text(
                    result,
                    style: resultTextStyle,
                  ),
                  Text(
                    score,
                    style: bmiTextStyle
                  ),
                  Text(
                    suggestion,
                    textAlign: TextAlign.center,
                    style: bodyTextStyle,
                  ),
                ],
              )),
            ),
            BottomButton(
              title: 'RE-CALCULATE', onTap: () => Navigator.pop(context)
              )
        ],
      )
    );
  }
}