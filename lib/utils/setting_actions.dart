import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/setting_provider.dart';
import '../widgets/setting_item.dart';

class DeleteSetting extends StatelessWidget {
  const DeleteSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      label: 'Confirm before delete',
      inputWidget: Switch(
        activeTrackColor: Colors.indigo,
        value: context.watch<SettingProvider>().confirmBeforeDelete,
        onChanged: (val) {
          context.read<SettingProvider>().setConfirmBeforeDelete(val);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Update confirmation setting')),
          );
        },
      ),
    );
  }
}