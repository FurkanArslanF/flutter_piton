import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  final ActionLogin actionLogin;

  TokenModel({
    required this.actionLogin,
  });

  TokenModel copyWith({
    required ActionLogin actionLogin,
  }) {
    return TokenModel(
      actionLogin: actionLogin,
    );
  }

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      actionLogin: ActionLogin.fromJson(json['action_login']),
    );
  }

  Map<String, dynamic> toJson() => {
        "action_login": actionLogin.toJson(),
      };
}

ActionLogin actionLoginModelFromJson(String str) => ActionLogin.fromJson(json.decode(str));

String actionLoginModelToJson(ActionLogin data) => json.encode(data.toJson());

class ActionLogin {
  ActionLogin({
    required this.token,
  });

  final String token;

  ActionLogin copyWith({
    required String token,
  }) {
    return ActionLogin(
      token: token,
    );
  }

  factory ActionLogin.fromJson(Map<String, dynamic> json) {
    return ActionLogin(
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
