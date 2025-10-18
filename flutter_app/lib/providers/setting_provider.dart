import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  // Change app title
  String _appTitle = 'IT';
  String get appTitle => _appTitle;
  void setAppTitle(String newTitle) {
    _appTitle = newTitle;
    notifyListeners();
  }

  // Change keys
  String _mainKey = 'English';
  String get mainKey => _mainKey;
  void setMainKey(String newKey) {
    _mainKey = newKey;
    notifyListeners();
  }

  String _subKey = 'Japanese';
  String get subKey => _subKey;
  void setSubKey(String newKey) {
    _subKey = newKey;
  }

  // Confirm before delete
  bool _confirmBeforeDelete = true;
  bool get confirmBeforeDelete => _confirmBeforeDelete;

  void setConfirmBeforeDelete(bool value) {
    _confirmBeforeDelete = value;
    notifyListeners();
  }
}