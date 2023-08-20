import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class AuthRepository {
  final Dio dio;

  AuthRepository({required this.dio});

  // * --------------------
  Future<UserModel?> login({
    required email,
    required password,
  }) async {
    Map<String, dynamic> queryParameters = {};
    queryParameters['email'] = email;
    queryParameters['password'] = password;

    Response response = await dio.post(
      '/api/login',
      queryParameters: queryParameters,
    );

    var data = response.data;

    // !---------------------
    var token = data['token'];
    if (token != null) {
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
    }
    // !---------------------

    return UserModel.fromJson(data['user']);
  }

  // * ------------------
  Future<UserModel?> register({
    required name,
    required email,
    required password,
  }) async {
    Map<String, dynamic> queryParameters = {};
    queryParameters['name'] = name;
    queryParameters['email'] = email;
    queryParameters['password'] = password;

    Response response = await dio.post(
      '/api/register',
      queryParameters: queryParameters,
    );

    var data = response.data;
    

    return UserModel.fromJson(data['user']);
  }
  
  // * ----------------------
  Future<UserModel> getUser() async {
    Response response = await dio.get('/api/me');
    return UserModel.fromJson(response.data);
  }
}
