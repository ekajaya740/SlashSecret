import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainView();
}

class _MainView extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _myAppbar("c"),
    ));
  }

  AppBar _myAppbar(String title) {
    const Color blueColor = Color(0xff007CB1);
    return AppBar(
      title: Text(title),
      backgroundColor: blueColor,
    );
  }
}
