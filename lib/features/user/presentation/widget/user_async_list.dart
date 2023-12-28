import 'package:riverpod_extreme/features/user/presentation/state/user_state.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

class UserAsyncList extends ConsumerWidget {
  const UserAsyncList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final asyncList = ref.watch(userAsyncListProvider);
    final asyncListController = ref.read(userAsyncListProvider.notifier);

    return LayoutBuilder(builder: (context, constraint) {
      return RefreshIndicator(
        onRefresh: () async => ref.refresh(userAsyncListProvider),
        child: asyncList.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final user = data[index];
                return ListTile(
                  onTap: () =>
                      asyncListController.showForm(context, model: user),
                  title: Text("${user.name}"),
                );
              },
            );
          },
          error: (error, stackTrace) =>
              refreshEnabledWidget(Text("$error"), constraint),
          loading: () => refreshEnabledWidget(
              const CircularProgressIndicator(), constraint),
        ),
      );
    });
  }

  Widget refreshEnabledWidget(Widget child, BoxConstraints constraints) {
    return ListView(
      children: [
        SizedBox(height: constraints.maxHeight, child: Center(child: child))
      ],
    );
  }
}
