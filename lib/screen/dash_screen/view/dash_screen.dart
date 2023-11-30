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

class _DashScreenState extends State<DashScreen> with SingleTickerProviderStateMixin{
  DashProvider? providerR;
  DashProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<DashProvider>().tabController = TabController(length: 4, vsync: this,initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<DashProvider>();
    providerW = context.watch<DashProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Platform Converter"),
        bottom: TabBar(controller: providerW!.tabController, tabs: const [
          Tab(icon: Icon(Icons.person_add_alt),),
          Tab(text: "CHATS"),
          Tab(text: "CALLS"),
          Tab(text: "SETTINGS"),
        ],
        ),
      ),
      body: TabBarView(controller: providerW!.tabController,children:providerW!.screen ),
    );
  }
}
