import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/screen/setting/provider/setting_provider.dart';
import 'package:platform_converter_app/utils/Theme/provider/theme_provider.dart';
import 'package:platform_converter_app/utils/share_helper.dart';
import 'package:provider/provider.dart';

class SettingIosScreen extends StatefulWidget {
  const SettingIosScreen({super.key});

  @override
  State<SettingIosScreen> createState() => _SettingIosScreenState();
}

SettingProvider? providerr;
SettingProvider? providerw;

class _SettingIosScreenState extends State<SettingIosScreen> {
  @override
  Widget build(BuildContext context) {
    providerr = context.read<SettingProvider>();
    providerw = context.watch<SettingProvider>();
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Platform Converter ",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(CupertinoIcons.person),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Update Profile Data",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CupertinoSwitch(
                  value: providerr!.isVisible,
                  onChanged: (value) {
                    providerr!.showDialog(value);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            (providerr!.isVisible == true)
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: CupertinoColors.activeBlue,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Icon(CupertinoIcons.camera),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CupertinoTextField.borderless(
                          textAlign: TextAlign.center,
                          placeholder: "Enter your name..",
                        ),
                        const CupertinoTextField.borderless(
                          textAlign: TextAlign.center,
                          placeholder: "Enter your bio..",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CupertinoButton(
                                child: const Text(
                                  "SAVE",
                                  style: TextStyle(
                                      color: CupertinoColors.activeBlue),
                                ),
                                onPressed: () {}),
                            CupertinoButton(
                                child: const Text(
                                  "CLEAR",
                                  style: TextStyle(
                                      color: CupertinoColors.activeBlue),
                                ),
                                onPressed: () {}),
                          ],
                        )
                      ],
                    ),
                  )
                : Container(
                    height: 10,
                  ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(CupertinoIcons.sun_max),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Theme",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "change Theme",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Consumer<ThemeProvider>(
                  builder: (context, value, child) => CupertinoSwitch(
                    value: value.isLight,
                    onChanged: (value1) {
                      ShareHelper shr = ShareHelper();
                      shr.setTheme(value1);
                      value.changeThem();
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
