import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:riverpod_extreme/features/user/domain/user_info_model.dart';

List<UserModel> userModelListFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelListToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel extends Equatable {
  @override
  List<Object?> get props => [
        fullName,
        phone,
        info,
        id,
      ];

  final String? fullName;
  final String? phone;
  final String? password;
  final UserInfoModel? info;
  final String? id;
  final String? token;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const UserModel({
    this.fullName,
    this.phone,
    this.password,
    this.info,
    this.id,
    this.token,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  UserModel copyWith({
    String? fullName,
    String? phone,
    String? password,
    UserInfoModel? info,
    String? id,
    String? token,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      UserModel(
        fullName: fullName ?? this.fullName,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        info: info ?? this.info ?? const UserInfoModel(),
        id: id ?? this.id,
        token: token ?? this.token,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        fullName: json["fullName"],
        phone: json["phone"],
        password: json["password"],
        info:
            json["info"] == null ? null : UserInfoModel.fromJson(json["info"]),
        id: json["_id"],
        token: json["token"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "phone": phone,
        "password": password,
        "info": info?.toJson(),
        "_id": id,
        "token": token,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
