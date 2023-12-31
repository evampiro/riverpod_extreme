import 'package:riverpod_extreme/common/button.dart';
import 'package:riverpod_extreme/features/auth/presentation/state/state.dart';
import 'package:riverpod_extreme/features/user/presentation/state/user_state.dart';
import 'package:riverpod_extreme/features/user/presentation/widget/user_async_list.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

class UserDashboard extends ConsumerWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final userListController = ref.read(userListProvider.notifier);
    final userListController = ref.read(userAsyncListProvider.notifier);
    // final userMapController = ref.read(userMapProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        actions: [
          Row(
            children: [
              // const Text("Preserve State"),
              // const SizedBox(
              //   width: 10,
              // ),
              // Consumer(builder: (context, ref, child) {
              //   ref.watch(userAsyncListProvider);
              //   return Switch(
              //       value: userListController.useStorage,
              //       onChanged: (val) {
              //         userListController.switchUseStorage();
              //       });
              // }),
              IconButton(
                  onPressed: () {
                    ref.read(authProvider.notifier).logout(context);
                  },
                  icon: const Icon(Icons.logout))
            ],
          )
        ],
      ),
      body: const Column(
        children: [
          Expanded(child: UserAsyncList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userListController.showForm(context);
          // userMapController.add();
        },
        child: const Icon(Icons.add_box_rounded),
      ),
    );
  }
}
