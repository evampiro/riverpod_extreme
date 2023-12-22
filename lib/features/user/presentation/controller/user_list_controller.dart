import 'package:riverpod_extreme/features/user/presentation/widget/user_form.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

/// Controller for User List
class UserListController extends Notifier<List<UserModel>> {
  /// initialize state
  @override
  List<UserModel> build() => loadUsers();

  /// User key for local storage
  final userKey = "users";

  /// Method to load users from storage
  List<UserModel> loadUsers() {
    final users = storage.read(userKey);
    if (users != null) return userModelListFromJson(users);
    return [];
  }

  /// Method to store users from current state to storage
  storeUsers() {
    storage.write(userKey, userModelListToJson(state));
  }

  /// Add user
  addUser(UserModel user) {
    state = [...state..add(user)];
    storeUsers();
  }

  /// Update User info
  updateUser(int index, {required UserModel user}) {
    state = [...state..[index] = user];
    storeUsers();
  }

  /// Remove user matching index
  removeUser(int index) {
    state = [...state..removeAt(index)];
    storeUsers();
  }

  /// handle the add or save button
  handleSubmit(UserModel user) {
    final index = state.indexWhere((element) => element.id == user.id);
    if (index == -1) {
      addUser(user);
    } else {
      updateUser(index, user: user);
    }
  }

  /// Navigate to user form
  ///
  /// ```dart
  /// UserModel? user determines weather to show Add or Edit form
  ///  if(user==null) Add else Edit
  ///
  /// UserForm is used as Widget
  /// ```

  void showUserForm(BuildContext context, {UserModel? user}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => user == null
                ? const UserForm()
                : UserForm(
                    user: user,
                  )));
  }
}
