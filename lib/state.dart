import 'package:flutter/material.dart';

class GlobalState extends ChangeNotifier {
  bool _loading = false;

  // getter
  bool get loading => _loading;

  // setter
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
