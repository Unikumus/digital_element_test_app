import 'dart:async';

import 'package:flutter/material.dart';

import '../global/color.dart';
import '../providers/api_provider.dart';
import 'list_page.dart';


class SplashPage extends StatefulWidget {
  final Color backgroundColor = AppColor.blue;
  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final splashDelay = 2;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => ListPage(apiProvider: ApiProviderImp(),
        ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue,
      body: Center(
        child: Image.asset("assets/d_e_logo.png"),
      ),
    );
  }
}