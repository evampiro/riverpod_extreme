import 'package:flutter/gestures.dart';
import 'package:riverpod_extreme/features/user/presentation/state/user_state.dart';
import 'package:riverpod_extreme/features/user/presentation/widget/user_list_item.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

class UserList extends ConsumerWidget {
  /// List of users
  const UserList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final users = ref.watch(userListProvider.select((value) => value.length));
    final users = ref.watch(userListProvider.select((value) => value.length));

    return users == 0
        ? emptyWidget(context, ref)
        : ListView.builder(
            itemCount: users,
            itemBuilder: (context, index) {
              return UserListItem(index: index);
            },
          ).animate().fadeIn();
  }

  Center emptyWidget(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person),
          const SizedBox(
            height: 10,
          ),
          SelectableText.rich(TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey),
              children: [
                const TextSpan(text: "Add"),
                TextSpan(
                    text: " Users ",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        ref.read(userListProvider.notifier).showForm(context);
                      },
                    mouseCursor: SystemMouseCursors.click,
                    style: Theme.of(context).textTheme.bodyMedium),
                const TextSpan(text: "to begin!"),
              ])),
        ],
      ),
    );
  }
}
