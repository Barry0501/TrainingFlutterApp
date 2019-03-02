import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Calculator();
  }
}

class _Calculator extends State<Calculator> {
  String output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String outputtemp = "0";
  String oper = ""; // toán tử
  _BuildButton(String text) {
    return OutlineButton(
      onPressed: () {
        if (text == "AC") {
          // clear text
          oper = ""; // toàn tử
          num1 = 0.0;
          num2 = 0.0;
          outputtemp = "0";
        } else if (text == "+" || text == "-" || text == "*" || text == "/") {
          num1 = double.parse(output);
          oper = text;
          outputtemp = "0";
        } else if (text == ".") {
          if (text.contains(".")) {
            return;
          } else {
            outputtemp = outputtemp + text;
          }
        } else if (text == "=") {
          num2 = double.parse(output);
          if (oper == "+") {
            outputtemp = (num1 + num2).toString();
          }
          if (oper == "-") {
            outputtemp = (num1 - num2).toString();
          }
          if (oper == "*") {
            outputtemp = (num1 * num2).toString();
          }
          if (oper == "/") {
            outputtemp = (num1 / num2).toString();
          }
          // sau khi cộng reset về trạn thái ban đầu
          num1 = 0.0;
          num2 = 0.0;
          oper = "";
        } else {
          outputtemp = outputtemp + text;
        }

        setState(() {
          output = double.parse(outputtemp).toString();
        });
      },
      //color: Colors.white,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            alignment: Alignment.bottomRight,
            padding: new EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            child: new Text(output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Divider(),
          Container(
            color: Colors.teal,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _BuildButton("AC"),
                    _BuildButton("C"),
                    _BuildButton("%"),
                    _BuildButton("/"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _BuildButton("7"),
                    _BuildButton("8"),
                    _BuildButton("9"),
                    _BuildButton("*"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _BuildButton("4"),
                    _BuildButton("5"),
                    _BuildButton("6"),
                    _BuildButton("-"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _BuildButton("1"),
                    _BuildButton("2"),
                    _BuildButton("3"),
                    _BuildButton("+"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      //flex: 2,
                      child: _BuildButton("0"),
                    ),
                    _BuildButton("."),
                    _BuildButton("="),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
