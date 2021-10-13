import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_secret/Databases/files_database.dart';
import 'package:my_secret/Validators/password_validator.dart';
import 'package:my_secret/widgets/my_card.dart';
import 'package:my_secret/widgets/my_text.dart';
import '../files_content_view.dart';
import '../pin_input_view.dart';

class MainViewGrid extends StatefulWidget {
  final String pin;
  final List<FilesDatabase> files;

  MainViewGrid({required this.pin, required this.files});
  @override
  State<StatefulWidget> createState() => _MainViewGrid(pin: this.pin, files: this.files);
}

class _MainViewGrid extends State<MainViewGrid> {
  final String pin;
  final List<FilesDatabase> files;
  int axisCount = 2;

  _MainViewGrid({required this.pin, required this.files});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.shortestSide > 800 ||
                MediaQuery.of(context).orientation != Orientation.landscape
            ? axisCount = 2
            : axisCount = 4,
      ),
      itemCount: files.length,
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return MyCard(
            onTap: () {
              if(this.files[index].isLocked){
                final PasswordValidator passwordValidator = new PasswordValidator();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => PinInputView(pin: this.pin, fileName: this.files[index].fileName, fileData: passwordValidator.passwordValidator(this.files[index].fileContent),)));
              }else{
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => FilesContentView(fileData: this.files[index].fileContent,fileName: this.files[index].fileName)));
              }
            },
            child:
                _folderFront(this.files[index].fileName, this.files[index].isLocked));
      },
    );
  }

  Widget _folderFront(String text, bool isLocked) {
    const Color _folderColor = Color(0xffB5B5B5);
    const Color _lockColor = Color(0xffCF3434);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Icon(
              Icons.insert_drive_file_rounded,
              color: _folderColor,
              size: 98,
            ),
            Visibility(
              visible: isLocked,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Icon(
                  Icons.lock_rounded,
                  color: _lockColor,
                ),
              ),
            )
          ],
        ),
        MyText(
          text: text,
          textColor: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          width: 0,
          height: 16,
        )
      ],
    );
  }
}
