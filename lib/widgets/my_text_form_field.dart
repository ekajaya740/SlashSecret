import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFormField extends StatefulWidget {
  final String _hint;
  final Color _enabledColor;
  final Icon _icon;
  final TextInputType _textInputType;
  final TextInputAction _textInputAction;
  final bool _obscureText;

  MyTextFormField(this._hint, this._enabledColor, this._icon,
      this._textInputType, this._textInputAction, this._obscureText);

  @override
  State<StatefulWidget> createState() => _MyTextFormField(
      this._hint,
      this._enabledColor,
      this._icon,
      this._textInputType,
      this._textInputAction,
      this._obscureText);
}

class _MyTextFormField extends State<MyTextFormField> {
  final String _hint;
  final Color _enabledColor;
  final Icon _icon;
  final TextInputType _textInputType;
  final TextInputAction _textInputAction;
  final bool _obscureText;
  final TextStyle _tfTextStyle = GoogleFonts.montserrat(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600);

  _MyTextFormField(this._hint, this._enabledColor, this._icon,
      this._textInputType, this._textInputAction, this._obscureText);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: _obscureText,
        keyboardType: _textInputType,
        textInputAction: _textInputAction,
        style: _tfTextStyle,
        decoration: _tffInputDecoration(_hint, _enabledColor, _icon));
  }

  OutlineInputBorder _tffOutlineInputBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(color: color, width: 2));
  }

  InputDecoration _tffInputDecoration(
      String hint, Color enabledColor, Icon icon) {
    final TextStyle tfHintStyle = GoogleFonts.montserrat(
        color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w600);
    return InputDecoration(
        prefixIcon: icon,
        hintText: hint,
        focusedBorder: _tffOutlineInputBorder(Colors.blue),
        enabledBorder: _tffOutlineInputBorder(enabledColor),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        hintStyle: tfHintStyle);
  }
}
