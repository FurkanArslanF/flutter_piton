import 'dart:convert';

ActionModel actionModelFromJson(String str) => ActionModel.fromJson(json.decode(str));

String actionModelToJson(ActionModel data) => json.encode(data.toJson());

class ActionModel {
  ActionModel({
    required this.token,
  });

  final String token;

  ActionModel copyWith({
    required String token,
  }) {
    return ActionModel(
      token: token,
    );
  }

  factory ActionModel.fromJson(Map<String, dynamic> json) {
    return ActionModel(
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
