import 'package:flutter/material.dart';
import 'package:xo/game_board.dart';
import 'package:xo/player_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PlayerScreen.routeName,
      routes: {
        PlayerScreen.routeName :(context) =>PlayerScreen(),
        GameBoard.routeName : (context) => GameBoard(),
      },
    );
  }}
