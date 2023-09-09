import 'dart:convert';

import 'package:api_app/functions/changePage.dart';
import 'package:api_app/functions/showFields.dart';
import 'package:api_app/pages/loading_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultPage extends StatefulWidget {
  ResultPage({super.key, this.theServer});

  var theServer;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var theServer;

  @override
  void initState() {
    super.initState();
    theServer = widget.theServer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: getAppBody(context),
          ),
        ),
      ),
    );
  }

  Widget getAppBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('images/person2.png'),
        ),
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: showFields(theServer),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: ElevatedButton(
            onPressed: () {
              refreshData(context);
            },
            child: Text("Refresh Details"),
            style: ElevatedButton.styleFrom(
              elevation: 3,
              backgroundColor: Colors.red[800],
              minimumSize: Size(double.infinity, 60),
            ),
          ),
        )
      ],
    );
  }

  AppBar getAppBar() {
    return AppBar(
      elevation: 0,
      title: Text("Server Information"),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }

  void refreshData(BuildContext context) {
    changePage(
        LoadingPage(nextPage: ResultPage(theServer: theServer)), context);
    getData('https://mtasa.com/api/', context, doChangePage: false);
    for (var server in jsonDecode(response!.body)) {
      if (server["ip"] == theServer.ip) {
        print(theServer.ip);
        setState(() {
          theServer.name = server["name"];
          theServer.maxplayers = server["maxplayers"].toString();
          theServer.ip = server["ip"];
          theServer.version = server["version"];
          theServer.players = server["players"].toString();
          theServer.port = server["port"].toString();
        });
      }
    }
  }
}
