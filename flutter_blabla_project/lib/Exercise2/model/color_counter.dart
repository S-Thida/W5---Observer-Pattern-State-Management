import 'package:flutter/material.dart';
class ColorCounters extends ChangeNotifier {
  int redTapCount = 0;
  int blueTapCount = 0;

  void incrementRed() {
    redTapCount++;
    notifyListeners();
  }

  void incrementBlue() {
    blueTapCount++;
    notifyListeners();
  }
}