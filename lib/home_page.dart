import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWord extends StatefulWidget {
  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  @override
  Widget build(BuildContext context) {
    final List<WordPair> _suggestions = <WordPair>[]; 
    final TextStyle _biggerFont = const TextStyle(fontSize: 18);

    Widget _buildRow(WordPair pair) {
      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      );
    }

    Widget _buildSuggestions() {
      return ListView.builder(
          padding: EdgeInsets.all(16),
          itemBuilder: (BuildContext _context, int i) {
            if (i.isOdd) {
              return Divider();
            }
            final int index = i ~/ 2;

            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }
            return _buildRow(_suggestions[index]);
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator"),
      ),
      body: _buildSuggestions(),
    );
  }
}
