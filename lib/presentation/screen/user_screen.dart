import 'package:chat_box/presentation/screen/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../utils/App_text.dart';
import '../../utils/app_color.dart';
import '../../utils/app_image.dart';

class UserScreen extends StatefulWidget {
  final String dataone;
  final String datatwo;
  const UserScreen({Key? key, required this.dataone, required this.datatwo}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackButton(
                      color: AppColor.white,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Center(
                      child: Column(
                        children: [
                          Image.asset(widget.dataone, scale: 0.7),
                          Text(
                            widget.datatwo,
                            style: TextStyle(
                              color: AppColor.white,
                              height: 1.5,
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "@${widget.datatwo}",
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: width * 0.03,
                              height: 1.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Get.off(MessageScreen(dataone: widget.dataone, datatwo: widget.datatwo));
                                  },
                                  child: Image.asset(AppImage.mesicon, scale: 0.9)),
                              Image.asset(AppImage.videouser, scale: 0.9),
                              Image.asset(AppImage.calluser, scale: 0.9),
                              Image.asset(AppImage.moreuser, scale: 0.9),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: height * 0.62,
                  width: width,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(height * 0.06),
                    ),
                    color: AppColor.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.4),
                        child: const Icon(Icons.linear_scale_outlined, size: 30),
                      ),
                      Text(
                        AppText.display,
                        style: TextStyle(
                          color: AppColor.black10,
                          fontSize: width * 0.032,
                          height: 2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.datatwo,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: width * 0.04,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        AppText.eaddress,
                        style: TextStyle(
                          color: AppColor.black10,
                          fontSize: width * 0.032,
                          height: 3,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        " ${widget.datatwo}@gmail.com",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: width * 0.04,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        AppText.address,
                        style: TextStyle(
                          color: AppColor.black10,
                          fontSize: width * 0.032,
                          height: 3,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        AppText.street,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: width * 0.04,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        AppText.phone,
                        style: TextStyle(
                          color: AppColor.black10,
                          fontSize: width * 0.032,
                          height: 3,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        AppText.number,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: width * 0.04,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppText.media,
                            style: TextStyle(
                              color: AppColor.black10,
                              fontSize: width * 0.032,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            AppText.view,
                            style: TextStyle(
                              color: AppColor.perple,
                              fontSize: width * 0.032,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImage.userone),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                            child: Image.asset(AppImage.usertwo),
                          ),
                          Image.asset(AppImage.userthree),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
