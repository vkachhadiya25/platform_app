import 'package:flutter/cupertino.dart';

class SettingProvider with ChangeNotifier
{
  bool?  isProfileOn =  false;
  String? path;

  void profileSwitch()
  {
    isProfileOn =! isProfileOn!;
    notifyListeners();
  }

  void updateImagePath(String? newPath)
  {
    path = newPath;
    notifyListeners();
  }
}