import 'package:flutter/material.dart';
import 'package:my_secret/Views/main_view.dart';
import 'Views/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff000513),
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
        )
      ),
      home: Login(),
    );
  }
}
