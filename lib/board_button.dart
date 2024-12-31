import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget{
  String text;
  int index;
  Function onButtonClicked;
  BoardButton({required this.text,required this.index ,required this.onButtonClicked });
  @override
  Widget build(BuildContext context) {
  return  Expanded(
    child: Container(
      margin:EdgeInsets.all(3) ,
      child: ElevatedButton(
        onPressed: () {
          onButtonClicked(index);
        },
        child: Text(text),
      ),
    ),
  );
  }

}