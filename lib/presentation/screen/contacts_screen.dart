import 'package:chat_box/data/controller/globle_controller.dart';
import 'package:chat_box/presentation/screen/search_screen.dart';
import 'package:chat_box/utils/App_text.dart';
import 'package:chat_box/utils/app_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';
import '../../utils/app_image.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  GlobalController global = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppList.newUser.sort((a, b) => a["data1"].compareTo(b["data1"]));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(height: height * 0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(onTap: () => Get.to(const SearchScreen()), child: Image.asset(AppImage.search)),
                  Text(
                    AppText.contact,
                    style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold, color: AppColor.white),
                  ),
                  Image.asset(AppImage.contact, scale: 0.9),
                ],
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              child: Container(
                height: height * 0.72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(height * 0.06),
                  ),
                  color: AppColor.white,
                ),
                child: Column(
                  children: [
                    const Icon(Icons.linear_scale_outlined, size: 30),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(5),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                          leading: Image.asset(AppList.newUser[index]["botam"]),
                          title: Text(AppList.newUser[index]["data1"], style: const TextStyle(fontWeight: FontWeight.w500)),
                          subtitle: Text(
                            AppList.newUser[index]["data2"],
                            style: TextStyle(color: AppColor.black10, fontSize: 12),
                          ),
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: AppList.newUser.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
