import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../home/modal/Home_modal.dart';
import '../home/provider/home_provider.dart';

void showWidget(BuildContext context, HomeModal ec) {
  TextEditingController txtName = TextEditingController(text: ec.name);
  TextEditingController txtChat = TextEditingController(text: ec.chat);
  TextEditingController txtCall = TextEditingController(text: ec.call);

  showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text("Update Contacts"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              CupertinoDialogAction(
                onPressed: () async {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text("Pick Profile Picture"),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () async {
                              ImagePicker picker = ImagePicker();
                              XFile? image = await picker.pickImage(
                                source: ImageSource.gallery,
                              );
                              context
                                  .read<HomeProvider>()
                                  .updateImagePath(image!.path);
                              Navigator.pop(context);
                            },
                            child: Text("Choose Photo"),
                          ),
                          CupertinoDialogAction(
                            onPressed: () async {
                              ImagePicker picker = ImagePicker();
                              XFile? image = await picker.pickImage(
                                source: ImageSource.camera,
                              );
                              context
                                  .read<HomeProvider>()
                                  .updateImagePath(image!.path);
                              Navigator.pop(context);
                            },
                            child: const Text("Take Photo"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: ec.image != null ||
                        context.read<HomeProvider>().path != null
                    ? CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(File("${ec.image}")),
                      )
                    : CircleAvatar(
                        radius: 80,
                        child: Text(
                          "${ec.name!.substring(0, 1).toUpperCase()}",
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .navLargeTitleTextStyle,
                        ),
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              CupertinoTextField(
                controller: txtName,
                keyboardType: TextInputType.name,
                placeholder: "Name",
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemGrey),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CupertinoTextField(
                controller: txtChat,
                keyboardType: TextInputType.text,
                placeholder: "Chat",
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemGrey),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CupertinoTextField(
                controller: txtCall,
                keyboardType: TextInputType.phone,
                placeholder: "Call",
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemGrey),
                ),
              ),
            ],
          ),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              HomeModal ec = HomeModal();
              ec.name = txtName.text;
              ec.chat = txtChat.text;
              ec.call =txtCall.text;
              ec.image = context.read<HomeProvider>().path;
              context.read<HomeProvider>().editContact(ec);
              Navigator.pop(context);
            },
            child: Text("Update"),
          ),
          CupertinoButton(
            onPressed: () {
              context.read<HomeProvider>().contactDelete();
              Navigator.pop(context);
            },
            child: const Text("Delete"),
          ),
        ],
      );
    },
  );
}
