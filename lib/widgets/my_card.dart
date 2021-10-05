import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final Widget child;
  final GestureTapCallback onTap;

  MyCard({required this.child, required this.onTap});

  @override
  State<StatefulWidget> createState() =>
      _MyCard(child: child, onTap: this.onTap);
}

class _MyCard extends State<MyCard> {
  final Widget child;
  final GestureTapCallback onTap;

  _MyCard({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Card(
            elevation: 0,
            child: child,
            color: Colors.transparent,
          ),
        ));
  }
}
