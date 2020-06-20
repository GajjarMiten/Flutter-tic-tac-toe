import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/components/BotScreen/BotOption.dart';
import 'package:tictactoe/helpers/CustomTheme.dart';
import 'package:tictactoe/helpers/particles.dart';
import 'package:tictactoe/screens/GameScreen.dart';

class BotScreen extends StatefulWidget {
  @override
  _BotScreenState createState() => _BotScreenState();
}

class _BotScreenState extends State<BotScreen> with CustomTheme {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: sbgColor,
              ),
            ),
          ),
          Particle(size.height, size.width),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width,
              ),
              BotOption(
                title: "Easy Bot",
                onTap: () => Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => GameScreen(
                      secondPlayer: "Easy Bot",
                      botPlayer: true,
                      difficultyLevel: 0,
                    ),
                  ),
                ),
                bot: "assets/easyBot.png",
                bgColor: Color(0xff532CD6),
                borderColor: Color(0xffE455F7),
              ),
              SizedBox(height: 40),
              BotOption(
                title: "Medium Bot",
                onTap: () => Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => GameScreen(
                      secondPlayer: "Medium Bot",
                      botPlayer: true,
                      difficultyLevel: 1,
                    ),
                  ),
                ),
                bgColor: Color(0xffDE6131),
                borderColor: Color(0xffF2D141),
                bot: "assets/mediumBot.png",
              ),
              SizedBox(height: 40),
              BotOption(
                title: "Difficult Bot",
                onTap: () => Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => GameScreen(
                      secondPlayer: "Hard bot",
                      botPlayer: true,
                      difficultyLevel: 2,
                    ),
                  ),
                ),
                bgColor: Color(0xff2A84AC),
                borderColor: Color(0xffCC2B5C),
                bot: "assets/hardBot.png",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
