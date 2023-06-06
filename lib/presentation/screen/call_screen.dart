import 'package:chat_box/presentation/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/App_text.dart';
import '../../utils/app_color.dart';
import '../../utils/app_image.dart';
import '../../utils/app_list.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
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
                  GestureDetector(onTap: () => Get.to(SearchScreen()), child: Image.asset(AppImage.search)),
                  Text(
                    AppText.calls,
                    style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold, color: AppColor.white),
                  ),
                  Image.asset(AppImage.calluser, scale: 0.9),
                ],
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: height * 0.68,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(height * 0.06),
                ),
                color: AppColor.white,
              ),
              child: Column(
                children: [
                  const Icon(Icons.linear_scale_outlined, size: 30),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.6),
                    child: Text(
                      AppText.recent,
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        height: 2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                        leading: Image.asset(AppList.callUser["callUser"][index]["imageOne"]),
                        title: Text(AppList.callUser["callUser"][index]["titleOne"], style: const TextStyle(fontWeight: FontWeight.w500)),
                        subtitle: Row(
                          children: [
                            Icon(
                                index == 0 || index == 1
                                    ? Icons.phone_callback_sharp
                                    : index == 3 || index == 5
                                        ? Icons.phone_forwarded_rounded
                                        : Icons.phone_locked,
                                color: index == 0 || index == 1
                                    ? AppColor.perple
                                    : index == 2 || index == 4
                                        ? AppColor.red
                                        : AppColor.blue,
                                size: 20),
                            const SizedBox(width: 10),
                            Text(
                              AppList.callUser["callUser"][index]["treOne"],
                              style: TextStyle(color: AppColor.black10, fontSize: 12),
                            ),
                          ],
                        ),
                        trailing: Wrap(
                          children: [
                            Image.asset(
                              AppImage.call,
                              scale: 0.8,
                              color: AppColor.black10,
                            ),
                            const SizedBox(width: 10),
                            Image.asset(
                              AppImage.videocall,
                              scale: 0.8,
                              color: AppColor.black10,
                            ),
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) => Divider(color: AppColor.black10, indent: width * 0.25),
                      itemCount: AppList.callUser["callUser"].length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
