
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/call/view/call_ios_screen.dart';
import 'package:platform_converter_app/screen/chats/view/chats_ios_screen.dart';
import 'package:platform_converter_app/screen/dash/provider/dash_ios_provider.dart';
import 'package:platform_converter_app/screen/home/view/home_ios_screen.dart';
import 'package:platform_converter_app/screen/setting/view/setting_ios_screen.dart';
import 'package:provider/provider.dart';

class DashIosScreen extends StatefulWidget {
  const DashIosScreen({super.key});

  @override
  State<DashIosScreen> createState() => _DashIosScreenState();
}

class _DashIosScreenState extends State<DashIosScreen> {
  DashIosProvider? providerw;
  DashIosProvider? providerr;

  List<Widget> screens = [
    const HomeIosScreen(),
    const ChatsIosScreen(),
    const CallIosScreen(),
    const SettingIosScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    providerr = context.read<DashIosProvider>();
    providerw = context.watch<DashIosProvider>();
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: providerr!.stepIndex, onTap: (value) {
          int i = value;
          providerr!.changeStep(i);
        },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_add),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_text),
              label: 'Contact',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone),
              label: 'Contact',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Contact',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
           builder: (context) {
             return screens[
               providerw!.stepIndex
             ];
           },
          );
        },);
  }
}
