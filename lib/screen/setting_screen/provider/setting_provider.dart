import 'package:flutter/cupertino.dart';

class SettingProvider with ChangeNotifier
{
  bool?  isProfileOn =  false;

  void profileSwitch()
  {
    isProfileOn =! isProfileOn!;
    notifyListeners();
  }

}