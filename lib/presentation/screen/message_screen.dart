import 'package:chat_box/data/controller/globle_controller.dart';
import 'package:chat_box/presentation/screen/poll_screen.dart';
import 'package:chat_box/presentation/screen/user_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/App_text.dart';
import '../../utils/app_color.dart';
import '../../utils/app_list.dart';

class MessageScreen extends StatefulWidget {
  final String dataone;
  final String datatwo;

  const MessageScreen({Key? key, required this.dataone, required this.datatwo}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  GlobalController global = Get.find();
  void getData() {
    FirebaseFirestore.instance.collection('chirag').doc(widget.datatwo).set({"msg": global.newMsg});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leading: BackButton(
          color: AppColor.black,
        ),
        backgroundColor: AppColor.white,
        elevation: 0,
        actions: [
          Icon(Icons.call_sharp, color: AppColor.black, size: width * 0.07),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.videocam, color: AppColor.black, size: width * 0.07),
          ),
        ],
        title: ListTile(
          contentPadding: const EdgeInsets.all(1),
          leading: Image.asset(widget.dataone, scale: 1.2),
          title: Text(
            widget.datatwo,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: width * 0.04),
          ),
          subtitle: Text(
            AppText.activenow,
            style: TextStyle(color: AppColor.black10, fontWeight: FontWeight.w500, fontSize: width * 0.025),
          ),
          onTap: () => Get.to(
            UserScreen(
              dataone: widget.dataone,
              datatwo: widget.datatwo,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: global.massage.length,
              itemBuilder: (context, int i) {
                return Align(
                  alignment: AppText.admin == global.massage[i].msgType ? Alignment.topLeft : Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Card(
                            shape: const OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14),
                                topLeft: Radius.circular(14),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            color: AppColor.perple,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              child: Text(
                                global.massage[i].msg,
                                style: TextStyle(color: AppColor.white, fontSize: width * 0.03, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: Text(
                            global.massage[i].time,
                            style: TextStyle(fontSize: width * 0.02),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () => showModle(), icon: const Icon(Icons.attach_file, size: 26)),
              Container(
                height: 70,
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: width * 0.55,
                child: Center(
                  child: TextField(
                    maxLines: 3,
                    onChanged: (val) {
                      if (val.isNotEmpty) {
                        global.change = true.obs;
                      } else {
                        global.change = false.obs;
                      }
                      setState(() {});
                    },
                    controller: global.textEditingController,
                    decoration: InputDecoration(
                      hintText: AppText.writeyour,
                      hintStyle: TextStyle(
                        fontSize: width * 0.03,
                        color: AppColor.black10,
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      fillColor: const Color(0xFF797C7B),
                      suffixIcon: IconButton(
                        onPressed: () {
                          final data = ClipboardData(text: global.textEditingController.text);
                          Clipboard.setData(data);
                        },
                        icon: Icon(
                          Icons.file_copy_outlined,
                          color: AppColor.black10,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (global.change == false.obs)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        global.pickImage();
                      },
                      icon: Icon(Icons.camera_alt_outlined, color: AppColor.black10, size: 26),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.mic, color: AppColor.black10, size: 26)),
                  ],
                )
              else
                IconButton(
                    onPressed: () {
                      if (global.textEditingController.text.isNotEmpty) {
                        setState(() {
                          global.msgList.add(
                            MsgData(
                              msgType: AppText.user,
                              msg: global.textEditingController.text,
                              time: DateFormat.jm().format(DateTime.now()).toString(),
                            ),
                          );
                          global.massage = global.msgList.reversed.toList();
                          global.newMsg.add(
                            {
                              "massage": global.textEditingController.text,
                              "time": DateFormat.jm().format(DateTime.now()).toString(),
                            },
                          );
                          getData();
                          global.textEditingController.clear();
                        });
                      }
                      // Clipboard.setData
                    },
                    icon: Icon(
                      Icons.send,
                      color: AppColor.perple,
                    )),
            ],
          ),
        ],
      ),
    );
  }

  showModle() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(60)),
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          height: 600,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 70),
                    child: CloseButton(
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  Text(AppText.share, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    leading: Image.asset(
                      AppList.messageUser["messageUser"][index]["iconOne"],
                    ),
                    title: Text(AppList.messageUser["messageUser"][index]["titleOne"], style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                    subtitle: Text(
                      AppList.messageUser["messageUser"][index]["treOne"],
                      style: TextStyle(color: AppColor.black10, fontSize: 11),
                    ),
                    onTap: () {
                      global.tabone[index] = AppList.messageUser["messageUser"][index]["iconOne"];
                      index == 0
                          ? global.pickImage()
                          : index == 1
                              ? global.pickFile()
                              : index == 2
                                  ? Get.to(const PollScreen())
                                  : index == 3
                                      ? global.pickgallary()
                                      : const SizedBox();
                    },
                  ),
                  separatorBuilder: (context, index) => Divider(color: AppColor.black10, indent: 80),
                  itemCount: AppList.messageUser["messageUser"].length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MsgData {
  final String msg;
  final String msgType;
  final String time;

  MsgData({required this.time, required this.msgType, required this.msg});
}
