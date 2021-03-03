import 'package:flutter/material.dart';

class BottomNavigationBarNotifier extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

  void setNavIndex(int ind) {
    _index = ind;
    notifyListeners();
  }
}
