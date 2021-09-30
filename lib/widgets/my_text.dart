import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const MyText(
      {required this.text,
      required this.textColor,
      required this.fontSize,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return _myText(text, textColor, fontSize, fontWeight, context);
  }

  Widget _myText(String text, Color textColor, double fontSize,
      FontWeight fontWeight, BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(color: textColor),
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
