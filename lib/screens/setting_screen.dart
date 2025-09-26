import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/setting_provider.dart';
import '../widgets/centered_max_width.dart';
import '../widgets/setting_item.dart';
import '../utils/setting_actions.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  static const Widget dividerWithPadding = Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Divider(height: 30),
  );

  @override
  Widget build(BuildContext context) {
    final wordProvider = context.watch<SettingProvider>();
    final appTitleController = TextEditingController(text: wordProvider.appTitle);
    final leftKeyController = TextEditingController(text: wordProvider.leftKey);
    final rightKeyController = TextEditingController(text: wordProvider.rightKey);

    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        centerTitle: true,
      ),
      body: CenteredMaxWidth(
        maxWidth: 800,
        child: SingleChildScrollView(
          child: Column(
            children: [
              dividerWithPadding,
              TextSettingItem(
                label: 'Change the prefix of app title',
                snackBarMessage: 'Title updated',
                controller: appTitleController,
                onSave: (value) {
                  context.read<SettingProvider>().setAppTitle(value);
                },
              ),
              dividerWithPadding,
              TextSettingItem(
                label: 'Change the left key',
                snackBarMessage: 'Left key updated',
                controller: leftKeyController,
                onSave: (value) {
                  context.read<SettingProvider>().setLeftKey(value);
                },
              ),
              dividerWithPadding,
              TextSettingItem(
                label: 'Change the right key',
                snackBarMessage: 'Right key updated',
                controller: rightKeyController,
                onSave: (value) {
                  context.read<SettingProvider>().setRightKey(value);
                },
              ),
              dividerWithPadding,
              DeleteSetting(),
              dividerWithPadding,
            ],
          ),
        ),
      ),
    );
  }
}