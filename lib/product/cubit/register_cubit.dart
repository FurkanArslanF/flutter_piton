// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_piton/product/api/register.dart';
import 'package:flutter_piton/product/entities/register.dart';
import 'package:flutter_piton/product/utility/enum/state_enum.dart';
import 'package:kartal/kartal.dart';

class RegisterCubit extends Cubit<StateEnum> {
  RegisterCubit() : super(StateEnum.initial);

  Future<void> register(RegisterModel accountData) async {
    try {
      final request = await RegisterApiService.instance.register(accountData: accountData);
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
