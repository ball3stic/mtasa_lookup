import 'package:api_app/functions/changePage.dart';
import 'package:api_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

// ignore: must_be_immutable
class LoadingPage extends StatefulWidget {
  LoadingPage({super.key, this.nextPage});
  Widget? nextPage;
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

Response? response;

class _LoadingPageState extends State<LoadingPage> {
  Widget? nextPage;
  @override
  void initState() {
    super.initState();
    widget.nextPage == null
        ? nextPage = HomePage()
        : nextPage = widget.nextPage;
    getData('https://mtasa.com/api/', context, nextPage: nextPage);
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

void getData(String url, BuildContext context,
    {Widget? nextPage, bool? doChangePage}) async {
  try {
    Uri uri = Uri.parse(url);
    response = await get(uri);
    nextPage == null ? nextPage = HomePage() : nextPage = nextPage;
    doChangePage == null ? doChangePage = true : doChangePage = doChangePage;
    if (doChangePage) {
      changePage(nextPage, context);
    }
  } catch (e) {
    print("Error. ${e}");
  }
}
