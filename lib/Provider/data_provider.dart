import 'package:flutter/material.dart';
import 'dart:math';

class ProviderClass with ChangeNotifier {
  bool isShuffled = false;
  List<int> _pagesIds = [
    // -1,
    // -1,
    // -1,
    // -1,
    // -1,
    // -1,
    // -1,
    // -1,
    // -1,
    // -1,
    // -1,
    // -1,
    // -1,
    // -1,
    // -1,
    // -1,
    // -1,
    // -1,
    // -1,
    // -1,
    //
    //
    // 1,
    // 2,
    // 3,
    // 4,
    // 5,
    // 1,
    // 3,
    // 1,
    // 6,
    // 3,
    // 2,
    // 3,
    //
    //
    // 0,
    // 1,
    // 2,
    // 3,
    // 0,
    // 1,
    // 4,
    // 0,
    // 1,
    // 2,
    // 3,
    // 4
    //
    //
    // 4, 7, 6, 1, 7, 6, 1, 2, 7, 2,
    //
    //
    0, 3, 1, 3, 2, 3, 6, 0, 4, 1, 4, 2, 4, 7, 0, 5, 1, 5, 2, 5
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
