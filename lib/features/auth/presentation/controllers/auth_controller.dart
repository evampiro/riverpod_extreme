import 'package:riverpod_extreme/features/auth/data/repository/auth_repository.dart';
import 'package:riverpod_extreme/features/auth/presentation/widgets/login_form.dart';
import 'package:riverpod_extreme/features/user/presentation/widget/user_dashboard.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

class AuthController extends Notifier<UserModel?> {
  @override
  UserModel? build() {
    return loadUser();
  }

  final key = "currentUser";
  UserModel? loadUser() {
    final storedUser = storage.read(key);

    if (storedUser == null) return null;

    final user = UserModel.fromRawJson(storedUser);

    return user;
  }

  init(BuildContext context) async {
    if (state == null) {
      return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginForm(),
          ));
    }
    loginWithToken();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const UserDashboard(),
        ));
  }

  loginWithToken() async {
    if (state?.token != null) {
      state = await AuthRepository(token: state?.token).login();
    }
  }

  login(BuildContext context,
      {required String phone, required String password}) async {
    final client = await ref.getDebouncedHttpClient();
    state = await AuthRepository(client: client)
        .login(phone: phone, password: password);

    storage.write(key, state?.toRawJson());

    Future.delayed(100.milliseconds, () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const UserDashboard()));
    });
  }

  logout(BuildContext context) {
    storage.remove(key);
    state = null;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginForm()));
  }
}
