import 'package:riverpod_extreme/features/auth/presentation/controllers/auth_controller.dart';
import 'package:riverpod_extreme/features/auth/presentation/controllers/login_controller.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

final authProvider =
    NotifierProvider<AuthController, UserModel?>(AuthController.new);

final loginProvider = NotifierProvider.autoDispose<LoginController,
    ({String phone, String password})>(LoginController.new);
