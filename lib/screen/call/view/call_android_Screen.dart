import 'dart:io';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CallAndroidScreen extends StatefulWidget {
  const CallAndroidScreen({super.key});

  @override
  State<CallAndroidScreen> createState() => _CallAndroidScreenState();
}

class _CallAndroidScreenState extends State<CallAndroidScreen> {
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
                      ? CircleAvatar(
                          radius: 25,
                          backgroundImage: FileImage(File(
                            "${providerw!.addDataList[index].image}",
                          ),),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 0.20,
                          decoration: BoxDecoration(
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
                      const Spacer(),
                      Text(
                        "${providerw!.addDataList[index].call}",
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () async {
                      Uri uri = Uri.parse(
                          "tel: +91${providerr!.addDataList[index].call}");
                      await launchUrl(uri);
                    },
                    icon: const Icon(
                      Icons.call,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
