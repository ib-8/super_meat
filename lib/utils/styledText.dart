import 'package:flutter/material.dart';
import 'package:super_meat/utils/constants.dart';

class StyledText extends StatelessWidget {
  const StyledText(
    this.text, {
    Key? key,
    this.size = 18,
    this.weight = FontWeight.normal,
    this.color = AppColor.darkGrey,
    this.letterSpace = 0.0,
    this.lineSpace = 1.175,
    this.family,
  }) : super(key: key);

  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final double letterSpace;
  final double lineSpace;
  final String? family;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontFamily: family,
        color: color,
        fontSize: size,
        fontWeight: weight,
        letterSpacing: letterSpace,
        height: lineSpace,
      ),
    );
  }
}

class AppText extends StyledText {
  const AppText(
    String text, {
    Key? key,
    FontWeight weight = FontWeight.bold,
    double size = 18,
    Color color = AppColor.darkGrey,
  }) : super(
          text,
          key: key,
          weight: weight,
          color: color,
          size: size,
          family: AppFont.poppins,
        );
}
