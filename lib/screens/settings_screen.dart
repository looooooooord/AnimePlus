import 'package:flutter/material.dart';
import '../widgets/tako_scaffold.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) => const TakoScaffoldWithBackButton(
        appBarTitle: 'الإعدادات',
        body: SizedBox.shrink(),
      );
}
