import 'package:flutter/material.dart';
import 'dart:math';

class ProviderClass with ChangeNotifier {
  List<int> _pagesIds = [
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
  ];

  List<int> get pagesIds => _pagesIds;

  void changeId(int index, int value) {
    _pagesIds[index] = value;
    notifyListeners();
  }

  void autoGenerate() {
    _pagesIds = [];
    for (int i = 0; i < 20; i++) {
      int value = Random().nextInt(10);
      _pagesIds.add(value);
    }
    notifyListeners();
  }
}
