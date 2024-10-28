import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:miles_task/core/network/reterofit.dart';

class MyApi {
  MyApi._internal() {
    httpWrapper = HttpWrapper();
  }
  static final MyApi _singleton = MyApi._internal();

  factory MyApi() => _singleton;

  HttpWrapper httpWrapper = HttpWrapper();

  RestClient getClient() {
    return httpWrapper.client;
  }
}
  class HttpWrapper {
  // final String _baseUrl = AppConfig.instance!.baseUrl + "";

  Dio dio = Dio();

  Dio dioLogin = Dio();
  final bool SHOW_LOGS = true;

  var client;

  HttpWrapper._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: "https://file.notion.so",
      connectTimeout: const Duration(
        milliseconds: 6000,
      ),
      receiveTimeout: const Duration(
        milliseconds: 6000,
      ),
    );
    dio = Dio(options);
    var cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    dioLogin = Dio(options);
    dioLogin.interceptors.add(CookieManager(cookieJar));

    dio.interceptors
      ..add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers.addAll({
            "content-type": "application/json",
            "Accept": "application/json",
          });
          return handler.next(options);
        },
      ))
      ..add(LogInterceptor(
        responseBody: SHOW_LOGS,
        requestBody: SHOW_LOGS,
      ));

   

    client = RestClient(dio, baseUrl: "https://file.notion.so");
   
  }

  static final HttpWrapper _singleton = HttpWrapper._internal();

  factory HttpWrapper() => _singleton;
}

