import 'dart:convert';

import 'package:flutter_piton/product/entities/action.dart';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  final Action action;

  TokenModel({
    required this.action,
  });

  TokenModel copyWith({
    required Action action,
  }) {
    return TokenModel(
      action: action,
    );
  }

  factory TokenModel.fromJson(Map<String, dynamic> json, {String? action}) {
    return TokenModel(
      action: Action.fromJson(json[action]),
    );
  }

  Map<String, dynamic> toJson() => {
        "action_login": action,
        "action_register": action,
      };
}
