import 'package:flutter/material.dart';

class GlobalState extends ChangeNotifier {
  bool _loading = false;
  String _name = '';
  String _profileUrl = '';

  // getter
  bool get loading => _loading;

  // setter
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  String get profileUrl => _profileUrl;

  set profileUrl(String value) {
    _profileUrl = value;
    notifyListeners();
  }
}
