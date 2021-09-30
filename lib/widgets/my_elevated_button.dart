import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyElevatedButton extends StatefulWidget{
  final String _buttonText;
  final Color _primaryColor;
  final Size _minimumSize;

  MyElevatedButton(this._buttonText, this._primaryColor, this._minimumSize);
  @override
  State<StatefulWidget> createState() => _MyElevatedButton(this._buttonText, this._primaryColor, this._minimumSize);
  
}

class _MyElevatedButton extends State<MyElevatedButton>{
  final String _buttonText;
  final Color _primaryColor;
  final Size _minimumSize;

  _MyElevatedButton(this._buttonText, this._primaryColor, this._minimumSize);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        _buttonText,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      style: ElevatedButton.styleFrom(
          primary: _primaryColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          minimumSize: _minimumSize),
    );
  }
  
}