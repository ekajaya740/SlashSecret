import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFormField extends StatefulWidget {
  final String hint;
  final Icon icon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final TextEditingController textEditingController;

  MyTextFormField(
      {required this.hint,
      required this.icon,
      required this.textInputType,
      required this.textInputAction,
      required this.obscureText,
      required this.textEditingController});

  @override
  State<StatefulWidget> createState() => _MyTextFormField(
      hint: this.hint,
      icon: this.icon,
      textInputType: this.textInputType,
      textInputAction: this.textInputAction,
      obscureText: this.obscureText,
      textEditingController: this.textEditingController);
}

class _MyTextFormField extends State<MyTextFormField> {
  final String hint;
  final Icon icon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final TextEditingController textEditingController;
  final TextStyle _tfTextStyle = GoogleFonts.montserrat(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600);

  _MyTextFormField(
      {required this.hint,
      required this.icon,
      required this.textInputType,
      required this.textInputAction,
      required this.obscureText,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    const Color _redColor = Color(0xffCF3434);
    const Color _blueColor = Color(0xff007CB1);
    return TextFormField(
        controller: textEditingController,
        obscureText: obscureText,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        style: _tfTextStyle,
        decoration: _tffInputDecoration(hint, _blueColor, _redColor, icon));
  }

  OutlineInputBorder _tffOutlineInputBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(color: color, width: 2));
  }

  InputDecoration _tffInputDecoration(
      String hint, Color enabledColor, Color errorColor, Icon icon) {

    final TextStyle tfHintStyle = GoogleFonts.montserrat(
        color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w600);
    return InputDecoration(
        prefixIcon: icon,
        hintText: hint,
        focusedBorder: _tffOutlineInputBorder(Colors.blue),
        enabledBorder: _tffOutlineInputBorder(enabledColor),
        errorBorder: _tffOutlineInputBorder(errorColor),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        hintStyle: tfHintStyle);
  }
}
