import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/call/view/call_android_Screen.dart';
import 'package:platform_converter_app/screen/chats/view/chat_android_screen.dart';
import 'package:platform_converter_app/screen/dash/provider/dash_ios_provider.dart';
import 'package:platform_converter_app/screen/home/view/home_android_screen.dart';
import 'package:platform_converter_app/screen/setting/view/setting_android_screen.dart';
import 'package:platform_converter_app/utils/Theme/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class DashAndroidScreen extends StatefulWidget {
  const DashAndroidScreen({super.key});

  @override
  State<DashAndroidScreen> createState() => _DashAndroidScreenState();
}

class _DashAndroidScreenState extends State<DashAndroidScreen> {
  DashIosProvider? providerr;
  DashIosProvider? providerw;

  List<Widget> screen = [
    const HomeAndroidScreen(),
    const ChatAndroidScreen(),
    const CallAndroidScreen(),
    const SettingAndriodScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    providerr = context.read<DashIosProvider>();
    providerw = context.watch<DashIosProvider>();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Platform Converter",style: TextStyle(fontSize: 20),),
          actions: [
            Consumer(
              builder: (context, value, child) {
                return Switch(value: context
                    .read<ThemeProvider>()
                    .isUi ,onChanged: (value){
                  context.read<ThemeProvider>().changeApp(value);
                }
                );
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.person_add_alt),
              ),
              Tab(
                text: "Chat",
              ),
              Tab(
                text: "Call",
              ),
              Tab(
                text: "Setting",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: screen,
        ),
      ),
    );
  }
}