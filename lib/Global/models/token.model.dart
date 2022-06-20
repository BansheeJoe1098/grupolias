// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

class Token {
  Token({
    this.accessToken,
  });

  String? accessToken;

  factory Token.fromRawJson(String str) => Token.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["access_token"] == null ? null : json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken == null ? null : accessToken,
      };
}
