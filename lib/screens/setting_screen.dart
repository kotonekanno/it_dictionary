import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/setting_provider.dart';
import '../widgets/centered_max_width.dart';
import '../widgets/setting_item.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wordProvider = context.watch<SettingProvider>();
    final controller = TextEditingController(text: wordProvider.appPrefix);

    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        centerTitle: true,
      ),
      body: CenteredMaxWidth(
        maxWidth: 800,
        child: Column(
          children: [
            Divider(height: 30),
            AppTitleSetting(controller: controller),
            Divider(height: 30),
            DeleteSetting(),
            Divider(height: 30),
          ],
        ),
      )
    );
  }
}