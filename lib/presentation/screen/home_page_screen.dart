import 'package:chat_box/presentation/screen/call_screen.dart';
import 'package:chat_box/presentation/screen/contacts_screen.dart';
import 'package:chat_box/presentation/screen/group_screen.dart';
import 'package:chat_box/presentation/screen/message_screen.dart';
import 'package:chat_box/presentation/screen/search_screen.dart';
import 'package:chat_box/presentation/screen/setting_screen.dart';
import 'package:chat_box/presentation/widgets/coman_icons.dart';
import 'package:chat_box/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/globle_controller.dart';
import '../../utils/App_text.dart';
import '../../utils/app_color.dart';
import '../../utils/app_list.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  GlobalController global = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: global.tab.value == 0
          ? Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.06),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () => Get.to(const SearchScreen()),
                            child: Image.asset(AppImage.search),
                          ),
                          Text(
                            AppText.home,
                            style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold, color: AppColor.white),
                          ),
                          GestureDetector(onTap: () => Get.to(const GroupScreen()), child: Image.asset(AppImage.homelogo)),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 20),
                        height: height * 0.1,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                AppList.userData["userData"][index]["image"],
                              ),
                              Text(
                                AppList.userData["userData"][index]["data"],
                                style: TextStyle(color: AppColor.white),
                              ),
                            ],
                          ),
                          separatorBuilder: (context, index) => const SizedBox(width: 20),
                          itemCount: AppList.userData["userData"].length,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        height: height * 0.58,
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
                                itemBuilder: (context, index) => Dismissible(
                                  key: UniqueKey(),
                                  background: Container(
                                    color: AppColor.black10,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(Icons.notifications, color: AppColor.black, size: 30),
                                        Icon(Icons.delete, color: AppColor.red, size: 30),
                                      ],
                                    ),
                                  ),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                                    leading: Image.asset(AppList.newUser[index]["botam"]),
                                    title: Text(AppList.newUser[index]["data1"], style: const TextStyle(fontWeight: FontWeight.w500)),
                                    subtitle: Text(
                                      AppList.newUser[index]["data2"],
                                      style: TextStyle(color: AppColor.black10, fontSize: 12),
                                    ),
                                    trailing: Text(
                                      AppList.newUser[index]["data3"],
                                      style: TextStyle(color: AppColor.black10, fontSize: 12),
                                    ),
                                    onTap: () => Get.to(
                                      MessageScreen(
                                        dataone: AppList.newUser[index]["botam"],
                                        datatwo: AppList.newUser[index]["data1"],
                                      ),
                                    ),
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
            )
          : global.tab.value == 1
              ? const CallScreen()
              : global.tab.value == 2
                  ? const ContactScreen()
                  : global.tab.value == 3
                      ? const SettingScreen()
                      : Container(),
      bottomNavigationBar: BottomAppBar(
        child: CommanIcons(
          ColorOne: global.tab.value == 0 ? AppColor.perple : AppColor.black10,
          ColorTwo: global.tab.value == 1 ? AppColor.perple : AppColor.black10,
          ColorThree: global.tab.value == 2 ? AppColor.perple : AppColor.black10,
          ColorFour: global.tab.value == 3 ? AppColor.perple : AppColor.black10,
          onClickOne: () {
            global.tab.value = 0;
            setState(() {});
          },
          onClickTwo: () {
            global.tab.value = 1;
            setState(() {});
          },
          onClickThree: () {
            global.tab.value = 2;
            setState(() {});
          },
          onClickFour: () {
            global.tab.value = 3;
            setState(() {});
          },
        ),
      ),
    );
  }
}
