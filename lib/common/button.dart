import 'dart:async';

import 'package:riverpod_extreme/utilities/exporter.dart';

final guardedButtonProvider =
    AsyncNotifierProvider.autoDispose(GuardedButtonController.new);

class GuardedButtonController extends AutoDisposeAsyncNotifier {
  @override
  FutureOr build() async {
    return;
  }

  onPressed(Future Function() function) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      return await function();
    });
  }
}

class GuardedButton extends ConsumerWidget {
  const GuardedButton({
    super.key,
    required this.onPressed,
    this.label = "Press Me",
    this.showSnack = true,
  });
  final Function onPressed;
  final String label;
  final bool showSnack;

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(guardedButtonProvider);
    final controller = ref.read(guardedButtonProvider.notifier);
    // listen to provider individually
    if (showSnack) {
      ref.listen<AsyncValue<void>>(
        guardedButtonProvider,
        (_, state) {
          state.whenOrNull(
              error: (error, _) =>
                  CustomSnack.error(context, message: error.toString()));
        },
      );
    }
    //
    return button(state.isLoading, controller);
  }

  Widget button(bool isLoading, GuardedButtonController controller) {
    return FilledButton.icon(
        onPressed: isLoading
            ? null
            : () {
                controller.onPressed(() => onPressed());
              },
        icon: loadingWidget(isLoading),
        label: Text(label));
  }

  Widget loadingWidget(bool isLoading) {
    return isLoading
        ? const SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : Container();
  }
}
