import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_secret/widgets/my_elevated_button.dart';
import 'package:my_secret/widgets/my_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../widgets/my_appbar.dart';
import 'files_content_view.dart';
import '../Validators/pin_validator.dart';

class PinInputView extends StatefulWidget {
  final String pin;
  final String fileName;
  final String fileData;

  PinInputView(
      {required this.pin, required this.fileData, required this.fileName});

  @override
  State<StatefulWidget> createState() => _PinInputView(
      pin: this.pin, fileName: this.fileName, fileData: this.fileData);
}

class _PinInputView extends State<PinInputView> {
  final String pin;
  final String fileName;
  final String fileData;

  TextEditingController _pinController = new TextEditingController();

  _PinInputView(
      {required this.pin, required this.fileData, required this.fileName});

  @override
  Widget build(BuildContext context) {
    const Color _blueColor = Color(0xff007CB1);
    const Color _redColor = Color(0xffCF3434);
    String _pinInput;
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
                  controller: _pinController,
                  length: 6,
                  onChanged: (value) {
                    setState(() {
                      _pinInput = value;
                    });
                  },
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
                      errorBorderColor: _redColor,
                      inactiveColor: Colors.blueGrey),
                ),
                MyElevatedButton(
                    onPressed: () {
                      PinValidator pinValidator = new PinValidator();
                      if (_pinController.text == pinValidator.pinValidator(pin)) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilesContentView(
                                    fileData: this.fileData,
                                    fileName: this.fileName)));
                      }
                    },
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
