// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_piton/product/api/login.dart';
import 'package:flutter_piton/product/entities/action.dart';
import 'package:flutter_piton/product/entities/login.dart';
import 'package:flutter_piton/product/entities/token.dart';
import 'package:kartal/kartal.dart';

class LoginCubit extends Cubit<TokenModel> {
  LoginCubit() : super(TokenModel(action: ActionModel(token: "")));

  Future<TokenModel> login(LoginModel accountData) async {
    var response = await LoginApiService.instance.login(accountData: accountData);
    if (response.action.token.ext.isNotNullOrNoEmpty) {
      emit(response);
      return response;
    } else {
      emit(response);
      return response;
    }
  }
}
