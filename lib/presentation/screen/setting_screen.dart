<<<<<<< HEAD
import 'package:chat_box/data/controller/globle_controller.dart';
import 'package:chat_box/presentation/screen/one_boarding_screen.dart';
=======
import 'package:chat_box/presentation/screen/one_boarding_screen.dart';
import 'package:chat_box/utils/App_text.dart';
>>>>>>> 15c4d9ddc06f210b80437db3822d78954351e1d4
import 'package:chat_box/utils/app_image.dart';
import 'package:chat_box/utils/app_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../utils/app_color.dart';
import '../../utils/app_list.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  GlobalController global = Get.find();
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BackButton(
                    color: AppColor.white,
                  ),
                  Text(
                    AppText.setting,
                    style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold, color: AppColor.white),
                  ),
                  IconButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Get.off(const OneBoardingScreen());
                      Fluttertoast.showToast(
                        msg: "This Is Id Is LogOut ",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    },
                    icon: Icon(
                      Icons.logout_rounded,
                      color: AppColor.white,
                    ),
                  ),
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(height * 0.06),
                  ),
                  color: AppColor.white),
              child: Column(
                children: [
                  const Icon(Icons.linear_scale_outlined, size: 30),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: width * 0.06),
                    leading: Image.asset(AppImage.homelogo, scale: 0.9),
                    title: Text(
                      AppText.nazrul,
                      style: TextStyle(
                        fontSize: width * 0.044,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(Icons.qr_code_scanner, color: AppColor.perple),
                    subtitle: Text(
                      AppText.nevergive,
                      style: TextStyle(
                        fontSize: width * 0.028,
                        height: 1.5,
                        color: AppColor.black10,
                      ),
                    ),
                  ),
                  Divider(
                    color: AppColor.black10,
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                        leading: Icon(
                          AppList.settingUser["settingUser"][index]["iconOne"],
                        ),
                        title: Text(AppList.settingUser["settingUser"][index]["titleOne"], style: const TextStyle(fontWeight: FontWeight.w500)),
                        subtitle: Text(
                          AppList.settingUser["settingUser"][index]["treOne"],
                          style: TextStyle(color: AppColor.black10, fontSize: 12),
                        ),
                        trailing: index == 1
                            ? SingleChildScrollView(
                                physics: NeverScrollableScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Dark Mode"),
                                    Switch(
                                      value: global.dark,
                                      onChanged: (value) {
                                        setState(() {
                                          global.dark = value;
                                        });
                                        if (value == true) {
                                          Get.changeThemeMode(ThemeMode.dark);
                                        } else {
                                          Get.changeThemeMode(ThemeMode.light);
                                        }
                                      },
                                    )
                                  ],
                                ),
                              )
                            : SizedBox(),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(height: 15),
                      itemCount: AppList.settingUser["settingUser"].length,
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
