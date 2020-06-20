import 'package:flutter/material.dart';
import 'package:tictactoe/helpers/CustomTheme.dart';

class Word extends StatefulWidget {
  final String word;
  final Color color;
  Word({
    @required this.word,
    @required this.color,
  });
  @override
  _WordState createState() => _WordState();
}

class _WordState extends State<Word> with CustomTheme {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: entryTextBG,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        widget.word,
        style: TextStyle(
          fontFamily: "Piedra",
          color: widget.color,
          fontSize: 50,
        ),
      ),
    );
  }
}
