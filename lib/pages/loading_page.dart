import 'package:api_app/functions/changePage.dart';
import 'package:api_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

Response? response;

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getData('https://mtasa.com/api/', context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.deepPurple,
            size: 80.0,
          ),
        ),
      ),
    );
  }
}

void getData(String url, BuildContext context) async {
  Uri uri = Uri.parse(url);
  response = await get(uri);
  changePage(HomePage(), context);
}
