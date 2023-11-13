import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handz/app/framework/handz_application.dart';

import 'app/framework/app_component.dart';
import 'helper/constant/constants.dart';


Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: kWhiteColor,
    statusBarColor: kBlack,
    statusBarIconBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  Development();
}

class Development {
  Development() {
    _setupPrimarySystem();
    _init();
  }
}

void _setupPrimarySystem() async {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
}

void _init() async {
  var application = HandzApplication();
  await application.onCreate();
  runApp(AppComponent(application: application,));
}
