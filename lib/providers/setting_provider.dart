import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  // App title
  String _appPrefix = 'IT';
  String get appPrefix => _appPrefix;
  void setAppPrefix(String newPrefix) {
    _appPrefix = newPrefix;
    notifyListeners();
  }
}