import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter_app/screen/dash_screen/provider/dash_provider.dart';
import 'package:platform_converter_app/screen/profile_screen/model/profile_model.dart';
import 'package:platform_converter_app/screen/profile_screen/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  ProfileProvider? providerR;
  ProfileProvider? providerW;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhoneNo= TextEditingController();
  TextEditingController txtChat= TextEditingController();
  TextEditingController txtDate= TextEditingController();
  TextEditingController txtTime= TextEditingController();
  GlobalKey<FormState> textKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<ProfileProvider>();
    providerW = context.watch<ProfileProvider>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Consumer<ProfileProvider>(builder: (context, value, child) => CircleAvatar(
                radius: 70,
                backgroundImage: value.path != null
                    ? FileImage(File(value.path!))
                    : null,
              ),
              ),
              IconButton(
                  onPressed: () async {
                    ImagePicker imgPiker = ImagePicker();
                    XFile? image = await imgPiker.pickImage(
                        source: ImageSource.gallery);
                    providerR!.updateImagePath(image!.path);
                  },
                  icon: const Icon(Icons.image))
            ],
          ),
          Form(
            key: textKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if(value == null || value.isEmpty)
                        {
                          return 'Please enter your full name';
                        }
                      return null;
                    },
                    onChanged: (value) {
                      if(textKey.currentState!.validate())
                        {

                        }
                    },
                    keyboardType: TextInputType.name,
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
                    validator: (value) {
                      if(value == null || value.isEmpty)
                      {
                        return 'Please enter some chat';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if(textKey.currentState!.validate())
                      {

                      }
                    },
                    keyboardType: TextInputType.phone,
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
                    validator: (value) {
                      if(value == null || value.isEmpty)
                      {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if(textKey.currentState!.validate())
                      {

                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: txtChat,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.message),
                        hintText: "Chat Conversation"),
                  ),
                ),
              ],
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
                image: providerR!.path,
              );
              providerR!.updateImagePath(null);
              providerR!.addContactData(cm);
              context.read<DashProvider>().changeTab(1,this);
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
