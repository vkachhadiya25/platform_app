import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/dash_screen/provider/dash_provider.dart';
import 'package:platform_converter_app/screen/profile_screen/model/profile_model.dart';
import 'package:platform_converter_app/screen/profile_screen/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileProvider? providerR;
  ProfileProvider? providerW;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhoneNo= TextEditingController();
  TextEditingController txtChat= TextEditingController();
  TextEditingController txtDate= TextEditingController();
  TextEditingController txtTime= TextEditingController();
  @override
  Widget build(BuildContext context) {
    providerR = context.read<ProfileProvider>();
    providerW = context.watch<ProfileProvider>();
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 80,
              child: Icon(Icons.camera_alt),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  hintText: "Full Name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtPhoneNo,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.call),
                  hintText: "Phone Number"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtChat,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.message),
                  hintText: "Chat Conversation"),
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () async {
                    DateTime? d1 = await showDatePicker(
                      context: context,
                      initialDate: providerR!.date,
                      firstDate: DateTime(2001),
                      lastDate: DateTime(2050),
                    );
                    providerR!.changeDate(d1!);
                  },
                  icon: const Icon(Icons.calendar_month)),
              const SizedBox(
                width: 13,
              ),
              Text(
                "Date ${providerW!.date!.day}/${providerW!.date!.month}/${providerW!.date!.year}",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () async {
                    TimeOfDay? t1 = await showTimePicker(
                      context: context,
                      initialTime: providerR!.time!,
                    );
                    providerR!.changeTime(t1!);
                  },
                  icon: const Icon(Icons.watch_later_outlined)),
              const SizedBox(
                width: 13,
              ),
              Text(
                "Time ${providerW!.time!.hour}:${providerW!.time!.minute}",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              ProfileModal cm = ProfileModal(
                name: txtName.text,
                chat: txtChat.text,
                phone: txtPhoneNo.text,
                date: txtDate.text,
                time: txtTime.text,
              );
              providerR!.addContactData(cm);
              providerW!.dashIndex;
            },
            child: const Text(
              "Save",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
