import 'package:get/get.dart';
import '../screens/about_app_screen.dart';
import '../screens/main_screen.dart';
import '../screens/recent_list_screen.dart';
import '../screens/settings_screen.dart';
import 'routes.dart';

class TakoRoute {
  static final pages = [
    GetPage(name: Routes.mainScreen, page: () => const MainScreen()),
    GetPage(name: Routes.aboutAppScreen, page: () => const AboutAppScreen()),
    GetPage(name: Routes.recentListScreen, page: () => RecentListScreen()),
    GetPage(name: Routes.settingsScreen, page: () => const SettingScreen()),
  ];
}
