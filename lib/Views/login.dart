import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_secret/widgets/my_text.dart';
import '../widgets/my_animated_text.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    const Color redColor = Color(0xffFF5B5B);
    const Color blueColor = Color(0xff007CB1);
    final TextStyle tfTextStyle = GoogleFonts.montserrat(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600);
    final String logoMain = "images/logo_no_text.svg";
    final Widget logoDisplay = SvgPicture.asset(
      logoMain,
      semanticsLabel: "App Logo",
      width: 98,
      height: 98,
    );
    return Scaffold(
      body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [logoDisplay],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Form(
                      child: Column(
                        children: [
                          Row(children: [
                            MyAnimatedText(
                              text: "echo ",
                              textColor: redColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              speedAnimationDuration:
                                  const Duration(milliseconds: 50),
                              pauseAnimationDuration:
                                  const Duration(milliseconds: 100),
                            ),
                            MyAnimatedText(
                                text: '"Can you reveal my secret?"',
                                textColor: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                speedAnimationDuration:
                                    const Duration(milliseconds: 50),
                                pauseAnimationDuration:
                                    const Duration(milliseconds: 300)),
                          ]),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 48),
                            child: Row(
                              children: [
                                MyText(
                                    text: "> ",
                                    textColor: Colors.white,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700),
                                MyAnimatedText(
                                  text: "sudo ",
                                  textColor: redColor,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                  speedAnimationDuration:
                                      const Duration(milliseconds: 300),
                                  pauseAnimationDuration:
                                      const Duration(milliseconds: 400),
                                ),
                                MyAnimatedText(
                                    text: "Login",
                                    textColor: Colors.white,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700,
                                    speedAnimationDuration:
                                        const Duration(milliseconds: 400),
                                    pauseAnimationDuration:
                                        const Duration(milliseconds: 500)),
                              ],
                            ),
                          ),
                          _tffUsername(
                            tfTextStyle,
                            blueColor,
                            Icon(
                              Icons.account_circle_rounded,
                              color: blueColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: _tffPassword(
                              tfTextStyle,
                              blueColor,
                              Icon(
                                Icons.lock_rounded,
                                color: blueColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_loginButton(blueColor)],
                    ),
                  ),
                ],
              ),
            )),
          )),
    );
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

  Widget _tffUsername(TextStyle textStyle, Color enabledColor, Icon icon) {
    return TextFormField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        style: textStyle,
        decoration: _tffInputDecoration("Username", enabledColor, icon));
  }

  Widget _tffPassword(TextStyle textStyle, Color enabledColor, Icon icon) {
    return TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        style: textStyle,
        decoration: _tffInputDecoration("Password", enabledColor, icon));
  }

  Widget _loginButton(Color primaryColor) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "Login",
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
          minimumSize: Size(MediaQuery.of(context).size.width - 32, 48)),
    );
  }
}
