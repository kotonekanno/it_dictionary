import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  // Change app title
  String _appTitle = 'IT';
  String get appTitle => _appTitle;
  void setAppTitle(String newTitle) {
    _appTitle = newTitle;
    notifyListeners();
  }

  // Change the keys
  String _leftKey = 'English';
  String get leftKey => _leftKey;
  void setLeftKey(String newKey) {
    _leftKey = newKey;
    notifyListeners();
  }

  String _rightKey = 'Japanese';
  String get rightKey => _rightKey;
  void setRightKey(String newKey) {
    _rightKey = newKey;
    notifyListeners();
  }

  // Confirm before delete
  bool _confirmBeforeDelete = true;
  bool get confirmBeforeDelete => _confirmBeforeDelete;

  void setConfirmBeforeDelete(bool value) {
    _confirmBeforeDelete = value;
    notifyListeners();
  }
}