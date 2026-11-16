import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../helpers/update_manager.dart';
import '../utils/constants.dart';
import '../widgets/tako_scaffold.dart';
import '../widgets/update_alert_dialog.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TakoScaffoldWithBackButton(
      appBarTitle: 'حول التطبيق',
      body: ListView(
        children: [
          const ListTile(
            title: Text('الإصدار'),
            subtitle: Text(version),
          ),
          const ListTile(
            title: Text('المطور'),
            subtitle: Text('فريق AnimePlus'),
          ),
          const ListTile(
            title: Text('المساهمون'),
            subtitle: Text('DDavidPrime, CntrlX'),
          ),
          ListTile(
            onTap: () => _launchUrl(takoPlay),
            title: const Text('شفرة المصدر'),
            subtitle: const Text(takoPlay),
          ),
          const ListTile(
            title: Text('الترخيص'),
            subtitle: Text(license),
          ),
          ListTile(
            onTap: () async {
              final updateManager = Get.find<UpdateManager>();
              await updateManager.checkForUpdate();
              if (updateManager.isUpdateAvailable) {
                await Get.dialog(UpdateAlertDialog(
                  downloadLink: updateManager.downloadLink!,
                  isDirectApkDownload: updateManager.usesApkDownload,
                ));
              } else {
                await Get.dialog(const AlertDialog(
                  backgroundColor: tkDarkBlue,
                  content: Text('لا يوجد تحديث متاح حاليًا.'),
                ));
              }
            },
            title: const Text('التحقق من وجود تحديث'),
          ),
          ListTile(
            onTap: () => _launchUrl(mailing),
            title: const Text('التواصل مع المطور'),
          ),
        ],
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('تعذر فتح $url');
  }
}
