import 'package:flutter/material.dart';
import 'package:xo/game_board.dart';

class PlayerScreen extends StatelessWidget{
  static const String routeName ='PlayerScreen';
  String player1name ='';
  String player2name ='';
  @override
  Widget build(BuildContext context) {
   return Scaffold(
appBar: AppBar(
  title: Text('welcome to XO Game'),
),
     body: Padding(
       padding: const EdgeInsets.all(18.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
         TextField(
           onChanged: (text){
player1name=text;
           },
    decoration: InputDecoration(
        label: Text('player1',style: TextStyle(
          fontSize: 20,
        ),),
        hintText: 'player1',
    ),
  ),
  TextField(
    onChanged: (text){
      player2name=text;
    },
    decoration: InputDecoration(
        label: Text('player2',style: TextStyle(
          fontSize: 20,
        ),),
        hintText: 'player2',
    ),
  ),
    ElevatedButton(onPressed: (){
    Navigator.of(context).pushReplacementNamed(GameBoard.routeName,
    arguments:GameBoardArgs(player1Name: player1name, player2Name: player2name)
    );
  }, child: Text("let's play"),
  )],
       ),
     ),
   );
  }

}