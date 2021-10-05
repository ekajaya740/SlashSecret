import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_secret/Database/files_database.dart';
import 'package:my_secret/widgets/my_card.dart';
import 'package:my_secret/widgets/my_text.dart';
import '../files_content_view.dart';
import '../pin_input_view.dart';

class MainViewGrid extends StatefulWidget {
  final String pin;

  MainViewGrid({required this.pin});
  @override
  State<StatefulWidget> createState() => _MainViewGrid(pin: this.pin);
}

class _MainViewGrid extends State<MainViewGrid> {
  final String pin;
  int axisCount = 2;

  _MainViewGrid({required this.pin});

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
            child:
                _folderFront(filesDatabase.fileName, filesDatabase.isLocked));
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
