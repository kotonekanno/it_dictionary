import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/setting_provider.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const Header({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    //final prefix = context.watch<SettingProvider>().appPrefix;
    final title = context.watch<SettingProvider>().appTitle;

    return AppBar(
      title: Text(
        //'$prefix Dictionary',
        '$title Dictionary',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'SUSEMono',
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.indigo,
    );
  }

}