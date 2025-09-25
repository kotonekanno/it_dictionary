import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/setting_provider.dart';

class SettingItem extends StatelessWidget {
  final String label;
  final Widget inputWidget;
  final VoidCallback? onSave;

  const SettingItem({
    super.key,
    required this.label,
    required this.inputWidget,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 600;

        if (isWide) {
          return Row(
            children: [
              const SizedBox(width: 16),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: inputWidget,
              ),
              const SizedBox(width: 16),
              if(onSave != null)
                ElevatedButton(
                  onPressed: onSave,
                  child: const Text('Save')
                ),
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  label,
                  style: const TextStyle(fontSize: 18),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: inputWidget,
              ),
              if(onSave != null)
                ElevatedButton(
                  onPressed: onSave,
                  child: const Text('Save')
                ),
            ],
          );
        }
      }
    );
  }
}

class TextSettingItem extends StatelessWidget {
  final String label;
  final String snackBarMessage;
  final TextEditingController controller;
  final void Function(String value) onSave;

  const TextSettingItem({
    required this.label,
    required this.snackBarMessage,
    required this.controller,
    required this.onSave,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      label: label,
      inputWidget: TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      onSave: () {
        if (controller.text.isNotEmpty) {
          final value = controller.text.trim();
          onSave(value);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(snackBarMessage)),
          );
        }
      },
    );
  }
}
/*
class AppTitleSetting extends StatelessWidget {
  final TextEditingController controller;
  const AppTitleSetting({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = context.watch<SettingProvider>();
    return SettingItem(
      label: 'Change the prefix of app title',
      inputWidget: TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      onSave: () {
        if (controller.text.isNotEmpty) {
          settingProvider.setAppTitle(controller.text.trim());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Title updated')),
          );
        }
      }
    );
  }
}

class LeftKeySetting extends StatelessWidget {
  final TextEditingController controller;
  const LeftKeySetting ({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = context.watch<SettingProvider>();
    return SettingItem(
      label: 'Change the left key',
      inputWidget: TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      onSave: () {
        if(controller.text.isNotEmpty) {
          settingProvider.setLeftKey(controller.text.trim());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Left key updated')),
          );
        }
      }
    );
  } 
}*/