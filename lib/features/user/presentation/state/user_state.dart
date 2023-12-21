import 'package:riverpod_extreme/features/user/presentation/controller/user_form_controller.dart';
import 'package:riverpod_extreme/features/user/presentation/controller/user_list_controller.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

final userListProvider = NotifierProvider<UserListController, List<UserModel>>(
    UserListController.new);
final userFormProvider = AutoDisposeNotifierProviderFamily<UserFormController,
    UserModel, UserModel?>(UserFormController.new);
