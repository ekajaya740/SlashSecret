import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_secret/Database/files_database.dart';
import 'package:my_secret/Views/pin_input_view.dart';
import 'package:my_secret/widgets/my_card.dart';
import 'package:my_secret/widgets/my_text.dart';
import '../files_content_view.dart';

class MainViewList extends StatefulWidget {
  final String pin;

  MainViewList({required this.pin});
  @override
  State<StatefulWidget> createState() => _MainViewList(pin: this.pin);
}

class _MainViewList extends State<MainViewList> {
  final String pin;

  _MainViewList({required this.pin});

  @override
  Widget build(BuildContext context) {
    const Color _dividerColor = Color(0xffB5B5B5);
    return ListView.separated(
      itemCount: files.length,
      itemBuilder: (context, index) {
        final FilesDatabase filesDatabase = files[index];

        return MyCard(
            onTap: () {
              if(filesDatabase.isLocked){
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => PinInputView(pin: this.pin, fileName: filesDatabase.fileName, fileData: filesDatabase.fileContent,)));
              }else{
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => FilesContentView(fileData: filesDatabase.fileContent,fileName: filesDatabase.fileName)));
              }
            },
            child: _folderFront(
                filesDatabase.fileName, filesDatabase.isLocked));
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
