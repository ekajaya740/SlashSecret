import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_secret/Databases/account_database.dart';
import 'package:my_secret/Databases/files_database.dart';
import 'package:my_secret/Views/MainViewViews/main_view_grid.dart';
import 'package:my_secret/Views/MainViewViews/main_view_list.dart';
import 'package:my_secret/Views/login_view.dart';
import 'package:my_secret/widgets/my_appbar.dart';
import '../widgets/my_text.dart';

class MainView extends StatefulWidget {
  final String username;
  final String pin;
  final List<FilesDatabase> files;

  MainView({required this.username, required this.pin, required this.files});

  @override
  State<StatefulWidget> createState() =>
      _MainView(username: this.username, pin: this.pin, files: this.files);
}

class _MainView extends State<MainView> {
  bool _isGrid = true;
  final String username;
  final String pin;
  final List<FilesDatabase> files;

  _MainView({required this.username, required this.pin, required this.files});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: _myAppbar(username),
          body: _isGrid ? MainViewGrid(pin: this.pin, files: this.files,) : MainViewList(
            pin: this.pin, files: this.files,),
        ));
  }

  AppBar _myAppbar(String title) {
    const Color _blueColor = Color(0xff007CB1);
    return MyAppBar(
      title: MyText(
        text: title,
        textColor: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        overflow: TextOverflow.ellipsis,
      ),
      automaticallyImplyLeading: false,
      backgroundColor: _blueColor,
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
        ),
        IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginView()));
          },
          icon: Icon(
            Icons.logout_rounded,
          ),
        )
      ],
      centerTitle: false,);
  }
}
