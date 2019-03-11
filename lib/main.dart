import 'package:flutter/material.dart';
import 'package:flutterapp/Login.dart';
import 'package:flutterapp/Home.dart';
import 'package:flutterapp/MangHinh1.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
