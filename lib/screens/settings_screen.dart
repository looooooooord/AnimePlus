import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/webview_manager.dart';
import '../utils/constants.dart';
import '../widgets/tako_scaffold.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final webViewManagerController = Get.find<WebViewManager>();
    return TakoScaffoldWithBackButton(
      appBarTitle: 'الإعدادات',
      body: ListView(
        children: [
          GetBuilder(
            init: webViewManagerController,
            builder: (_) => SwitchListTile(
              activeThumbColor: tkGradientBlue,
              value: webViewManagerController.isWebView,
              onChanged: webViewManagerController.changeWebViewType,
              title: const Text('استخدام مشغل المتصفح'),
              subtitle: const Text(
                'فعّل هذا الخيار فقط إذا تعذر تشغيل الفيديو',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
