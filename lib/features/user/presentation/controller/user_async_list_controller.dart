import 'package:riverpod_extreme/features/user/data/user_repository.dart';
import 'package:riverpod_extreme/features/user/presentation/widget/user_form.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';
import 'package:riverpod_extreme/utilities/implementations/async_list_controller.dart';
import 'package:riverpod_extreme/utilities/implementations/repository.dart';

class UserAsyncListController extends AsyncListController<UserModel> {
  // bool get useStorage => super.useStorage;

  @override
  List<UserModel> fromStorage(String data) => userModelListFromJson(data);

  @override
  String toStorage() => userModelListToJson((state.value) ?? []);

  @override
  String get key => "users";

  @override
  bool findById(UserModel element, UserModel current) =>
      element.id == current.id;

  @override
  Widget formWidget(UserModel? model) => UserForm(user: model);

  @override
  Repository<UserModel> get respository => UserRepository();
}
