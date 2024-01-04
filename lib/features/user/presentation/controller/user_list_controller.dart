import 'dart:convert';

import 'package:riverpod_extreme/features/user/presentation/widget/user_form.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';
import 'package:riverpod_extreme/utilities/implementations/list_controller.dart';

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

class UserMapController extends Notifier<Map<String, UserModel>> {
  @override
  Map<String, UserModel> build() {
    return load();
  }

  final key = "userMap";
  load() {
    final data = storage.read(key);
    if (data == null) return <String, UserModel>{};

    return Map.from(jsonDecode(data)).map((key, value) =>
        MapEntry<String, UserModel>(key, UserModel.fromJson(value)));
  }

  store() {
    storage.write(
        key,
        jsonEncode(state.map(
            (key, value) => MapEntry<String, dynamic>(key, value.toJson()))));
  }

  add([UserModel? model]) {
    model ??= const UserModel();
    state = {...state..[model.id!] = model};
    store();
  }
}

/// Controller for User List
