import 'package:riverpod_extreme/features/user/presentation/state/user_state.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';
import 'package:riverpod_extreme/utilities/validator.dart';

class UserForm extends ConsumerWidget {
  const UserForm({super.key, this.user});

  final UserModel? user;
  @override
  Widget build(BuildContext context, ref) {
    final userFormController = ref.read(userFormProvider(user).notifier);
    final userFormState = ref.watch(userFormProvider(user));

    return Scaffold(
      appBar: AppBar(title: Text(user == null ? "Add User" : "Edit User")),
      body: Form(
        key: userFormController.formKey,
        onChanged: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Id: ${userFormState.id}"),
            field(
              initialValue: userFormState.name,
              label: "Name",
              onChanged: (value) {
                userFormController.update(name: value);
              },
              validator: validate,
            ),
            field(
              initialValue: userFormState.email,
              label: "Email",
              onChanged: (value) {
                userFormController.update(email: value);
              },
              validator: validate,
            ),
            field(
              initialValue: userFormState.phone,
              label: "Phone",
              onChanged: (value) {
                userFormController.update(phone: value);
              },
              validator: validate,
            ),
            const Spacer(),
            FilledButton.icon(
                onPressed: () {
                  userFormController.handleSubmit(context);
                },
                icon: const Icon(Icons.save),
                label: const Text("Save"))
          ]
              .map((e) => e is Spacer
                  ? e
                  : Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      child: e,
                    ))
              .toList(),
        ),
      ),
    );
  }

  TextFormField field(
      {required String label,
      required String initialValue,
      required Function(String) onChanged,
      String? Function(String?)? validator}) {
    return TextFormField(
      onChanged: (value) {
        onChanged(value);
      },
      initialValue: initialValue,
      validator: validator,
      decoration: InputDecoration(labelText: label),
    );
  }
}
