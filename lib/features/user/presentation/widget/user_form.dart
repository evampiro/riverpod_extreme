import 'package:riverpod_extreme/features/user/presentation/state/user_state.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';
import 'package:riverpod_extreme/utilities/validator.dart';

class UserForm extends ConsumerWidget {
  const UserForm({super.key, this.user});

  final UserModel? user;
  @override
  Widget build(BuildContext context, ref) {
    final formProvider = userFormProvider(user);
    final userFormController = ref.read(formProvider.notifier);
    final userFormState = ref.read(formProvider);
    return Scaffold(
      appBar: AppBar(title: Text(user == null ? "Add User" : "Edit User")),
      body: Form(
        key: userFormController.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Id: ${userFormState.id}"),
            field(
              provider: formProvider.select((value) => value.admin),
              label: "Admin",
              onChanged: (value) =>
                  userFormController.updateState(admin: value),
              validator: validate,
            ),
            field(
              provider: formProvider.select((value) => value.name),
              label: "Name",
              onChanged: (value) => userFormController.updateState(name: value),
              validator: validate,
            ),
            field(
              provider: formProvider.select((value) => value.email),
              label: "Email",
              onChanged: (value) =>
                  userFormController.updateState(email: value),
              validator: validate,
            ),
            field(
              provider: formProvider.select((value) => value.phone),
              label: "Phone",
              onChanged: (value) =>
                  userFormController.updateState(phone: value),
              validator: validate,
            ),
            // const Spacer(),
            const SizedBox(
              height: 30,
            ),
            FilledButton.icon(
                onPressed: () {
                  userFormController.handleSubmit(context);
                },
                icon: const Icon(Icons.save),
                label: const Text("Save"))
          ]
              .map((e) => e is SizedBox
                  ? e
                  : Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child: e,
                    ))
              .toList(),
        ),
      ),
    );
  }

  Widget field<T>(
      {required String label,
      required Function(T) onChanged,
      required ProviderListenable<T> provider,
      String? Function(String?)? validator}) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(provider);
      if (T is bool) {
        return SwitchListTile(
          contentPadding: EdgeInsets.zero,
          value: state as bool,
          onChanged: (value) {
            onChanged(value as T);
          },
          title: Text(label),
        );
      } else if (T is String) {
        return TextFormField(
          onChanged: (value) {
            onChanged(value as T);
          },
          initialValue: state.toString(),
          validator: validator,
          decoration: InputDecoration(labelText: label),
        );
      } else {
        return Container();
      }
    });
  }
}
