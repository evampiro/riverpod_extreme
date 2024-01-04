import 'package:flutter/gestures.dart';
import 'package:riverpod_extreme/utilities/exporter.dart';
import 'package:riverpod_extreme/utilities/loader.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // GetStorage().erase();
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
        scrollBehavior: MyScroll(),
        theme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        builder: (context, child) {
          ScreenUtil.init(context,
              designSize: MediaQuery.of(context).size.width < 767
                  ? const Size(390, 844)
                  : const Size(1920, 1080));
          return child!;
        },
        home: const Loader(),
      );
    });
  }
}

class MyScroll extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
