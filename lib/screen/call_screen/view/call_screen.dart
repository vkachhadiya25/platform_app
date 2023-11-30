import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../profile_screen/provider/profile_provider.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  ProfileProvider? providerR;
  ProfileProvider? providerW;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhoneNo = TextEditingController();
  TextEditingController txtChat = TextEditingController();
  TextEditingController txtDate = TextEditingController();
  TextEditingController txtTime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<ProfileProvider>();
    providerW = context.watch<ProfileProvider>();
    return ListView.builder(
      itemCount: providerW!.addDataList.length,
      itemExtent: 100,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Row(
                  children: [
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: FileImage(File("${providerR!.addDataList[index].image}"))

                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${providerR!.addDataList[index].name}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 140,
                    ),
                    IconButton(
                        onPressed: () async {
                          Uri uri = Uri.parse(
                              "tel: +91 ${providerR!.addDataList[index].phone}");
                          await launchUrl(uri);
                        },
                        icon: const Icon(
                          Icons.call,
                          color: Colors.green,
                        )),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
