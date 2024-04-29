import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../home/modal/Home_modal.dart';
import '../../widget/updat_android_widget.dart';

class ChatsIosScreen extends StatefulWidget {
  const ChatsIosScreen({Key? key}) : super(key: key);

  @override
  State<ChatsIosScreen> createState() => _ChatsIosScreenState();
}

class _ChatsIosScreenState extends State<ChatsIosScreen> {
  HomeProvider? providerw;
  HomeProvider? providerr;

  @override
  Widget build(BuildContext context) {
    providerw = context.watch<HomeProvider>();
    providerr = context.read<HomeProvider>();
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Platform Converter ",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: providerw!.addDataList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () async {
                HomeModal c1 = HomeModal(
                    name: providerr!.addDataList[index].name,
                    call: providerr!.addDataList[index].call,
                    image: providerr!.addDataList[index].image);
                providerr!.storeIndex(index);
                showWidget(context, c1);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      providerw!.addDataList[index].image != null
                          ? CircleAvatar(
                        radius: 25,
                        backgroundImage: FileImage(
                          File(
                            "${providerw!.addDataList[index].image}",
                          ),
                        ),
                      )
                          : CircleAvatar(
                        radius: 25,
                        child: Text(
                          "${providerw!.addDataList[index].name!.isNotEmpty ? providerw!.addDataList[index].name!.substring(0, 1).toUpperCase() : 0}",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${providerw!.addDataList[index].name}",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${providerw!.addDataList[index].chat}",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "${providerw!.date!.day}/${providerw!.date!.month}/${providerw!.date!.year},${providerw!.time!.hour}:${providerw!.time!.minute}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
