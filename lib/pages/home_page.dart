import 'package:api_app/data/Server.dart';
import 'package:api_app/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:api_app/functions/changePage.dart';
import 'package:api_app/functions/ipInputText.dart';
import 'package:api_app/pages/result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController controller = TextEditingController();
Server theServer = Server();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: getAppBody(),
          ),
        ),
      ),
    );
  }

  Widget getAppBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(width: double.infinity),
        Column(
          children: [
            Image(
              image: AssetImage('images/person.png'),
            ),
            ipInputText(),
            SizedBox(height: 20),
            showDataButton(context),
          ],
        )
      ],
    );
  }

  Widget showDataButton(BuildContext context) {
    return ElevatedButton(
      child: Text("LookUP"),
      style: ElevatedButton.styleFrom(
        elevation: 3,
        minimumSize: Size(210, 50),
        backgroundColor: Colors.deepPurple,
      ),
      onPressed: () {
        searchData();
      },
    );
  }

  void searchData() {
    for (var server in jsonDecode(response!.body)) {
      if (server["ip"] == controller.value.text) {
        setState(() {
          theServer.name = server["name"];
          theServer.maxplayers = server["maxplayers"].toString();
          theServer.ip = server["ip"];
          theServer.version = server["version"];
          theServer.players = server["players"].toString();
          theServer.port = server["port"].toString();
        });
        changePage(ResultPage(theServer: theServer), context);
      }
    }
  }

  AppBar getAppBar(BuildContext context) {
    return AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              changePage(LoadingPage(), context);
              getData('https://mtasa.com/api/', context);
            },
            icon: Icon(Icons.refresh_sharp),
          ),
        ],
        title: Text("MTA Server LookUP"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.deepPurple);
  }
}
