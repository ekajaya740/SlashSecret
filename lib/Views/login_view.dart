import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_secret/widgets/my_elevated_button.dart';
import 'package:my_secret/widgets/my_text.dart';
import '../widgets/my_animated_text.dart';
import '../widgets/my_text_form_field.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    const Color redColor = Color(0xffFF5B5B);
    const Color blueColor = Color(0xff007CB1);
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 52),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [logoDisplay],
                    ),
                  ),
                  Form(
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
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.visible,
                              ),
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
                          blueColor,
                          Icon(
                            Icons.account_circle_rounded,
                            color: blueColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: _tffPassword(
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_loginButton(blueColor)],
                  ),
                ],
              ),
            )),
          )),
    );
  }

  Widget _tffUsername(Color enabledColor, Icon icon) {
    return MyTextFormField("Username", enabledColor, icon, TextInputType.text,
        TextInputAction.next, false);
  }

  Widget _tffPassword(Color enabledColor, Icon icon) {
    return MyTextFormField("Password", enabledColor, icon,
        TextInputType.visiblePassword, TextInputAction.none, true);
  }

  Widget _loginButton(Color primaryColor) {
    return MyElevatedButton(
        buttonText: "Login",
        primaryColor: primaryColor,
        minimumSize: Size(MediaQuery.of(context).size.width - 32, 48));
  }
}
