import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../helper/router/route_constants.dart';
import '../../../helper/utils/view/dialog_util.dart';
import '../../../helper/utils/view/function_util.dart';
import '../../framework/app_provider.dart';

class HomeBloc {
/*  final BehaviorSubject<ApiResponse<List<SignToImage>>> _subjectGetConvertedData =
  BehaviorSubject<ApiResponse<List<SignToImage>>>();

  BehaviorSubject<ApiResponse<List<SignToImage>>> get getConvertedData =>
      _subjectGetConvertedData;*/

  submitResource(context, XFile file) async {
     if (await FunctionUtility.instance.checkConnection()) {
      try {
        innerAppLoader(context);
        var response = await AppProvider.of(context)!
            .application!
            .apiRepository!
            .getImageToTextResponse(file);

        Navigator.pop(context);
        Navigator.pushNamed(context, resultRoute,
            arguments: {
              "path": file.path,
              "resultList": response,
            });

      } on DioError catch (e) {
        Navigator.pop(context);
        showMessageDialog(context, e.message);
      } catch (e) {
        Navigator.pop(context);
        showMessageDialog(context, e.toString());
      }
    } else {
      showMessageDialog(context, "Please check your internet connection");
    }
  }
   /* innerAppLoader(context);
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pop(context);
    Navigator.pushNamed(context, resultRoute,
        arguments: {
          "path": file.path,
        //  "resultList": [],
        });*/
}
