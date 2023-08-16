import 'package:dio/dio.dart';

import '../models/user_model.dart';

class AuthRepository {
  final Dio dio;

  AuthRepository({required this.dio});

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

    return UserModel.fromJson(data['user']);
  }

  // * NEW register
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
}
