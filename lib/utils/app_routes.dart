import 'package:flutter/cupertino.dart';
import '../screen/dash/view/dash_android_screen.dart';
import '../screen/dash/view/dash_ios_screen.dart';

Map<String, WidgetBuilder> ios_screen_routes = {
  '/': (context) => const DashIosScreen(),
};
Map<String, WidgetBuilder> Android_screen_routes = {
  '/': (context) => const DashAndroidScreen(),
};