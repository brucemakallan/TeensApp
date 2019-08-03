import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  final String message;

  CustomError(this.message);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.error,
          color: Colors.deepOrange,
          semanticLabel: message,
        ),
        Text(
          message,
          style: TextStyle(color: Colors.black45),
        )
      ],
    );
  }
}
