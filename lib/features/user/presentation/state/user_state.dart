import 'package:riverpod_extreme/features/user/presentation/controller/user_async_list_controller.dart';
import 'package:riverpod_extreme/features/user/presentation/controller/user_form_controller.dart';
import 'package:riverpod_extreme/features/user/presentation/controller/user_list_controller.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

final userListProvider = NotifierProvider<UserListController, List<UserModel>>(
    UserListController.new);

final userAsyncListProvider =
    AsyncNotifierProvider.autoDispose<UserAsyncListController, List<UserModel>>(
        UserAsyncListController.new);

final userMapProvider =
    NotifierProvider<UserMapController, Map<String, UserModel>>(
        UserMapController.new);
final userFormProvider = AutoDisposeNotifierProviderFamily<UserFormController,
    UserModel, UserModel?>(UserFormController.new);
