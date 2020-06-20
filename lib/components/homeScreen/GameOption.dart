import 'package:flutter/material.dart';
import 'package:tictactoe/helpers/CustomTheme.dart';

class GameOption extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  GameOption({@required this.title, @required this.onTap});
  @override
  _GameOptionState createState() => _GameOptionState();
}

class _GameOptionState extends State<GameOption> with CustomTheme {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        width: 240,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient:
              LinearGradient(colors: (gameOpButtonColors..shuffle()).first),
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            fontFamily: "Acme",
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
