import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/dash_screen/provider/dash_provider.dart';
import 'package:platform_converter_app/screen/profile_screen/provider/profile_provider.dart';
import 'package:platform_converter_app/screen/setting_screen/provider/setting_provider.dart';
import 'package:platform_converter_app/screen/setting_screen/provider/theme_provider.dart';
import 'package:platform_converter_app/utils/app_theme.dart';
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
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          value.changeTheme();
          return MaterialApp(
            theme: value.isLight ? isDark : isLight,
            debugShowCheckedModeBanner: false,
            routes: screenRoutes,
          );
        },
      )
      // : CupertinoApp(
      //   debugShowCheckedModeBanner: false,
      //   routes: screenIos,),
      ));
}
