import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/setting_provider.dart';
import '../providers/word_provider.dart';
import '../widgets/setting_item.dart';
import '../widgets/custom_dialog.dart';

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

class DeleteAll extends StatelessWidget {
  const DeleteAll({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      label: 'Delete all words',
      inputWidget: IconButton(
        icon: Icon(Icons.delete_forever, size:45),
        padding: EdgeInsets.zero,
        color: Colors.red,
        onPressed: () async {
          final confirm = await showDialog<bool>(
            context: context,
            builder: (context) => CustomDialog(
              title: 'Delete all words?',
              content: 'Are you sure to delete all words?',
              rightText: 'Delete',
              leftText: 'Cancel',
              rightFunction: () => Navigator.pop(context, true),
              leftFunction: () => Navigator.pop(context, false),
            ),
          );
          if (confirm == true) {
            await context.read<WordProvider>().deleteAllWords();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Deleted all words')),
            );
          }
        },
      ),
    );
  }
}