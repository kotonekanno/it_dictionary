import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/setting_provider.dart';
import '../ui/setting_item.dart';

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWide = constraints.maxWidth > 800;

          return Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: isWide ? 800 : constraints.maxWidth,
              child: Column(
                children: [
                  SettingItem(
                    label: 'Change the prefix of app title',
                    inputWidget: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    onSave: () {
                      if (controller.text.isNotEmpty) {
                        wordProvider.setAppPrefix(controller.text.trim());
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Title updated')),
                        );
                      }
                    }
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          );
        }
      )
    );
  }
}