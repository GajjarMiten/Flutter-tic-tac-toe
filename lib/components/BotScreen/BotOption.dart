import 'package:flutter/material.dart';

import 'package:tictactoe/helpers/CustomTheme.dart';

class BotOption extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final String bot;
  final Color bgColor;
  final Color borderColor;

  BotOption(
      {@required this.title,
      @required this.onTap,
      @required this.bot,
      this.bgColor,
      this.borderColor});
  @override
  _BotOptionState createState() => _BotOptionState();
}

class _BotOptionState extends State<BotOption> with CustomTheme {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 220,
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: widget.borderColor),
                  borderRadius: BorderRadius.circular(30),
                  color: widget.bgColor),
              child: Text(
                widget.title,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontFamily: "Acme",
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.9, 0),
              child: Image.asset(
                widget.bot,
                scale: 3.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
