import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../call_screen/view/call_screen.dart';
import '../../chat_screen/view/chat_screen.dart';
import '../../profile_screen/view/profile_screen.dart';
import '../../setting_screen/view/setting_screen.dart';

class DashProvider with ChangeNotifier{
  int dashIndex=0;
  int stepIndex = 0;
  TabController? tabController;
  List<Widget> screen = [
    const ProfileScreen(),
    const ChatScreen(),
    const CallScreen(),
    const SettingScreen(),
  ];

  void changeTab(int i,TickerProvider thisProvider)
  {
    tabController =TabController(length: 4, vsync:thisProvider,initialIndex: i);
    notifyListeners();
  }
  void changeStep(i)
  {
    stepIndex = i;
    notifyListeners();
  }

}