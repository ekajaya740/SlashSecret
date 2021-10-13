import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_secret/Databases/files_database.dart';
import 'package:my_secret/Validators/password_validator.dart';
import 'package:my_secret/Views/pin_input_view.dart';
import 'package:my_secret/widgets/my_card.dart';
import 'package:my_secret/widgets/my_text.dart';
import '../files_content_view.dart';

class MainViewList extends StatefulWidget {
  final String pin;
  final List<FilesDatabase> files;

  MainViewList({required this.pin, required this.files});

  @override
  State<StatefulWidget> createState() =>
      _MainViewList(pin: this.pin, files: this.files);
}

class _MainViewList extends State<MainViewList> {
  final String pin;
  final List<FilesDatabase> files;

  _MainViewList({required this.pin, required this.files});

  @override
  Widget build(BuildContext context) {
    const Color _dividerColor = Color(0xffB5B5B5);
    return ListView.separated(
      itemCount: files.length,
      itemBuilder: (context, index) {
        return MyCard(
            onTap: () {
              if (this.files[index].isLocked) {
                final PasswordValidator passwordValidator =
                    new PasswordValidator();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => PinInputView(
                              pin: this.pin,
                              fileName: this.files[index].fileName,
                              fileData: passwordValidator.passwordValidator(
                                  this.files[index].fileContent),
                            )));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => FilesContentView(
                            fileData: this.files[index].fileContent,
                            fileName: this.files[index].fileName)));
              }
            },
            child: _folderFront(
                this.files[index].fileName, this.files[index].isLocked));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Divider(
            color: _dividerColor,
            height: 2,
          ),
        );
      },
    );
  }

  Widget _folderFront(String text, bool isLocked) {
    const Color _folderColor = Color(0xffB5B5B5);
    const Color _lockColor = Color(0xffCF3434);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.insert_drive_file_rounded,
          color: _folderColor,
          size: 40,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: MyText(
                text: text,
                textColor: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: isLocked,
          child: Icon(
            Icons.lock_rounded,
            color: _lockColor,
          ),
        )
      ],
    );
  }
}
