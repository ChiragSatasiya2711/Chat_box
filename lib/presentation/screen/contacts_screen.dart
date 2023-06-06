import 'package:chat_box/presentation/screen/search_screen.dart';
import 'package:chat_box/utils/App_text.dart';
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
            Container(
              height: height * 0.7,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(height * 0.06),
                ),
                color: AppColor.white,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 30, left: width * 0.4),
                        child: const Icon(Icons.linear_scale_outlined, size: 30),
                      ),
                      Text(
                        AppText.mycont,
                        style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          AppText.a,
                          style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.15,
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(AppImage.four),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppText.Afrin,
                                      style: TextStyle(
                                        fontSize: width * 0.044,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      AppText.lifeis,
                                      style: TextStyle(
                                        fontSize: width * 0.028,
                                        height: 1.5,
                                        color: AppColor.black10,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(AppImage.three),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppText.Adil,
                                      style: TextStyle(
                                        fontSize: width * 0.044,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      AppText.beyour,
                                      style: TextStyle(
                                        fontSize: width * 0.028,
                                        height: 1.5,
                                        color: AppColor.black10,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          AppText.b,
                          style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.23,
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(AppImage.one),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppText.bristy,
                                      style: TextStyle(
                                        fontSize: width * 0.044,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      AppText.keep,
                                      style: TextStyle(
                                        fontSize: width * 0.028,
                                        height: 1.5,
                                        color: AppColor.black10,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(AppImage.five),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppText.john,
                                      style: TextStyle(
                                        fontSize: width * 0.044,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      AppText.makeyour,
                                      style: TextStyle(fontSize: width * 0.028, height: 1.5, color: AppColor.black10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(AppImage.two),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppText.borsha,
                                      style: TextStyle(
                                        fontSize: width * 0.044,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      AppText.flowers,
                                      style: TextStyle(fontSize: width * 0.028, height: 1.5, color: AppColor.black10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          AppText.s,
                          style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(AppImage.cothree),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppText.sheik,
                                style: TextStyle(
                                  fontSize: width * 0.044,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                AppText.lifeis,
                                style: TextStyle(fontSize: width * 0.028, height: 1.5, color: AppColor.black10),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
