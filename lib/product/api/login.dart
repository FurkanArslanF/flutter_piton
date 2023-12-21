import 'dart:io';

import 'package:flutter_piton/product/api/dio_mixin.dart';
import 'package:flutter_piton/product/entities/login.dart';
import 'package:flutter_piton/product/entities/token.dart';

abstract class ILoginService {
  Future<TokenModel> login({required LoginModel accountData});
}

class LoginApiService extends ILoginService with DioServiceMixin {
  LoginApiService._();
  static final instance = LoginApiService._();
  static const apiHttps = 'login';

  late TokenModel _token;

  @override
  Future<TokenModel> login({required LoginModel accountData}) async {
    try {
      final response = await dio.post(
        apiHttps,
        data: {
          "email": accountData.email,
          "password": accountData.password,
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          _token = TokenModel.fromJson(data);
        }
        return _token;
      }
      return _token;
    } catch (e) {
      rethrow;
    }
  }
}
