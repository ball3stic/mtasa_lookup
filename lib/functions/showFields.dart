import 'package:api_app/data/Server.dart';
import 'package:api_app/functions/createField.dart';
import 'package:flutter/material.dart';

Widget showFields(Server theServer) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    child: Column(
      children: [
        createField(title: "Name", data: theServer.name),
        createField(
            title: "Max Player", data: theServer.maxplayers, isBold: true),
        createField(title: "Server IP", data: theServer.ip),
        createField(title: "SV Version", data: theServer.version, isBold: true),
        createField(title: "Online Players", data: theServer.players),
        createField(title: "SV Port", data: theServer.port, isBold: true),
      ],
    ),
  );
}
