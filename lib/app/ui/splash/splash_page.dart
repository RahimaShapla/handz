import 'dart:async';

import 'package:flutter/material.dart';
import 'package:handz/helper/constant/constants.dart';

import '../../../helper/router/route_constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      getNextWidget,
    );
    super.initState();
  }
  void getNextWidget() async {
     Navigator.popAndPushNamed(context, homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: kBlack,
      body: Center(
        child: Image(image: AssetImage("assets/images/ic_logo.png")),
      ),
    );
  }
}
