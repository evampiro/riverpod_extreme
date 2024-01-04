import 'package:riverpod_extreme/features/user/presentation/state/user_state.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

class UserListMap extends ConsumerWidget {
  const UserListMap({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final count = ref.watch(userMapProvider.select((value) => value.length));
    final entries = ref.read(userMapProvider).entries.toList();
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, index) {
        final user = entries[index].value;
        return ListTile(
          title: Text("name: ${user.fullName}"),
        );
      },
    );
  }
}
