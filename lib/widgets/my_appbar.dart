import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends AppBar implements PreferredSizeWidget {
  final Widget title;
  final bool automaticallyImplyLeading;
  final Color backgroundColor;
  final List<Widget> actions;
  final bool centerTitle;

  MyAppBar(
      {required this.title,
      required this.automaticallyImplyLeading,
      required this.backgroundColor,
      required this.actions,
      required this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: this.title,
      automaticallyImplyLeading: this.automaticallyImplyLeading,
      backgroundColor: this.backgroundColor,
      actions: this.actions,
      centerTitle: this.centerTitle,
    );
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
