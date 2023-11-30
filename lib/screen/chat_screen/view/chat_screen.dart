import 'package:flutter/material.dart';
import 'package:platform_converter_app/screen/profile_screen/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
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
    return ListView.builder(
      itemCount: providerW!.addDataList.length,
      itemExtent: 100,
      itemBuilder: (context, index) {
        return Consumer(
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                providerR!.storeIndex(index);
                Navigator.pushNamed(context, 'update',
                    arguments: providerR!.addDataList[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${providerW!.addDataList[index].name}",
                              style: const TextStyle(color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${providerW!.addDataList[index].chat}",
                              style: const TextStyle(color: Colors.black),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  "${providerW!.addDataList[index].date}",
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "${providerW!.addDataList[index].time}",
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
/*                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 25,
                            child: Column(
                              children: [
                                providerW!.addDataList[index].image != null
                                    ? CircleAvatar(
                                  radius: 25,
                                  backgroundImage: FileImage(File(
                                      "${providerW!.addDataList[index].image}")),
                                )
                                    : Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black),
                                  child: Text(
                                    "${providerW!.addDataList[index].fName!.isNotEmpty ? providerW!.addDataList[index].fName?.substring(0, 1).toUpperCase() : 0}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
*/