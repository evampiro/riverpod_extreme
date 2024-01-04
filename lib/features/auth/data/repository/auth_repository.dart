import 'package:riverpod_extreme/utilities/exporter.dart';
import 'package:riverpod_extreme/utilities/implementations/repository.dart';

class AuthRepository extends Repository<UserModel> {
  AuthRepository({super.token, super.client});
  @override
  UserModel fromJson(String json) => UserModel.fromRawJson(json);

  @override
  List<UserModel> listfromJson(String json) => userModelListFromJson(json);

  @override
  String get endPoint => "auth";

  Future<UserModel> login({String? phone, String? password}) async {
    return await add(
        data: {"phone": phone, "password": password},
        path: token == null ? "/login" : "/token");
  }

  Future<UserModel> signUp(
      {required String email,
      required String password,
      required String fullName}) async {
    return await add(data: {"email": email, "password": password});
  }
}
