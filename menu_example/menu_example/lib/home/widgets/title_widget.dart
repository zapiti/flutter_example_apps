import 'package:flutter/material.dart';

Container titleWidget() {
  return Container(
    margin: EdgeInsets.only(left: 0),
    child: Text(
      "Seu app",
      style: TextStyle(
        fontSize: 24,
        color: Colors.orange,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
