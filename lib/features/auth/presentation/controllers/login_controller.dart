import 'package:riverpod_extreme/features/auth/presentation/state/state.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

class LoginController
    extends AutoDisposeNotifier<({String phone, String password})> {
  @override
  ({String phone, String password}) build() {
    return (phone: "", password: "");
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await ref
          .read(authProvider.notifier)
          .login(context, phone: state.phone, password: state.password);

      // ignore: use_build_context_synchronously
      CustomSnack.success(context, message: "Login Successfull");
    }
  }

  update({String? phone, String? password}) {
    state = (phone: phone ?? state.phone, password: password ?? state.password);
  }
}
