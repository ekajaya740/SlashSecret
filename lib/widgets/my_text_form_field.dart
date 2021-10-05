import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFormField extends StatefulWidget {
  final String? hint;
  final Icon? icon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final TextEditingController? textEditingController;
  final int maxLines;
  final String? initialValue;
  final FormFieldValidator? formFieldValidator;

  MyTextFormField(
      {this.hint,
      this.icon,
      required this.textInputType,
      required this.textInputAction,
      required this.obscureText,
      this.textEditingController,
      required this.maxLines,
      this.initialValue, this.formFieldValidator});

  @override
  State<StatefulWidget> createState() => _MyTextFormField(
      hint: this.hint,
      icon: this.icon,
      textInputType: this.textInputType,
      textInputAction: this.textInputAction,
      obscureText: this.obscureText,
      textEditingController: this.textEditingController,
      maxLines: this.maxLines,
      initialValue: this.initialValue, formFieldValidator: this.formFieldValidator);
}

class _MyTextFormField extends State<MyTextFormField> {
  final String? hint;
  final Icon? icon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final TextEditingController? textEditingController;
  final int maxLines;
  final String? initialValue;
  final FormFieldValidator? formFieldValidator;

  final TextStyle _tfTextStyle = GoogleFonts.montserrat(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600);

  _MyTextFormField(
      {this.hint,
      this.icon,
      required this.textInputType,
      required this.textInputAction,
      required this.obscureText,
      this.textEditingController,
      required this.maxLines,
      this.initialValue, this.formFieldValidator});

  @override
  Widget build(BuildContext context) {
    const Color _redColor = Color(0xffCF3434);
    const Color _blueColor = Color(0xff007CB1);
    return TextFormField(
      autovalidateMode: AutovalidateMode.always, controller: textEditingController,
      obscureText: obscureText,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      style: _tfTextStyle,
      decoration: _tffInputDecoration(hint, _blueColor, _redColor, icon),
      maxLines: maxLines,
      validator: formFieldValidator,
    );
  }

  OutlineInputBorder _tffOutlineInputBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide(color: color, width: 2));
  }

  InputDecoration _tffInputDecoration(
      String? hint, Color enabledColor, Color errorColor, Icon? icon) {
    final TextStyle tfHintStyle = GoogleFonts.montserrat(
        color: Colors.white70, fontSize: 18, fontWeight: FontWeight.w600);
    return InputDecoration(
        prefixIcon: icon,
        hintText: hint,
        focusedBorder: _tffOutlineInputBorder(Colors.blue),
        enabledBorder: _tffOutlineInputBorder(enabledColor),
        errorBorder: _tffOutlineInputBorder(errorColor),
        focusedErrorBorder: _tffOutlineInputBorder(errorColor),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        hintStyle: tfHintStyle);
  }
}
