import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {

  final Color x;
  final Widget cardChild;
  final Function? onPress;
  ReusableCard({required this.x, required this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) {
          onPress!();
        }
      },
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardChild,
        decoration: BoxDecoration(
          color: x,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}