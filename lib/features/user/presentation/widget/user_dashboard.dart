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
        actions: [
          Row(
            children: [
              const Text("Preserve State"),
              const SizedBox(
                width: 10,
              ),
              Consumer(builder: (context, ref, child) {
                ref.watch(userListProvider);
                return Switch(
                    value: userListController.useStorage,
                    onChanged: (val) {
                      userListController.switchUseStorage();
                    });
              }),
            ],
          )
        ],
      ),
      body: const Column(
        children: [
          Expanded(child: UserList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userListController.showForm(context);
        },
        child: const Icon(Icons.add_box_rounded),
      ),
    );
  }
}
