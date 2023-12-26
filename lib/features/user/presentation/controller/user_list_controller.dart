import 'package:riverpod_extreme/features/user/presentation/widget/user_form.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';
import 'package:riverpod_extreme/utilities/list_controller.dart';

/// Controller for User List
class UserListController extends ListController<UserModel> {
  // bool get useStorage => super.useStorage;

  @override
  List<UserModel> fromStorage(String data) => userModelListFromJson(data);

  @override
  String toStorage() => userModelListToJson(state);

  @override
  String get key => "users";

  @override
  bool findById(UserModel element, UserModel current) =>
      element.id == current.id;

  @override
  Widget formWidget(UserModel? model) => UserForm(user: model);
}
