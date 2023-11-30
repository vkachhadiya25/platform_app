import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/setting_screen/provider/setting_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/shared_preference.dart';
import '../provider/theme_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingProvider? providerR;
  SettingProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<SettingProvider>();
    providerW = context.watch<SettingProvider>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.person_outline,size: 30,),
                const SizedBox(
                  width: 25,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile",
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      "Update Profile Data",
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
                const Spacer(),
                Switch(
                  value: providerR!.isProfileOn!,
                  onChanged: (value) {
                    providerR!.profileSwitch();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            (providerR!.isProfileOn == true)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10,),
                      const CircleAvatar(
                        radius: 60,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 30,
                        ),
                      ),
                      const TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          label: Center(child: Text("Enter your name")),
                        ),
                        enabled: true,
                      ),
                      const TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          label: Center(child: Text("Enter your bio...")),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: () {}, child: const Text("Save",style: TextStyle(fontSize: 20),)),
                          TextButton(
                              onPressed: () {}, child: const Text("Clear",style: TextStyle(fontSize: 20),)),
                        ],
                      )
                    ],
                  )
                : const Column(),
            const Divider(thickness: 2,color: Colors.grey,),
            Row(
              children: [
                const Icon(Icons.person_outline,size: 30,),
                const SizedBox(
                  width: 25,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Theme",
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      "Change Theme",
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
                const Spacer(),
                Consumer<ThemeProvider>(
                  builder: (context, value, child) => Switch(
                    value: value.isLight,
                    onChanged: (value1) {
                      ShareHelper shr = ShareHelper();
                      shr.setTheme(value1);
                      value.changeTheme();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
