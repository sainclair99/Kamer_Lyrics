import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenInterceptor extends QueuedInterceptor {
  String? accessToken;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var accessToken = prefs.getString('token');

    if (accessToken != null) {
      options.headers['Authorization'] = "Bearer $accessToken";
    }

    return handler.next(options);
  }
}
