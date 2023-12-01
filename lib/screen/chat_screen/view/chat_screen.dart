import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/profile_screen/model/profile_model.dart';
import 'package:platform_converter_app/screen/profile_screen/provider/profile_provider.dart';
import 'package:platform_converter_app/screen/widget/alert_dailog.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
                      child:
                      providerW!.addDataList[index].image != null?
                      InkWell(
                        onTap: () {
                         ProfileModal c1 = ProfileModal(
                           name: providerR!.addDataList[index].name,
                           chat: providerR!.addDataList[index].chat,
                           image: providerR!.addDataList[index].image,
                         );
                         providerR!.storeIndex(index);
                       updateWidget(context, c1);
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: FileImage(
                              File("${providerR!.addDataList[index].image}")),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          "${providerR!.addDataList[index].name}",
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          "${providerR!.addDataList[index].chat}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "${providerR!.date!.day}/${providerR!.date!.month}/${providerR!.date!.year}",
                          style: const TextStyle(fontSize: 17),
                        ),
                        Text(
                          "${providerR!.time!.hour}:${providerR!.time!.minute}",
                          style: const TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
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
