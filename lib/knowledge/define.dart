import 'package:flutter/material.dart';

class Define extends ChangeNotifier {
  double _progress = 0;

  bool _enable = false;
  get Enable => _enable;

  void Activate() {
    _enable = !_enable;
    notifyListeners();
  }

  void Progressing(double value) {
    _progress = value;
    notifyListeners();
  }

  double getProgress() {
    return _progress;
  }
}