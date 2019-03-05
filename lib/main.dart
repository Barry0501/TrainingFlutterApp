import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
}

class _Home extends State<Home> {
  // final word = WordPair.random();
  Color _color = Colors.grey;
  final listword = <WordPair>[];
  final Set<WordPair> flagword = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup name Generator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: Container(
        //color: Colors.grey,
        child: ListView.builder(
          //itemCount: listword.length,
          itemBuilder: (context, index) {
            if (index >= listword.length) {
              listword.addAll(generateWordPairs().take(10));
            }
            return _buildWord(listword[index], index);
          },
        ),
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = flagword.map(
            (WordPair pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return new Scaffold(
            // Add 6 lines from here...
            appBar: new AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          ); // ... to here.
        },
      ),
    );
  }

  _buildWord(WordPair word, int index) {
    final check = flagword.contains(word);
    return ListTile(
      title: Text(
        word.toString(),
        //word.asUpperCase,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      onTap: () {
        print('click dòng ' + index.toString());
        setState(() {
          if (check) {
            flagword.remove(word);
          } else {
            flagword.add(word);
          }
        });
      },
      trailing: Icon(
        Icons.star,
        color: check ? Colors.red : null,
      ),
    );
  }
}
