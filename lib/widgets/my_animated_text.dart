import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAnimatedText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Duration speedAnimationDuration;
  final Duration pauseAnimationDuration;

  const MyAnimatedText(
      {required this.text,
      required this.textColor,
      required this.fontSize,
      required this.fontWeight,
      required this.speedAnimationDuration,
      required this.pauseAnimationDuration});

  @override
  Widget build(BuildContext context) {
    return _myAnimatedText(text, textColor, fontSize, fontWeight,
        speedAnimationDuration, pauseAnimationDuration, context);
  }

  Widget _myAnimatedText(
      String text,
      Color textColor,
      double fontSize,
      FontWeight fontWeight,
      Duration speedAnimationDuration,
      Duration pauseAnimationDuration,
      BuildContext context) {
    return AnimatedTextKit(
      isRepeatingAnimation: false,
      animatedTexts: [
        TypewriterAnimatedText(text,
            textStyle: GoogleFonts.montserrat(
                textStyle: TextStyle(color: textColor),
                fontSize: fontSize,
                fontWeight: fontWeight),
            cursor: "",
            speed: speedAnimationDuration),
      ],
      pause: pauseAnimationDuration,
    );
  }
}
