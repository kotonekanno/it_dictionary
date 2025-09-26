import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  // Change app title
  String _appTitle = 'IT';
  String get appTitle => _appTitle;
  void setAppTitle(String newTitle) {
    _appTitle = newTitle;
<<<<<<< HEAD
=======
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
>>>>>>> bc7733f10f52afc4a2accec05ea3e22b7a03f63f
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
  }

  // Confirm before delete
  bool _confirmBeforeDelete = true;
  bool get confirmBeforeDelete => _confirmBeforeDelete;

  void setConfirmBeforeDelete(bool value) {
    _confirmBeforeDelete = value;
    notifyListeners();
  }
}