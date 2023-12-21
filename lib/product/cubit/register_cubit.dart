// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_piton/product/api/register.dart';
import 'package:flutter_piton/product/entities/register.dart';
import 'package:kartal/kartal.dart';

class RegisterCubit extends Cubit<String> {
  RegisterCubit() : super("");

  Future<void> register(RegisterModel accountData) async {
    try {
      final request = await RegisterApiService.instance.register(accountData: accountData);
      if (request.action.token.ext.isNotNullOrNoEmpty) {
        emit("success");
      } else if (request.action.token.ext.isNullOrEmpty) {
        emit("failure");
      } else {
        emit("loading");
      }
    } catch (e) {
      emit(e.toString());
    }
  }
}
