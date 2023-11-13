import 'package:dio/dio.dart';
import 'package:handz/helper/network/app_urls.dart';
import 'logging_interceptor.dart';

class ApiBaseHelper {
  final initTries = 3;
  final retryWaitingSeconds = 1;

  static const String _contentType = 'Content-Type';

  static const String _xAuthorization = 'X-Authorization';

  Dio? _dio;

  ApiBaseHelper() {
    BaseOptions dioOptions = BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 30000),
      receiveTimeout: const Duration(seconds: 30000),
      headers: {
        _contentType: 'application/json',
      },
    );

    _dio = Dio(dioOptions)..interceptors.add(LoggingInterceptors());
  }

  Future<Response> get(String path, data) async {
    var retries = initTries;
    var response;
    Future<Response> _get() async {
      if (data == null) {
        response = await getDio().get(
          path,
          /* options: Options(
              headers: {
                'authorization': token
              }
          )*/
        );
      } else {
        response = await getDio().get(path, data: data);
      }
      return response;
    }

    while (true) {
      try {
        retries--;
        return await _get();
      } catch (e) {
        await Future.delayed(Duration(seconds: retryWaitingSeconds));
        if (retries <= 0) rethrow;
      }
    }
  }

  Future<Response> post(String path, data) async {
    var retries = initTries;

    Future<Response> _post() async {
      var response = await getDio().post(
        path,
        data: data,
        /*       options: Options(
          headers: {
            'authorization': token
          }
        )*/
      );
      return response;
    }

    while (true) {
      try {
        retries--;
        return await _post();
      } catch (e) {
        await Future.delayed(Duration(seconds: retryWaitingSeconds));
        if (retries <= 0) rethrow;
      }
    }
  }

  Future<Response> put(String path, data) async {
    var retries = initTries;

    Future<Response> _post() async {
      var response = await getDio().put(
        path,
        data: data,
/*        options: Options(
          headers: {
            'authorization': token
          },
        ),*/
      );
      return response;
    }

    while (true) {
      try {
        retries--;
        return await _post();
      } catch (e) {
        await Future.delayed(Duration(seconds: retryWaitingSeconds));
        if (retries <= 0) rethrow;
      }
    }
  }

  Dio getDio() => _dio!;

/*  String handleError(DioError error) {
    String errorDescription = "";
    switch (error.type) {
      case DioErrorType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        errorDescription =
        "Received invalid status code: ${error.response!.statusCode}";
        break;
      case DioErrorType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
      case DioErrorType.other:
        errorDescription =
        "Connection to API server failed due to internet connection";
        break;
    }
    return errorDescription;
  }*/
}
