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

            field<String?>(
              provider: formProvider.select((value) => value.fullName),
              label: "Name",
              onChanged: (value) => userFormController
                  .updateState(userFormState.copyWith(fullName: value)),
              validator: validate,
            ),

            field(
              provider: formProvider.select((value) => value.phone),
              label: "Phone",
              onChanged: (value) => userFormController
                  .updateState(userFormState.copyWith(phone: value)),
              validator: validate,
            ),

            field(
              provider: formProvider.select((value) => value.info?.email),
              label: "Email",
              onChanged: (value) => userFormController.updateState(userFormState
                  .copyWith(info: userFormState.info?.copyWith(email: value))),
              validator: validate,
            ),
            field(
              provider:
                  formProvider.select((value) => value.info?.emailVerfied),
              label: "Email Verified",
              onChanged: (value) => userFormController.updateState(
                  userFormState.copyWith(
                      info: userFormState.info?.copyWith(emailVerfied: value))),
              validator: validate,
            ),
            field(
              provider: formProvider.select((value) => value.info?.address),
              label: "Address",
              onChanged: (value) => userFormController.updateState(
                  userFormState.copyWith(
                      info: userFormState.info?.copyWith(address: value))),
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
      if (state is bool) {
        return SwitchListTile(
          contentPadding: EdgeInsets.zero,
          value: state,
          onChanged: (value) {
            onChanged(value as T);
          },
          title: Text(label),
        );
      } else {
        return TextFormField(
          onChanged: (value) {
            onChanged(value as T);
          },
          initialValue: state as String?,
          validator: validator,
          decoration: InputDecoration(
              labelText: label,
              floatingLabelBehavior: FloatingLabelBehavior.auto),
        );
      }
    });
  }
}
