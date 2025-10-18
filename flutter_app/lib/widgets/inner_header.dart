import 'package:flutter/material.dart';

class InnerHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const InnerHeader({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 26,
      ),
    );
  }
}
