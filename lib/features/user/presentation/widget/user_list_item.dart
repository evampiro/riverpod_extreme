import 'package:riverpod_extreme/features/user/presentation/state/user_state.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

class UserListItem extends ConsumerWidget {
  const UserListItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(userListProvider
        .select((value) => index < value.length ? value[index] : null));

    final userListController = ref.read(userListProvider.notifier);
    return ListTile(
      onTap: () {
        userListController.showForm(context, model: user);
      },
      // isThreeLine: true,
      title: Text("${(user?.fullName)}"),
      subtitle: Text("${user?.phone}\n${user?.phone}"),
      leading: Text("${user?.id}"),
      trailing: IconButton(
        onPressed: () => userListController.removeAt(index),
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
