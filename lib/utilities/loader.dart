import 'package:riverpod_extreme/features/auth/presentation/state/state.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

class Loader extends ConsumerStatefulWidget {
  const Loader({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoaderState();
}

class _LoaderState extends ConsumerState<Loader> {
  @override
  void initState() {
    super.initState();
    // initialize auth controller and load data
    Future.delayed(100.milliseconds, () {
      ref.read(authProvider.notifier).init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
