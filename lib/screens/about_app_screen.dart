import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/tako_scaffold.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});
  @override
  Widget build(BuildContext context) => TakoScaffoldWithBackButton(
        appBarTitle: 'حول التطبيق',
        body: ListView(children: const [
          ListTile(title: Text('الإصدار'), subtitle: Text(version)),
          ListTile(title: Text('الترخيص'), subtitle: Text(license)),
        ]),
      );
}
