import 'dart:convert';

Action actionModelFromJson(String str) => Action.fromJson(json.decode(str));

String actionModelToJson(Action data) => json.encode(data.toJson());

class Action {
  Action({
    required this.token,
  });

  final String token;

  Action copyWith({
    required String token,
  }) {
    return Action(
      token: token,
    );
  }

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
