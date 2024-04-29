import 'package:flutter/cupertino.dart';

class DashIosProvider with ChangeNotifier {
  int stepIndex = 0;

  void changeStep(i) {
    stepIndex = i;
    notifyListeners();
  }
}