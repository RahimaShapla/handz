import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class FunctionUtility{
  FunctionUtility._privateConstructor();

  static final FunctionUtility _instance =
  FunctionUtility._privateConstructor();

  static FunctionUtility get instance {
    return _instance;
  }

  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}