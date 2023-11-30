import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/dash_screen/provider/dash_provider.dart';
import 'package:platform_converter_app/screen/profile_screen/provider/profile_provider.dart';
import 'package:platform_converter_app/screen/setting_screen/provider/setting_provider.dart';
import 'package:platform_converter_app/utils/screen_routs.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => DashProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProfileProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SettingProvider(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: screenRoutes,
    ),
  ));
}
