import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/screen/call_screen/view/call_ios_screen.dart';
import 'package:platform_converter_app/screen/chat_screen/view/chat_ios_screen.dart';
import 'package:platform_converter_app/screen/dash_screen/provider/dash_provider.dart';
import 'package:platform_converter_app/screen/profile_screen/view/profile_ios_screen.dart';
import 'package:platform_converter_app/screen/setting_screen/view/setting_ios_screen.dart';
import 'package:provider/provider.dart';

class DashIOsScreen extends StatefulWidget {
  const DashIOsScreen({super.key});

  @override
  State<DashIOsScreen> createState() => _DashIOsScreenState();
}

class _DashIOsScreenState extends State<DashIOsScreen> {
  DashProvider? providerR;
  DashProvider? providerW;
  int selectedValue =0;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<DashProvider>();
    providerW = context.watch<DashProvider>();
    List<Widget> screen = [
      const ProfileIosScreen(),
      const ChatIosScreen(),
      const CallIosScreen(),
      const SettingIosScreen(),
    ];
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: CupertinoColors.systemBlue,
          activeColor: CupertinoColors.white,
          currentIndex: providerR!.dashIndex,
          onTap: (value) {
            int i = value;
            providerR!.changeStep(i);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Contact',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return screen[providerW!.stepIndex];
            },
          );
        },
      ),
    );
  }
}
