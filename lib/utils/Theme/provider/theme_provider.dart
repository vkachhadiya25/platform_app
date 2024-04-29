import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/utils/share_helper.dart';

class ThemeProvider with ChangeNotifier
{
  bool isLight = true;
  bool isUi = false;

  void changeThem() async {
    ShareHelper shr = ShareHelper();
    bool? isTheme = await shr.getTheme();
    isLight = isTheme ?? false;
    notifyListeners();
  }

  void changeApp(value) {
    isUi = value;
    notifyListeners();
  }
}
