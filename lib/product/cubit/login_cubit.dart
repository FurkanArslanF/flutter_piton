// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_piton/product/api/login.dart';
import 'package:flutter_piton/product/entities/login.dart';
import 'package:flutter_piton/product/utility/enum/state_enum.dart';
import 'package:kartal/kartal.dart';

class LoginCubit extends Cubit<StateEnum> {
  LoginCubit() : super(StateEnum.initial);

  Future<void> login(LoginModel accountData) async {
    try {
      final request = await LoginApiService.instance.login(accountData: accountData);
      if (request.action.token.ext.isNotNullOrNoEmpty) {
        emit(StateEnum.success);
      } else if (request.action.token.ext.isNullOrEmpty) {
        emit(StateEnum.error);
      } else {
        emit(StateEnum.loading);
      }
    } catch (e) {
      emit(StateEnum.error);
    }
  }
}
