import 'package:flutter/material.dart';

import '../../../utils/shared_preference.dart';

class ThemeProvider with ChangeNotifier
{
  bool isLight = true;

  void changeTheme()
  async{
    ShareHelper shr= ShareHelper();
    bool? isTheme = await shr.getTheme();
    isLight = isTheme ?? false;
    notifyListeners();
  }
}