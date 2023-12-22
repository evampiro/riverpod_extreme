import 'package:riverpod_extreme/features/user/presentation/state/user_state.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

/// Controller for user form
///
/// Handles all the state and logic
///
/// Being AutoDisposable nothing is stored hence will be used as new instance everytime
class UserFormController extends FormController<UserModel> {
  @override
  UserModel build(UserModel? arg) {
    return arg ?? UserModel.empty();
  }

  @override
  updateState({String? name, String? email, String? phone, bool? admin}) {
    state = state.copyWith(
      name: name ?? state.name,
      email: email ?? state.email,
      phone: phone ?? state.phone,
      admin: admin ?? state.admin,
    );
  }

  @override
  handleSubmit(BuildContext context) {
    // if validated
    if (isValidated) {
      // Comparing current state and initial state
      if (state != arg) {
        ref.read(userListProvider.notifier).handleSubmit(state);

        Navigator.pop(context);
      } else {
        showSnack(context, message: "No changes made!");
      }
    }
  }

  showSnack(BuildContext context, {String? message}) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("No changes Made!"),
    ));
  }
}
