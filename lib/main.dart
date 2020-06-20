import 'package:flutter/material.dart';
import 'package:tictactoe/screens/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
