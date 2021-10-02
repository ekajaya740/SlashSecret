import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_secret/Database/folder_database.dart';
import 'package:my_secret/widgets/my_card.dart';
import 'package:my_secret/widgets/my_text.dart';

class MainViewList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainViewList();
}

class _MainViewList extends State<MainViewList> {
  @override
  Widget build(BuildContext context) {
    const Color _dividerColor = Color(0xffB5B5B5);
    return ListView.separated(
      itemCount: folders.length,
      itemBuilder: (context, index) {
        final FolderDatabase folderDatabase = folders[index];
        return MyCard(
            child: _folderFront(
                folderDatabase.folderName, folderDatabase.isLocked));
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
          Icons.folder_rounded,
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
