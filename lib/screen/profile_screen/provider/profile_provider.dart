import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/profile_screen/model/profile_model.dart';

import '../../call_screen/view/call_screen.dart';
import '../../chat_screen/view/chat_screen.dart';
import '../../setting_screen/view/setting_screen.dart';
import '../view/profile_screen.dart';

class ProfileProvider with ChangeNotifier
{
  DateTime? date = DateTime.now();
  TimeOfDay? time = TimeOfDay.now();
  int? infoIndex;
  int dashIndex = 0;



  List<ProfileModal> addDataList = [];
  List<Widget> screen = [
    const ProfileScreen(),
    const ChatScreen(),
    const CallScreen(),
    const SettingScreen(),
  ];


  void changeStep (i) {
    dashIndex = i;
    notifyListeners();
  }

  void changeDate(DateTime d1) {
    date = d1;
    notifyListeners();
  }

  void changeTime(TimeOfDay t1) {
    time = t1;
    notifyListeners();
  }

  void addContactData(ProfileModal cm) {
    addDataList.add(cm);
    notifyListeners();
  }

  void storeIndex(int index) {
    infoIndex = index;
    notifyListeners();
  }

}