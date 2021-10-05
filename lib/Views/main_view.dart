import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_secret/Database/account_database.dart';
import 'package:my_secret/Database/files_database.dart';
import 'package:my_secret/Views/MainViewViews/main_view_grid.dart';
import 'package:my_secret/Views/MainViewViews/main_view_list.dart';
import 'package:my_secret/Views/login_view.dart';
import 'package:my_secret/widgets/my_appbar.dart';
import '../widgets/my_text.dart';

class MainView extends StatefulWidget {
  final String username;

  MainView({required this.username});

  @override
  State<StatefulWidget> createState() => _MainView(username: this.username);
}

class _MainView extends State<MainView> {
  bool _isGrid = true;
  final String username;

  _MainView({required this.username});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: _myAppbar(username),
          body: _isGrid ? MainViewGrid() : MainViewList(),
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
            //Disable Pop on back click
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
            if (accounts[0].username == username) {
              files.removeLast();
              files.removeLast();
            }
          },
          icon: Icon(
            Icons.logout_rounded,
          ),
        )
      ],
      centerTitle: false,);
  }
}
