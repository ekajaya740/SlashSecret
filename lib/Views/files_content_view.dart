import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_secret/widgets/my_appbar.dart';
import 'package:my_secret/widgets/my_text.dart';
import 'package:my_secret/widgets/my_text_form_field.dart';

class FilesContentView extends StatefulWidget {
  final String fileName;
  final String fileData;

  FilesContentView({required this.fileData, required this.fileName});

  @override
  State<StatefulWidget> createState() =>
      _FilesContentView(fileData: this.fileData, fileName: this.fileName);
}

class _FilesContentView extends State<FilesContentView> {
  final String fileName;
  final String fileData;
  TextEditingController textEditingControllerDummy =
      new TextEditingController();

  _FilesContentView({required this.fileData, required this.fileName});

  @override
  void initState(){
    super.initState();
    textEditingControllerDummy = new TextEditingController(text:this.fileData);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _myAppBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: MyTextFormField(
                  initialValue: this.fileData,
                  textInputAction: TextInputAction.none,
                  textEditingController: textEditingControllerDummy,
                  obscureText: false,
                  textInputType: TextInputType.text,
                  maxLines: MediaQuery.of(context).size.height.toInt(),
                ),
              )
            ],
          )),
    ));
  }

  AppBar _myAppBar() {
    return MyAppBar(
      title: MyText(
        text: this.fileName,
        textColor: Colors.white,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      centerTitle: true,
      automaticallyImplyLeading: true,
      actions: [],
      backgroundColor: Colors.transparent,
    );
  }
}
