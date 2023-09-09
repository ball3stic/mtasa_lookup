import 'package:api_app/functions/showFields.dart';
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
        child: getAppBody(),
      ),
    );
  }

  Widget getAppBody() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: showFields(theServer),
        ),
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
}
