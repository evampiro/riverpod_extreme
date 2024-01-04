import 'package:riverpod_extreme/common/button.dart';
import 'package:riverpod_extreme/features/auth/presentation/state/state.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';
import 'package:riverpod_extreme/utilities/validator.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final loginFormState = ref.watch(loginProvider);
    final loginController = ref.read(loginProvider.notifier);
    return Scaffold(
      body: Form(
        key: loginController.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login to Continue",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextFormField(
              onChanged: (value) {
                loginController.update(phone: value);
              },
              validator: (value) => validate(value),
              initialValue: loginFormState.phone,
              decoration: const InputDecoration(
                  labelText: "Phone",
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            ),
            TextFormField(
              onChanged: (value) {
                loginController.update(password: value);
              },
              validator: (value) => validate(value),
              initialValue: loginFormState.password,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: "Password",
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            ),
            GuardedButton(
              onPressed: () async {
                await loginController.login(context);
              },
              label: "Login",
            ),
          ]
              .map((e) => Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
