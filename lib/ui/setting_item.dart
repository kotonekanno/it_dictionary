import 'package:flutter/material.dart';

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
                TextButton(
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
                TextButton(
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