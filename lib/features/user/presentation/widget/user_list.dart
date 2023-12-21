import 'package:riverpod_extreme/features/user/presentation/state/user_state.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

class UserList extends ConsumerWidget {
  /// List of users
  const UserList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final users = ref.watch(userListProvider);
    final userListController = ref.read(userListProvider.notifier);
    return Expanded(
        child: ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          onTap: () {
            userListController.showUserForm(context, user: user);
          },
          title: Text(user.name),
          subtitle: Text(user.email),
          leading: Text(user.id),
          trailing: Text(user.phone),
        );
      },
    ));
  }
}
