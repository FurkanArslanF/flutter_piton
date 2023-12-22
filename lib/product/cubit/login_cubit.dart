// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_piton/product/api/login.dart';
import 'package:flutter_piton/product/entities/login.dart';
import 'package:kartal/kartal.dart';

class LoginCubit extends Cubit<String> {
  LoginCubit() : super("");

  login(LoginModel accountData) async {
    emit("loading");
    var response = await LoginApiService.instance.login(accountData: accountData);
    if (response.action.token.ext.isNotNullOrNoEmpty) {
      emit("success");
    } else {
      emit("error");
    }
  }
}
