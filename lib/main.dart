import 'package:flutter/material.dart';
import 'package:flutterapp/Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _themeData =
        ThemeData(primaryColor: Colors.grey[400], fontFamily: 'tahama');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeData,
      home: Login(),
    );
  }
}
