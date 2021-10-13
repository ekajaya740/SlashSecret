import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_secret/Databases/account_database.dart';
import 'package:my_secret/Validators/password_validator.dart';
import 'package:my_secret/Views/main_view.dart';
import 'package:my_secret/widgets/my_elevated_button.dart';
import 'package:my_secret/widgets/my_text.dart';
import '../widgets/my_animated_text.dart';
import '../widgets/my_text_form_field.dart';
import '../Databases/files_database.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  late var username;
  late var pin;
  late var files;
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final GlobalKey<FormState> _formState = new GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color _redColor = Color(0xffFF5B5B);
    const Color _blueColor = Color(0xff007CB1);
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
                    key: _formState,
                    child: Column(
                      children: [
                        Row(children: [
                          MyAnimatedText(
                            text: "echo ",
                            textColor: _redColor,
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
                                textColor: _redColor,
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
                            Icon(
                              Icons.account_circle_rounded,
                              color: _blueColor,
                            ),
                            _usernameController),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: _tffPassword(
                              Icon(
                                Icons.lock_rounded,
                                color: _blueColor,
                              ),
                              _passwordController),
                        ),
                      ],
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _loginButton(_blueColor, _usernameController,
                          _passwordController, context)
                    ],
                  ),
                ],
              ),
            )),
          )),
    );
  }

  Widget _tffUsername(Icon icon,
      TextEditingController textEditingController) {
    return MyTextFormField(
      hint: "Username",
      icon: icon,
      textInputType: TextInputType.text,
      textInputAction: TextInputAction.next,
      obscureText: false,
      textEditingController: textEditingController,
      maxLines: 1,
    );
  }

  Widget _tffPassword(Icon icon,
      TextEditingController textEditingController) {
    return MyTextFormField(
      hint: "Password",
      icon: icon,
      textInputType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.none,
      obscureText: true,
      textEditingController: textEditingController,
      maxLines: 1,
    );
  }

  Widget _loginButton(
      Color primaryColor,
      TextEditingController usernameController,
      TextEditingController passwordController,
      BuildContext context) {
    return MyElevatedButton(
        onPressed: () {
          PasswordValidator passwordValidator = new PasswordValidator();
          for (int index = 0; index < accounts.length; index++) {
            if (usernameController.text == accounts[index].username &&
                passwordController.text == passwordValidator.passwordValidator(accounts[index].password)) {
              this.username = usernameController.text;
              this.pin = accounts[index].pin;
              this.files = accounts[index].files;
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainView(username: this.username, pin: this.pin, files: this.files,)));
              _usernameController.clear();
              _passwordController.clear();
              //Change UsernameController
            }
          }
          validateInput();
        },
        buttonText: "Login",
        primaryColor: primaryColor,
        minimumSize: Size(MediaQuery.of(context).size.width - 32, 48));
  }

  void validateInput(){
    if(_formState.currentState!.validate()){
      _formState.currentState!.save();
    }
  }
}
