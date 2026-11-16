import 'package:get/get.dart';
import '../helpers/bookmark_manager.dart';
import '../helpers/recent_watch_manager.dart';

class ManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RecentWatchManager(), permanent: true);
    Get.put(BookMarkManager(), permanent: true);
  }
}
