import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_secret/Views/MainViewViews/main_view_grid.dart';
import 'package:my_secret/Views/MainViewViews/main_view_list.dart';
import '../widgets/my_text.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainView();
}

class _MainView extends State<MainView> {
  bool _isGrid = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _myAppbar("ACCOUNT NAME"),
      body: _isGrid ? MainViewGrid() : MainViewList(),
    ));
  }

  AppBar _myAppbar(String title) {
    const Color blueColor = Color(0xff007CB1);
    return AppBar(
      title: MyText(
        text: title,
        textColor: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        overflow: TextOverflow.visible,
      ),
      backgroundColor: blueColor,
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              _isGrid = !_isGrid;
            });
          },
          icon: _isGrid
              ? Icon(
                  Icons.view_list_rounded,
                )
              : Icon(
                  Icons.grid_view_rounded,
                ),
        )
      ],
    );
  }
}
