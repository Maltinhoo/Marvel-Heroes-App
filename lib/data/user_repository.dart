import 'dart:io';

import 'package:dio/dio.dart';

import '../shared/exceptions/exceptions.dart';

class UserRepository {
  final Dio dio;

  UserRepository({
    required this.dio,
  });

  Future<String> login({
    required String email,
    required String pass,
  }) async {
    try {
      final response = await dio.post('/login', data: {
        'email': email,
        'pass': pass,
      });
      return response.data['token'];
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException();
      }
      rethrow;
    } on SocketException {
      throw NoInternetConnectionException();
    } catch (e) {
      rethrow;
    }
  }
}
