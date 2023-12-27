import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

List<UserModel> userModelListFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelListToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel extends Equatable {
  @override
  List<Object?> get props => [name, phone, email, id, admin];

  final String id;
  final String? name;
  final String? phone;
  final String? email;
  final bool admin;

  const UserModel(
      {required this.id,
      this.name,
      this.phone,
      this.email,
      this.admin = false});

  UserModel copyWith(
          {String? id,
          String? name,
          String? phone,
          String? email,
          bool? admin}) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        admin: admin ?? this.admin,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        admin: json["admin"] ?? false,
      );
  factory UserModel.empty() => UserModel(id: shortHash(Container()));
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "admin": admin,
      };
}
