import 'dart:io';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/home/modal/Home_modal.dart';
import 'package:platform_converter_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../widget/updat_android_widget.dart';

class ChatAndroidScreen extends StatefulWidget {
  const ChatAndroidScreen({super.key});

  @override
  State<ChatAndroidScreen> createState() => _ChatAndroidScreenState();
}

class _ChatAndroidScreenState extends State<ChatAndroidScreen> {
  HomeProvider? providerw;
  HomeProvider? providerr;

  @override
  Widget build(BuildContext context) {
    providerw = context.watch<HomeProvider>();
    providerr = context.read<HomeProvider>();
    return ListView.builder(
      itemCount: providerw!.addDataList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.10,
            width: MediaQuery.of(context).size.width * 0.10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  providerw!.addDataList[index].image != null
                      ? InkWell(
                          onTap: () {
                            HomeModal ec = HomeModal(
                                name: providerr!.addDataList[index].name,
                                call: providerr!.addDataList[index].call,
                                image: providerr!.addDataList[index].image);
                            providerr!.storeIndex(index);
                            showWidget(context, ec);
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: FileImage(
                              File(
                                "${providerw!.addDataList[index].image}",
                              ),
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            HomeModal ec = HomeModal(
                                name: providerr!.addDataList[index].name,
                                call: providerr!.addDataList[index].call,
                                image: providerr!.addDataList[index].image);
                            providerr!.storeIndex(index);
                            showWidget(context, ec);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: MediaQuery.of(context).size.width * 0.20,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blue),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${providerw!.addDataList[index].name!.isNotEmpty ? providerw!.addDataList[index].name!.substring(0, 1).toUpperCase() : 0}",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${providerr!.addDataList[index].name}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "${providerw!.addDataList[index].chat}",
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "${providerr!.date!.day}/${providerr!.date!.month}/${providerr!.date!.year},${providerw!.time!.hour}:${providerw!.time!.minute}",
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
