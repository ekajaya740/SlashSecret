import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyElevatedButton extends StatefulWidget {
  final String buttonText;
  final Color primaryColor;
  final Size minimumSize;
  final GestureTapCallback onPressed;

  MyElevatedButton(
      {required this.buttonText,
      required this.primaryColor,
      required this.minimumSize,
      required this.onPressed});

  @override
  State<StatefulWidget> createState() => _MyElevatedButton(
      buttonText: this.buttonText,
      primaryColor: this.primaryColor,
      minimumSize: this.minimumSize,
      onPressed: this.onPressed);
}

class _MyElevatedButton extends State<MyElevatedButton> {
  final String buttonText;
  final Color primaryColor;
  final Size minimumSize;
  final GestureTapCallback onPressed;

  _MyElevatedButton({
    required this.buttonText,
    required this.primaryColor,
    required this.minimumSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      style: ElevatedButton.styleFrom(
          primary: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          minimumSize: minimumSize),
    );
  }
}
