import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';
import '../utils/routes.dart';

class AnimeDrawer extends StatelessWidget {
  const AnimeDrawer({super.key});
  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: tkDarkerBlue,
        child: SafeArea(child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 12, 24),
            child: Row(children: [
              const Icon(Icons.play_arrow_rounded, color: tkGradientBlue, size: 32),
              const SizedBox(width: 10),
              Expanded(child: Text('AnimePlus', style: GoogleFonts.dmSans(fontSize: 23, fontWeight: FontWeight.w700))),
              IconButton(onPressed: Get.back, icon: const Icon(Icons.close_rounded, color: tkMutedText)),
            ]),
          ),
          _item(Icons.tune_rounded, 'الإعدادات', () => Get.toNamed(Routes.settingsScreen)),
          _item(Icons.info_outline_rounded, 'حول التطبيق', () => Get.toNamed(Routes.aboutAppScreen)),
        ])),
      );
  Widget _item(IconData icon, String label, VoidCallback onTap) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          leading: Icon(icon, color: tkCoral, size: 21),
          title: Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 13, color: tkMutedText),
          onTap: onTap,
        ),
      );
}
