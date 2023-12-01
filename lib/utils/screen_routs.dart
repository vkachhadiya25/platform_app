import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/screen/dash_screen/view/dash_ios_screen.dart';
import 'package:platform_converter_app/screen/dash_screen/view/dash_screen.dart';


Map<String, WidgetBuilder> screenRoutes = {

    '/' :(context) => const DashScreen(),

};

// Map<String, WidgetBuilder> screenIos= {
//
//
//     'dash' :(context) => const DashIOsScreen(),
//
// };