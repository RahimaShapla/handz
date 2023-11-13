import 'package:flutter/material.dart';
import 'handz_application.dart';


class AppProvider extends InheritedWidget {
  final HandzApplication? application;

  AppProvider({Key? key, Widget? child, this.application})
      : super(key: key, child: child!);


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static AppProvider? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType());
  }

  static HandzApplication? getApplication(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AppProvider>()!.application);
  }
}
