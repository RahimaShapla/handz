import 'package:flutter/material.dart';
import 'package:handz/app/ui/home/home_page.dart';
import 'package:handz/app/ui/result/result_page.dart';
import 'package:handz/app/ui/splash/splash_page.dart';
import 'package:handz/helper/router/route_constants.dart';
import '../network/model/signtoimage.dart';
import 'not_found_page.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case resultRoute:
        return MaterialPageRoute(
            builder: (_) => ResultPage(
                  path:  (settings.arguments as Map)["path"]  as String,
                  resultList:  (settings.arguments as Map)["resultList"]  as List<ImageToSign>,
                ));
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
