import 'package:riverpod_extreme/features/user/domain/user_model.dart';
import 'package:riverpod_extreme/utilities/implementations/repository.dart';

class UserRepository extends Repository<UserModel> {
  UserRepository({super.token, super.client});
  @override
  String get endPoint => "users";

  @override
  UserModel fromJson(String json) => UserModel.fromRawJson(json);

  @override
  List<UserModel> listfromJson(String json) => userModelListFromJson(json);
}
