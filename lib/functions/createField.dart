import 'package:flutter/material.dart';

Widget createField(
    {required String title, required String data, bool isBold = false}) {
  return Container(
    width: double.infinity,
    height: 45,
    color: isBold == true ? Colors.grey[350] : Colors.grey[200],
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("   " + title),
        Text(data + "   "),
      ],
    ),
  );
}
