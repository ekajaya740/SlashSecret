import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow overflow;

  const MyText(
      {required this.text,
      required this.textColor,
      required this.fontSize,
      required this.fontWeight,
      required this.overflow});

  @override
  Widget build(BuildContext context) {
    return _myText(text, textColor, fontSize, fontWeight, overflow);
  }

  Widget _myText(String text, Color textColor, double fontSize,
      FontWeight fontWeight, TextOverflow overflow) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(color: textColor),
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
