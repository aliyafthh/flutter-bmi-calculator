import 'package:flutter/material.dart';
import 'screens/inputPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith( //use copyWith to overwrite default
          primaryColor: Color(0xFF0A0D22),//copy paste HEX and add 0xFF in front
          scaffoldBackgroundColor: Color(0xFF0A0D22),
      ),
      home: InputPage(),
    );
  }
}

