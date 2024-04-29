import 'package:flutter/foundation.dart';

class SettingProvider with ChangeNotifier
{
  bool isVisible=false;

  void showDialog(value){
    isVisible = value;
    notifyListeners();
  }
}