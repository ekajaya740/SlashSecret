import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_secret/widgets/my_elevated_button.dart';
import 'package:my_secret/widgets/my_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../widgets/my_appbar.dart';

class PinInputView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PinInputView();
}

class _PinInputView extends State<PinInputView> {
  @override
  Widget build(BuildContext context) {
    const Color _blueColor = Color(0xff007CB1);
    return SafeArea(
      child: Scaffold(
          appBar: _myAppBar("INPUT PIN"),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 1,
                  height: 1,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  onChanged: (value) {},
                  obscureText: true,
                  textStyle: GoogleFonts.montserrat(
                      textStyle: TextStyle(color: Colors.white, fontSize: 16)),
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 40,
                      fieldWidth: 40,
                      activeColor: _blueColor,
                      inactiveColor: Colors.blueGrey),
                ),
                MyElevatedButton(
                    onPressed: () {},
                    buttonText: "Continue",
                    primaryColor: _blueColor,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width - 32, 48))
              ],
            ),
          )),
    );
  }

  AppBar _myAppBar(String title) {
    return MyAppBar(
      backgroundColor: const Color(0xff000513),
      centerTitle: true,
      title: MyText(
        text: title,
        textColor: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        overflow: TextOverflow.visible,
      ),
      actions: [],
      automaticallyImplyLeading: true,
    );
  }
}
