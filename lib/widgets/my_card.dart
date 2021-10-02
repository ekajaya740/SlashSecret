import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final Widget child;

  MyCard({required this.child});

  @override
  State<StatefulWidget> createState() => _MyCard(child: child);
}

class _MyCard extends State<MyCard> {
  Widget child;

  _MyCard({required this.child});

  @override
  Widget build(BuildContext context) {
    const Color _borderColor = Color(0xff818181);
    return InkWell(
        onTap: () {},
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
