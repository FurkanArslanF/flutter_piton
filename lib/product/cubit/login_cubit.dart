// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_piton/product/api/login.dart';
import 'package:flutter_piton/product/entities/login.dart';
import 'package:kartal/kartal.dart';

class LoginCubit extends Cubit<String> {
  LoginCubit() : super("");

  Future<void> login(LoginModel accountData) async {
    try {
      final request = await LoginApiService.instance.login(accountData: accountData);
      if (request.actionLogin.token.ext.isNotNullOrNoEmpty) {
        emit("success");
      } else if (request.actionLogin.token.ext.isNullOrEmpty) {
        emit("failure");
      } else {
        emit("loading");
      }
    } catch (e) {
      emit(e.toString());
    }
  }
}
