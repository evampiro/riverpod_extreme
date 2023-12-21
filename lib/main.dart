import 'package:riverpod_extreme/features/user/presentation/widget/user_dashboard.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "App Builder",
        // navigatorKey: Keys.navigatorKey,
        // scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        builder: (context, child) {
          ScreenUtil.init(context,
              designSize: MediaQuery.of(context).size.width < 767
                  ? const Size(390, 844)
                  : const Size(1920, 1080));
          return child!;
        },
        home: const UserDashboard(),
      );
    });
  }
}
