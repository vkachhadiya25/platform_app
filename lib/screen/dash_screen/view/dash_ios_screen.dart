import 'package:flutter/cupertino.dart';

class DashIOsScreen extends StatefulWidget {
  const DashIOsScreen({super.key});

  @override
  State<DashIOsScreen> createState() => _DashIOsScreenState();
}

class _DashIOsScreenState extends State<DashIOsScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: CupertinoTabBar(items: [
    BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.profile_circled), label: "Profile"),],
    )
    );
  }
}
