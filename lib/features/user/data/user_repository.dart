import 'package:riverpod_extreme/features/user/domain/user_model.dart';
import 'package:riverpod_extreme/utilities/implementations/repository.dart';

class UserRepository<T> extends Repository<UserModel> {
  UserRepository({super.token});
  @override
  String get endPoint => "users";
  @override
  UserModel fromJson(String json) => UserModel.fromRawJson(json);
  @override
  List<UserModel> listfromJson(String json) => userModelListFromJson(json);
}
