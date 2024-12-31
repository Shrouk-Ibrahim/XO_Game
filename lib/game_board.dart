import 'package:flutter/material.dart';
import 'package:xo/board_button.dart';

class GameBoard extends StatefulWidget {
  static const String routeName = 'game-board';

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String>boardState =[
    '','','',
    '','','',
    '','','',
  ];
  var player1Score =0;
  var player2Score =0;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as GameBoardArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text('XO Game'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.player1Name}(X)',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text('$player1Score',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.player2Name}(O)',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),),
                    Text('$player2Score',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(text:boardState[0],onButtonClicked: onButtonClicked ,index: 0, ),
                BoardButton(text:boardState[1] ,onButtonClicked: onButtonClicked  ,index: 1,),
                BoardButton(text:boardState[2],onButtonClicked: onButtonClicked  ,index: 2, ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(text:boardState[3],onButtonClicked: onButtonClicked  ,index: 3, ),
                BoardButton(text:boardState[4],onButtonClicked: onButtonClicked  ,index: 4, ),
                BoardButton(text:boardState[5] ,onButtonClicked:onButtonClicked   ,index: 5,),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(text:boardState[6],onButtonClicked: onButtonClicked  ,index: 6, ),
                BoardButton(text:boardState[7],onButtonClicked: onButtonClicked  ,index: 7, ),
                BoardButton(text:boardState[8],onButtonClicked:onButtonClicked   ,index: 8, ),
              ],
            ),
          ),
        ],
      ),
    );

  }

  int counter=0;
  void onButtonClicked(int index) {
if(counter%2==0){
  if(boardState[index].isNotEmpty){
    return;
  }
boardState[index]='X';
}else{
  boardState[index]='O';
}
counter++;
if(checkWinner('X')){
player1Score +=5;
initboard();
}else if(checkWinner('O')){
  player2Score +=5;
  initboard();
}else if(counter==9){
initboard();
}
setState(() {

});
  }

 bool checkWinner(String symbol){

  for(int i=0;i<9 ; i+=3){
  if(boardState[i]==symbol && boardState[i+1]==symbol && boardState[i+2]==symbol){
  return true;
  }}
  for(int i=0;i<3 ; i++){
    if(boardState[i]==symbol && boardState[i+3]==symbol && boardState[i+6 ]==symbol){
      return true;
    }}
    if(boardState[0]==symbol && boardState[4]==symbol && boardState[8]==symbol){
      return true;
    }
      if(boardState[2]==symbol && boardState[4]==symbol && boardState[6]==symbol){
        return true;
      }
     return false;
  }
  void initboard(){
   boardState =[
      '','','',
      '','','',
      '','','',
    ];
    counter=0;
  }
}
  class GameBoardArgs{
    String player1Name;
    String player2Name;
    GameBoardArgs({required this.player1Name , required this.player2Name});
  }

