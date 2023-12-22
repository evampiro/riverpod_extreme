import 'package:riverpod_extreme/features/user/presentation/state/user_state.dart';
import 'package:riverpod_extreme/features/user/presentation/widget/user_list.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

class UserDashboard extends ConsumerWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userListController = ref.read(userListProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: const Column(
        children: [
          Expanded(child: UserList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userListController.showUserForm(context);
        },
        child: const Icon(Icons.add_box_rounded),
      ),
    );
  }
}
