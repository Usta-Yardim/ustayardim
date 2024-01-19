import 'package:flutter/material.dart';
import 'package:ustayardim/tabs/home.dart';
import 'package:ustayardim/tabs/profile.dart';

class BottomNavigationHelper extends ChangeNotifier {
  List<Widget> tabs = [ClientHome(), Profile()];

  int _currentIndex = 0;

  setIndex({required int index}) {
    _currentIndex = index;
    notifyListeners();
  }

  int get index => _currentIndex;
}
