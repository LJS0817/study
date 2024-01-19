import 'dart:ui';

import 'package:flutter/material.dart';

class Define extends ChangeNotifier {
  double _progress = 0;

  bool _enable = false;
  get Enable => _enable;

  void Activate() {
    _enable = !_enable;
    notifyListeners();
  }

  void Progressing() {
    _progress = lerpDouble(0, 0.5, 0.01)!;
    if(_progress > 1.00) {
      _progress = 0;
    }
    notifyListeners();
  }

  double getProgress() {
    return _progress;
  }
}