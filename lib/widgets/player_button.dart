import 'package:flutter/material.dart';

Widget playerButton(
    {required String text,
      required Color containerColor,
      required Color borderColor}) {
  return Expanded(
    child: Container(
      height: 60,
      width: 200,
      decoration: BoxDecoration(
        // color: Colors.green.withOpacity(0.9),
        color: containerColor,
        border: Border.all(color: borderColor, width: 2.0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    ),
  );
}