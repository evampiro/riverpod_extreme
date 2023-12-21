import 'dart:convert';
import 'dart:math';

import 'package:equatable/equatable.dart';

List<UserModel> userModelListFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelListToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel extends Equatable {
  @override
  List<Object?> get props => [name, phone, email, id];

  final String id;
  final String name;
  final String phone;
  final String email;

  const UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
      );
  factory UserModel.empty() => UserModel(
      id: Random().nextInt(5000).toString(), name: "", phone: "", email: "");
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
      };
}
