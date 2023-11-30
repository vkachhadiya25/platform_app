import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/call_screen/view/call_screen.dart';
import 'package:platform_converter_app/screen/chat_screen/view/chat_screen.dart';
import 'package:platform_converter_app/screen/dash_screen/provider/dash_provider.dart';
import 'package:platform_converter_app/screen/profile_screen/view/profile_screen.dart';
import 'package:platform_converter_app/screen/setting_screen/view/setting_screen.dart';
import 'package:provider/provider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  DashProvider? ProviderR;
  DashProvider? ProviderW;

  @override
  Widget build(BuildContext context) {
    ProviderR = context.read<DashProvider>();
    ProviderW = context.watch<DashProvider>();
    return DefaultTabController(
      length: 4,
      initialIndex: ProviderW!.dashIndex,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Platform Converter"),
          bottom: const TabBar( tabs: [
            Tab(icon: Icon(Icons.person_add_alt),),
            Tab(text: "CHATS"),
            Tab(text: "CALLS"),
            Tab(text: "SETTINGS"),
          ],
          ),
        ),
        body: TabBarView(children:ProviderW!.screen ),
      ),
    );
  }
}
