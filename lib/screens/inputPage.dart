import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import 'results_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

//const is used for fixed value that you already have before running while final can
//example: final DateTime x = DateTime.now()

enum Gender {
  //enum is used for classification like boolean but more than 1 option
  female,
  male,
  none
}

enum Weight {
  //enum is used for classification like boolean but more than 1 option
  add,
  minus,
  none,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  Weight selectedWeight = Weight.none;
  int height = 180;
  int weight = 60;
  int age = 17;

  void setWeight(Weight x) {
    setState(() {
      if (x == Weight.add) {
        weight++;
      } else if (x == Weight.minus) {
        weight--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    x: selectedGender == Gender.male
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild:
                        IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  x: selectedGender == Gender.female
                      ? activeCardColour
                      : inactiveCardColour,
                  cardChild: IconContent(
                      icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                )),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
                  onPress: () {
                    setState(() {});
                  },
                  x: activeCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                        'HEIGHT',
                        style: labelTextStyle,
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: numberTextStyle,
                          ),
                          Text(
                            ' cm',
                            style: labelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          overlayColor: Color(0x29EB1555),
                          thumbColor: Color(0xFFEB1555),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ))),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {});
                    },
                    x: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                x: () {
                                  setWeight(Weight.minus);
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                x: () {
                                  setWeight(Weight.add);
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {});
                        },
                        x: activeCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: labelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: numberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    x: () {
                                      setState(() {
                                        age--;
                                      });
                                    }),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    x: () {
                                     setState(() {
                                       age++;
                                     });
                                    }),
                              ],
                            ),
                          ],
                        ),),),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){

              CalculatorBrain y = new CalculatorBrain(height: height, weight: weight);


              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultsPage(bmiResult :y.calculateBMI(),bmiText:y.getResult(),bmiInterpretation:y.getInterpretation())),
              );
            },
            child: Container(
              color: bottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
              child: Center(child: Text('CALCULATE', style: buttonTextStyle,)),
              padding: EdgeInsets.only(bottom: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function? x;
  RoundIconButton({required this.icon, required this.x});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      elevation: 6.0,
      onPressed: () {
        if (x != null) {
          x!();
        }
      },
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
