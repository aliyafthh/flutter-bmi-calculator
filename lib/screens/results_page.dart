import 'package:bmi_calculator/constants.dart';
import '../components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.bmiResult,required this.bmiText, required this.bmiInterpretation});

  final String bmiResult;
  final String bmiText;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child:Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
            child: Text('Your Result',style: titleTextStyle,),
          ),),
          Expanded(
            flex: 5, 
              child: ReusableCard(
                x: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(bmiText.toUpperCase(),style: resultTextStyle,),
                    Text(bmiResult, style: bmiTextStyle,),
                    Text(bmiInterpretation,
                        textAlign: TextAlign.center,
                        style: bodyTextStyle),

                  ],
                ),
              ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              color: bottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
              child: Center(child: Text('RE-CALCULATE', style: buttonTextStyle,)),
              padding: EdgeInsets.only(bottom: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
