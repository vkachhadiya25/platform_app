import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter_app/screen/home/modal/Home_modal.dart';
import 'package:platform_converter_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeAndroidScreen extends StatefulWidget {
  const HomeAndroidScreen({Key? key}) : super(key: key);

  @override
  State<HomeAndroidScreen> createState() => _HomeAndroidScreenState();
}

class _HomeAndroidScreenState extends State<HomeAndroidScreen> {
  HomeProvider? providerr;
  HomeProvider? providerw;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtChat = TextEditingController();
  TextEditingController txtCall = TextEditingController();
  TextEditingController txtdate = TextEditingController();
  TextEditingController txttime = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Consumer<HomeProvider>(
                          builder: (context, value, child) {
                            return CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.blue,
                              backgroundImage: value.path != null
                                  ? FileImage(File(value.path!))
                                  : null,
                            );
                          },
                        ),
                        IconButton(
                          onPressed: () async {
                            ImagePicker imgPiker = ImagePicker();
                            XFile? image = await imgPiker.pickImage(
                              source: ImageSource.gallery,
                            );
                            providerr!.updateImagePath(image!.path);
                          },
                          icon: const Icon(Icons.camera),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: txtName,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Full Name",
                        prefixIcon: Icon(Icons.person_2_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: txtCall,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Phone Number",
                        prefixIcon: Icon(Icons.call_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: txtChat,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Chat Conversation",
                        prefixIcon: Icon(Icons.message_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your chat conversation';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            DateTime? d1 = await showDatePicker(
                              context: context,
                              initialDate: providerr!.date!,
                              firstDate: DateTime(2001),
                              lastDate: DateTime(2050),
                            );
                            providerr!.changeDate(d1!);
                          },
                          icon: const Icon(Icons.calendar_month),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Date : ${providerr!.date?.day}/${providerr!.date?.month}/${providerr!.date?.year}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            TimeOfDay? d2 = await showTimePicker(
                              context: context,
                              initialTime: providerr!.time!,
                            );
                            providerr!.changeTime(d2!);
                          },
                          icon: const Icon(Icons.timer_outlined),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Time : ${providerr!.time!.hour}:${providerw!.time!.minute}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          HomeModal cm = HomeModal(
                            name: txtName.text,
                            chat: txtChat.text,
                            call: txtCall.text,
                            date: "${providerr!.date?.day}/${providerr!.date?.month}/${providerr!.date?.year}",
                            time: "${providerr!.time!.hour}:${providerw!.time!.minute}",
                            image: providerw!.path,
                          );
                          providerr!.updateImagePath(null);
                          providerr!.addPlatfomeData(cm);
                          providerw!.dashIndex;
                        }
                      },
                      child: const Text("Save"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
