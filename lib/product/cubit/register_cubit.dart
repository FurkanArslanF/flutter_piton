// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_piton/product/api/register.dart';
import 'package:flutter_piton/product/entities/register.dart';
import 'package:kartal/kartal.dart';

class RegisterCubit extends Cubit<String> {
  RegisterCubit() : super("abcd");

  Future<void> register(RegisterModel accountData) async {
    emit("loading");
    var response = await RegisterApiService.instance.register(accountData: accountData);
    if (response.action.token.ext.isNotNullOrNoEmpty) {
      emit("success");
    } else {
      emit("error");
    }
  }
}
