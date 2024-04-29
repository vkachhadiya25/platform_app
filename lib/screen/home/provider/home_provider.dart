


import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/chats/view/chats_ios_screen.dart';
import 'package:platform_converter_app/screen/home/modal/Home_modal.dart';
import 'package:platform_converter_app/screen/home/view/home_ios_screen.dart';

import '../../call/view/call_ios_screen.dart';
import '../../setting/view/setting_ios_screen.dart';
import '../../setting/view/setting_ios_screen.dart';

class HomeProvider with ChangeNotifier
{
  String? imagePath;
  String? path;
  DateTime? date = DateTime.now();
  TimeOfDay? time = TimeOfDay.now();
  int dashIndex= 0;
  int infoIndex = 0;
  bool isLock =false;
  bool isIos =true;

  void changeDate(DateTime? d1){
    date = d1;
    notifyListeners();
  }

  void changeTime(TimeOfDay? t1){
    time = t1;
    notifyListeners();
  }

  void storeIndex(int index) {
    infoIndex = index;
    notifyListeners();
  }

  List<HomeModal> addDataList = [];
  List<Widget> screen =[
    const HomeIosScreen(),
    const ChatsIosScreen(),
    const CallIosScreen(),
    const SettingIosScreen(),
  ];

  void changeStep(i){
    dashIndex = i;
    notifyListeners();
  }

  void addPlatfomeData(HomeModal cm){
    addDataList.add(cm);
    notifyListeners();
  }

  void updateImagePath(String? newPath) {
    path = newPath;
    notifyListeners();
  }

  void editContact(HomeModal ec) {
    addDataList[infoIndex] = ec;
    notifyListeners();
  }
  void contactDelete() {
    addDataList.removeAt(infoIndex);
    notifyListeners();
  }
}
