import 'package:api_app/pages/home_page.dart';
import 'package:flutter/material.dart';

Widget ipInputText() {
  return Container(
    height: 50,
    width: 200,
    child: TextField(
      controller: controller,
      cursorColor: Colors.black,
      style: TextStyle(),
      decoration: InputDecoration(
        hintText: "Server IP",
      ),
    ),
  );
}
