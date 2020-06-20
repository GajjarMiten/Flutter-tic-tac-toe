import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/helpers/CustomTheme.dart';
import 'package:tictactoe/helpers/particles.dart';
import 'package:tictactoe/screens/BotScreen.dart';
import 'package:tictactoe/components/homeScreen/EntryText.dart';
import 'package:tictactoe/components/homeScreen/GameOption.dart';
import 'package:tictactoe/screens/GameScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with CustomTheme {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
          body: Stack(
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width,
              ),
              EntryText(),
              SizedBox(
                height: 50,
              ),
              GameOption(
                title: "Single Player",
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => BotScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              GameOption(
                title: "MultiPlayer",
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) =>
                          GameScreen(secondPlayer: "Player 2", botPlayer: false),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
