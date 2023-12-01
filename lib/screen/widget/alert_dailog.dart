
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter_app/screen/profile_screen/model/profile_model.dart';
import 'package:platform_converter_app/screen/profile_screen/provider/profile_provider.dart';
import 'package:provider/provider.dart';

void updateWidget(BuildContext context, ProfileModal c1) {
  TextEditingController txtName = TextEditingController(text: c1.name);
  TextEditingController txtPhoneNo = TextEditingController(text: c1.phone);
  TextEditingController txtChat = TextEditingController(text: c1.chat);
  ProfileProvider? providerR;
  providerR = context.read<ProfileProvider>();

  showDialog(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: AlertDialog(
          title: const Text("Update Contacts"),
          actions: [
            Align(
              alignment: Alignment.center,
              child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          alignment: Alignment.bottomCenter,
                          title: const Text("Pick Profile Picture"),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  ImagePicker picker = ImagePicker();
                                  XFile? image = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  context.read<ProfileProvider>().updateImagePath(image!.path);
                                },
                                child: const Text("Choose Photo")),
                          ],
                        );
                      },
                    );
                  },
                  child: c1.image != null ||
                      context.read<ProfileProvider>().path != null
                      ? CircleAvatar(
                    radius: 60,
                    backgroundImage: FileImage(File("${c1.image}")),
                  )
                      : CircleAvatar(
                    radius: 60,
                    child: Text(
                      "${c1.name!.substring(0, 1).toUpperCase()}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtName,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Name")),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtChat,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Chat")),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    ProfileModal c1 = ProfileModal();
                    c1.name = txtName.text;
                    c1.chat = txtChat.text;
                    c1.image = context.read<ProfileProvider>().path;
                    context.read<ProfileProvider>().editContact(c1);
                    Navigator.pop(context);
                  },
                  child: const Text("Update"),
                ),
                const SizedBox(width: 10,),
                ElevatedButton(onPressed: (){
                   context.read<ProfileProvider>().deleteContact();
                   Navigator.pop(context);
                  }, child: const Text("Delete",),),
              ],
            )
          ],
        ),
      );
    },
  );
}