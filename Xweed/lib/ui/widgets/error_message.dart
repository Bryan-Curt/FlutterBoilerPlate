import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget{
  final String message;
  ErrorMessage({@required this.message});

  Widget build(BuildContext context){
    return Row(
      children: <Widget>[
        Icon(
          Icons.info,
          color: Colors.red,
        ),
        Text(this.message, style: TextStyle(color: Colors.red)),
      ],
    );
  }
}
