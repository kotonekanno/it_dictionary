import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final List<Widget> rowChildren;
  final List<Widget> columnChildren;

  const SettingItem({
    required this.rowChildren,
    required this.columnChildren,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 600;

        if (isWide) {
          return Row(children: rowChildren);
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: columnChildren,
          );
        }
      }
    );
  }
}

class ButtonSettingItem extends StatelessWidget {
  final String label;
  final Widget button;
  final VoidCallback? onSave;

  const ButtonSettingItem({
    super.key,
    required this.label,
    required this.button,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      rowChildren: [
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
          child: button,
        ),
        const SizedBox(width: 16),
        if(onSave != null)
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: ElevatedButton(
              onPressed: onSave,
              child: const Text('Save')
            ),
          ),
      ],
      columnChildren: [
        Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: button,
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
    Widget saveButton() => 
      ElevatedButton(
        onPressed: () {
          onSave.call(controller.text);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(snackBarMessage)),
          );
        },
        child: const Text('Save'),
      );
          
    return SettingItem(
      rowChildren: [
        const SizedBox(width: 16),
        Expanded(child: Text(label, style: const TextStyle(fontSize: 18))),
        const SizedBox(width: 16),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(width: 16),
        Padding(padding: const EdgeInsets.only(right: 20), child: saveButton()),
      ],
      columnChildren: [
        Text(label, style: const TextStyle(fontSize: 18)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        saveButton(),
      ],
    );
  }
}

class PageSettingItem extends StatelessWidget {
  final String label;
  final Widget page;
  final String status;
  
  const PageSettingItem({
    required this.label,
    required this.page,
    required this.status,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    void onPressed () { 
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    }

    return SettingItem(
      rowChildren: [
        const SizedBox(width: 16),
        Expanded(child: Text(label, style: const TextStyle(fontSize: 18))),
        const SizedBox(width: 16),
        Expanded(
          child: Text(status, style: TextStyle(fontSize: 14)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: onPressed,
          ),
        ),
        const SizedBox(width: 16),
      ],
      columnChildren: [
        Text(label, style: const TextStyle(fontSize: 18)),
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(status, style: TextStyle(fontSize: 14)),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: onPressed,
        ),
      ],
    );
  }
}