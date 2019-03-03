import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: AppChat(),
    );
  }
}

class AppChat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppChat();
  }
}

class _AppChat extends State<AppChat> {
  final _listchatmesseage = new List();
  TextEditingController _textController = new TextEditingController();
  void _handleSubmitted(String text) {
    ChatMesseage listms = new ChatMesseage(
      text: text,
    );
    _textController.clear();
    setState(() {
      _listchatmesseage.insert(0, listms);
    });
  }

  _buildTextCompose() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: TextField(
        controller: _textController,
        onSubmitted: _handleSubmitted,
        decoration: InputDecoration(
            hintText: 'Nhập tin nhắn',
            suffixIcon: Icon(
              Icons.send,
            )),
        onTap: () {
          setState(() {
            _listchatmesseage.insert(
                0, new ChatMesseage(text: _textController.text));
            _textController.clear();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('App chat'),
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (context, index) => _listchatmesseage[index],
              itemCount: _listchatmesseage.length,
            ),
          ),
          _buildTextCompose(),
        ],
      ),
    );
  }
}

class ChatMesseage extends StatelessWidget {
  String text;
  ChatMesseage({this.text});
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("H"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Huy dz',style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 10.0,),
                Text(this.text),
              ],
            ),
          )
        ],
      ),
    );
  }
}
