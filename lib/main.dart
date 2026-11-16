import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../bindings/managers_binding.dart';
import '../theme/tako_theme.dart';
import '../utils/tako_route.dart';

Future<void> main() async {
  _configureApp();
  runApp(const MyApp());
}

void _configureApp() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.initialBinding});

  final Bindings? initialBinding;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AnimePlus',
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
      defaultTransition: Transition.cupertino,
      theme: TakoTheme.dark(),
      initialRoute: '/',
      initialBinding: initialBinding ?? ManagerBinding(),
      getPages: TakoRoute.pages,
    );
  }
}
