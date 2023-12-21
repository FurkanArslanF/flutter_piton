import 'dart:io';
import 'package:flutter_piton/product/api/dio_mixin.dart';
import 'package:flutter_piton/product/entities/register.dart';
import 'package:flutter_piton/product/entities/token.dart';

abstract class IRegisterService {
  Future<TokenModel> register({required RegisterModel accountData});
}

class RegisterApiService extends IRegisterService with DioServiceMixin {
  RegisterApiService._();
  static final instance = RegisterApiService._();
  static const apiHttps = 'register';

  late TokenModel _token;

  @override
  Future<TokenModel> register({required RegisterModel accountData}) async {
    try {
      final response = await dio.post(
        apiHttps,
        data: {
          "email": accountData.email,
          "name": accountData.name,
          "password": accountData.password,
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          _token = TokenModel.fromJson(data, action: 'action_register');
        }
        return _token;
      }
      return _token;
    } catch (e) {
      rethrow;
    }
  }
}
