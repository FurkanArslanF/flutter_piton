import 'dart:convert';

import 'package:flutter_piton/product/entities/action.dart';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  final ActionModel action;

  TokenModel({
    required this.action,
  });

  TokenModel copyWith({
    required ActionModel action,
  }) {
    return TokenModel(
      action: action,
    );
  }

  factory TokenModel.fromJson(Map<String, dynamic> json, {String? action}) {
    return TokenModel(
      action: ActionModel.fromJson(json[action]),
    );
  }

  Map<String, dynamic> toJson() => {
        "action_login": action,
        "action_register": action,
      };
}
