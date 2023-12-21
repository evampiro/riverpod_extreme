import 'package:flutter/foundation.dart';
import 'package:riverpod_extreme/features/user/presentation/state/user_state.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

/// Controller for user form
///
/// Handles all the state and logic
///
/// Being AutoDisposable nothing is stored hence will be used as new instance everytime
class UserFormController
    extends AutoDisposeFamilyNotifier<UserModel, UserModel?> {
  @override
  UserModel build(UserModel? arg) {
    return arg ?? UserModel.empty();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  update({String? name, String? email, String? phone}) {
    state = state.copyWith(
      name: name ?? state.name,
      email: email ?? state.email,
      phone: phone ?? state.phone,
    );
  }

  handleSubmit(BuildContext context) {
    // if validated
    if (formKey.currentState!.validate()) {
      // Comparing current state and initial state
      if (state != arg) {
        ref.read(userListProvider.notifier).handleSubmit(state);
        Navigator.pop(context);
      } else {
        if (kDebugMode) {
          print("no change made");
        }
      }
    }
  }
}
