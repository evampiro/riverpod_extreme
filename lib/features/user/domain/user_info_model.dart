import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserInfoModel extends Equatable {
  @override
  List<Object?> get props => [email, emailVerfied, address, gender, dob];
  final String? email;
  final bool? emailVerfied;
  final String? address;
  final String? gender;
  final DateTime? dob;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserInfoModel({
    this.email,
    this.emailVerfied,
    this.address,
    this.gender,
    this.dob,
    this.createdAt,
    this.updatedAt,
  });

  UserInfoModel copyWith({
    String? email,
    bool? emailVerfied,
    String? address,
    String? gender,
    DateTime? dob,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserInfoModel(
        email: email ?? this.email,
        emailVerfied: emailVerfied ?? this.emailVerfied,
        address: address ?? this.address,
        gender: gender ?? this.gender,
        dob: dob ?? this.dob,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UserInfoModel.fromRawJson(String str) =>
      UserInfoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        email: json["email"],
        emailVerfied: json["emailVerfied"],
        address: json["address"],
        gender: json["gender"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "emailVerfied": emailVerfied,
        "address": address,
        "gender": gender,
        "dob": dob?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
