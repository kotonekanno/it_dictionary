import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  // Change app title
  String _appPrefix = 'IT';
  String get appPrefix => _appPrefix;
  void setAppPrefix(String newPrefix) {
    _appPrefix = newPrefix;
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